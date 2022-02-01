import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/providers/form_five_provider.dart';
import 'package:seguridad_evaluacion/src/repository/building_registration.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';
import 'package:seguridad_evaluacion/src/utils/global_functions.dart';

class FormFive extends StatefulWidget {
  const FormFive({Key? key, required this.buildingId, required this.userId})
      : super(key: key);

  final String buildingId;
  final String userId;
  @override
  _FormFiveState createState() => _FormFiveState();
}

class _FormFiveState extends State<FormFive> with GlobalFunctions {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<FormFiveProvider>(builder: (_, provider, child) {
          return Column(
            children: [
              Expanded(
                child: Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Spacer(),
                              Text(
                                "Calificación de la vivienda",
                                style: TextStyle(
                                  fontSize: extraBigFont,
                                  color: Color(primaryColor),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          /// Building qualification by radio inputs section
                          ...buildBuildingQualification(provider),

                          /// Place of the inspection section
                          ...buildInspectionPlace(provider),

                          /// Building address and the name section
                          const Text(
                            "3. Nombre y dirección de la instalación:",
                            style: TextStyle(
                              fontSize: bigFont,
                            ),
                          ),
                          TextField(
                            controller: provider.buildingAddressController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          /// Restriction in the building, by default is N/A
                          const Text(
                            "4. Restricciones presentadas:",
                            style: TextStyle(
                              fontSize: bigFont,
                            ),
                          ),
                          TextField(
                            controller: provider.buildingRestrictionController,
                          ),
                          const SizedBox(
                            height: 32,
                          ),

                          /// Inspector observation section
                          const Text(
                            "5. Observación del inspector:",
                            style: TextStyle(
                              fontSize: bigFont,
                            ),
                          ),
                          TextField(
                            controller: provider.inspectorObservationController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          /// "Building was checked under conditions of emergency to" section
                          const Text(
                            "6. Esta edificación fue inspeccionada bajo condiciones de emergencia para:",
                            style: TextStyle(
                              fontSize: bigFont,
                            ),
                          ),
                          TextField(
                            controller: provider.inspectedForController,
                          ),
                          const SizedBox(
                            height: 32,
                          ),

                          /// Inspector identification section
                          Row(
                            children: const [
                              Spacer(),
                              Text(
                                " C.I. del Inspector / Agencia",
                                style: TextStyle(
                                  fontSize: bigFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: provider
                                      .inspectorIdentificationController,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Spacer(),
                    PrimaryButton(
                        buttonText: "Enviar Calificación",
                        onTap: () async {
                          if (provider
                              .inspectorIdentificationController.text.isEmpty) {
                            await informationDialog(context,
                                title:
                                    "No se encontró la identificación del inspector");
                            return;
                          }
                          changeLoading();
                          Map
                              responseRepository =
                              await BuildingRegistrationRepository
                                  .updateBuildingRegistration(
                                      radioToString(
                                          provider.radioValueQualification),
                                      radioToString(
                                          provider.radioValueInspectionPlace),
                                      provider.buildingAddressController.text,
                                      provider
                                          .buildingRestrictionController.text,
                                      provider
                                          .inspectorObservationController.text,
                                      provider.inspectedForController.text,
                                      provider.inspectorIdentificationController
                                          .text,
                                      widget.buildingId,
                                      widget.userId);
                          changeLoading();

                          // Show dialog depends on answer
                          if (responseRepository["success"]) {
                            await informationDialog(context,
                                title: "Edificación calificada exitosamente");
                            Navigator.of(context).pop();
                          } else {
                            await informationDialog(context,
                                title:
                                    "Hubo un problema al registrar la edificación, intentalo nuevamente");
                          }
                        }),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        }),
        ValueListenableBuilder<bool>(
            valueListenable: _loading,
            builder: (context, value, child) {
              if (value)
                return Container(
                  color: const Color.fromRGBO(255, 255, 255, 0.7),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              return Container();
            }),
      ],
    );
  }

  buildBuildingQualification(FormFiveProvider provider) {
    return [
      const Text(
        "1. ¿Como calificaría a la vivienda?",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      ListTile(
        title: const Text("Inspeccionado"),
        leading: Radio<BuildingQualification>(
          groupValue: provider.radioValueQualification,
          value: BuildingQualification.Chequeado,
          onChanged: (BuildingQualification? value) {
            provider.changeRadioValueQualification(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Inseguro"),
        leading: Radio<BuildingQualification>(
          groupValue: provider.radioValueQualification,
          value: BuildingQualification.Inseguro,
          onChanged: (BuildingQualification? value) {
            provider.changeRadioValueQualification(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Uso restringido"),
        leading: Radio<BuildingQualification>(
          groupValue: provider.radioValueQualification,
          value: BuildingQualification.Uso_restringido,
          onChanged: (BuildingQualification? value) {
            provider.changeRadioValueQualification(value);
          },
        ),
      ),
    ];
  }

  buildInspectionPlace(FormFiveProvider provider) {
    return [
      const Text(
        "2. Lugar de la inspección:",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      ListTile(
        title: const Text("Interior"),
        leading: Radio<InspectionPlace>(
          groupValue: provider.radioValueInspectionPlace,
          value: InspectionPlace.Interior,
          onChanged: (InspectionPlace? value) {
            provider.changeRadioValueInspectionPlace(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Exterior"),
        leading: Radio<InspectionPlace>(
          groupValue: provider.radioValueInspectionPlace,
          value: InspectionPlace.Exterior,
          onChanged: (InspectionPlace? value) {
            provider.changeRadioValueInspectionPlace(value);
          },
        ),
      ),
    ];
  }

  changeLoading() {
    setState(() {
      _loading.value = !_loading.value;
    });
  }
}
