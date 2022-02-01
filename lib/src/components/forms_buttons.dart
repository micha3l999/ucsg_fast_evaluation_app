import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/providers/form_five_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_four_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_one_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_three_provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_two_provider.dart';
import 'package:seguridad_evaluacion/src/repository/building_registration.dart';
import 'package:seguridad_evaluacion/src/utils/global_functions.dart';

class FormButtons extends StatefulWidget {
  const FormButtons(
      {Key? key,
      required this.initializeController,
      required this.currentPage,
      required this.updateCurrentValue,
      required this.pageController,
      required this.updateLoading})
      : super(key: key);

  final Future<void> Function() initializeController;
  final void Function(double value) updateCurrentValue;
  final void Function() updateLoading;
  final double currentPage;
  final PageController pageController;

  @override
  State<FormButtons> createState() => _FormButtonsState();
}

class _FormButtonsState extends State<FormButtons> with GlobalFunctions {
  late FormOneProvider formOneProvider;

  late FormTwoProvider formTwoProvider;

  late FormThreeProvider formThreeProvider;

  late FormFourProvider formFourProvider;

  late FormFiveProvider formFiveProvider;

  @override
  void initState() {
    super.initState();

    // Init providers of form parts
    formOneProvider = Provider.of<FormOneProvider>(context, listen: false);
    formTwoProvider = Provider.of<FormTwoProvider>(context, listen: false);
    formThreeProvider = Provider.of<FormThreeProvider>(context, listen: false);
    formFourProvider = Provider.of<FormFourProvider>(context, listen: false);
    formFiveProvider = Provider.of<FormFiveProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.currentPage != 0)
          FutureBuilder(
            future: widget.initializeController(),
            builder: (_, AsyncSnapshot snap) {
              if (!snap.hasData || widget.currentPage == 0) {
                /// Just return a placeholder widget, here it's nothing but you have to return something to avoid errors
                return const SizedBox();
              }

              return PrimaryButton(
                  buttonText: "Anterior",
                  onTap: () async {
                    await widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut);
                    widget.updateCurrentValue(widget.pageController.page!);
                  });
            },
          ),
        const Spacer(),
        PrimaryButton(
            buttonText: widget.currentPage >= 4 ? "Enviar" : "Siguiente",
            onTap: () async {
              await widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
              if (widget.currentPage != 4) {
                widget.updateCurrentValue(widget.pageController.page!);
              } else if (widget.currentPage >= 4) {
                widget.updateLoading();
                sendData();
                widget.updateLoading();
              }
            }),
      ],
    );
  }

  Future sendData() async {
    // Send request and show loading in the form registration
    this.widget.updateLoading();
    Map response = await BuildingRegistrationRepository.sendRegistrationInfo(
        radioToString(formOneProvider.radioValue),
        radioToString(formTwoProvider.radioValueRoof),
        radioToString(formTwoProvider.radioValueColumn),
        radioToString(formTwoProvider.radioValueWall),
        radioToString(formTwoProvider.radioValuePre),
        formThreeProvider.controllerCoating.text,
        formThreeProvider.controllerIllumination.text,
        formThreeProvider.controllerDepartures.text,
        radioToString(formThreeProvider.radioValueGas),
        radioToString(formThreeProvider.radioValueElectricity),
        radioToString(formFourProvider.radioValueSlopes),
        radioToString(formFourProvider.radioValueCracks),
        radioToString(formFiveProvider.radioValueQualification),
        radioToString(formFiveProvider.radioValueInspectionPlace),
        formFiveProvider.buildingAddressController.text,
        formFiveProvider.buildingRestrictionController.text,
        formFiveProvider.inspectorObservationController.text,
        formFiveProvider.inspectedForController.text,
        formFiveProvider.inspectorIdentificationController.text);
    this.widget.updateLoading();

    // Show dialog depends on answer
    if (response["success"]) {
      await informationDialog(context,
          title: "Edificación registrada correctamente");
      Navigator.of(context).pop();
    } else if (response["conflict"] == "INSPECTOR_IDENTIFICATION") {
      await informationDialog(context,
          title: "No se encontró la identificación del inspector");
    } else {
      await informationDialog(context,
          title: "Hubo un problema al registrar la edificación");
    }
  }
}
