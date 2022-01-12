import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_five_provider.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class FormFive extends StatefulWidget {
  const FormFive({Key? key}) : super(key: key);

  @override
  _FormFiveState createState() => _FormFiveState();
}

class _FormFiveState extends State<FormFive> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormFiveProvider>(builder: (_, provider, child) {
      return Card(
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
                        controller: provider.inspectorIdentificationController,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      );
    });
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
          value: BuildingQualification.checked,
          onChanged: (BuildingQualification? value) {
            provider.changeRadioValueQualification(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Inseguro"),
        leading: Radio<BuildingQualification>(
          groupValue: provider.radioValueQualification,
          value: BuildingQualification.insecure,
          onChanged: (BuildingQualification? value) {
            provider.changeRadioValueQualification(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Uso restringido"),
        leading: Radio<BuildingQualification>(
          groupValue: provider.radioValueQualification,
          value: BuildingQualification.restrictedUse,
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
          value: InspectionPlace.inside,
          onChanged: (InspectionPlace? value) {
            provider.changeRadioValueInspectionPlace(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Exterior"),
        leading: Radio<InspectionPlace>(
          groupValue: provider.radioValueInspectionPlace,
          value: InspectionPlace.outside,
          onChanged: (InspectionPlace? value) {
            provider.changeRadioValueInspectionPlace(value);
          },
        ),
      ),
    ];
  }
}
