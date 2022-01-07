import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

enum BuildingQualification {
  checked,
  insecure,
  restrictedUse,
}

enum InspectionPlace {
  inside,
  outside,
}

class FormFive extends StatefulWidget {
  const FormFive({Key? key}) : super(key: key);

  @override
  _FormFiveState createState() => _FormFiveState();
}

class _FormFiveState extends State<FormFive> {
  BuildingQualification? _radioValueQualification =
      BuildingQualification.checked;

  InspectionPlace? _radioValueInspectionPlace = InspectionPlace.outside;

  final TextEditingController _buildingAddressController =
      TextEditingController();

  final TextEditingController _inspectorObservationController =
      TextEditingController();

  final TextEditingController _buildingRestrictionController =
      TextEditingController();

  final TextEditingController _inspectedForController = TextEditingController();

  final TextEditingController _inspectorIdentificationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              const Text(
                "1. ¿Como calificaría a la vivienda?",
                style: TextStyle(
                  fontSize: bigFont,
                ),
              ),
              ListTile(
                title: const Text("Inspeccionado"),
                leading: Radio<BuildingQualification>(
                  groupValue: _radioValueQualification,
                  value: BuildingQualification.checked,
                  onChanged: (BuildingQualification? value) {
                    setState(() {
                      _radioValueQualification = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Inseguro"),
                leading: Radio<BuildingQualification>(
                  groupValue: _radioValueQualification,
                  value: BuildingQualification.insecure,
                  onChanged: (BuildingQualification? value) {
                    setState(() {
                      _radioValueQualification = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Uso restringido"),
                leading: Radio<BuildingQualification>(
                  groupValue: _radioValueQualification,
                  value: BuildingQualification.restrictedUse,
                  onChanged: (BuildingQualification? value) {
                    setState(() {
                      _radioValueQualification = value;
                    });
                  },
                ),
              ),

              /// Place of the inspection section
              const Text(
                "2. Lugar de la inspección:",
                style: TextStyle(
                  fontSize: bigFont,
                ),
              ),
              ListTile(
                title: Text("Interior"),
                leading: Radio<InspectionPlace>(
                  groupValue: _radioValueInspectionPlace,
                  value: InspectionPlace.inside,
                  onChanged: (InspectionPlace? value) {
                    setState(() {
                      _radioValueInspectionPlace = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Exterior"),
                leading: Radio<InspectionPlace>(
                  groupValue: _radioValueInspectionPlace,
                  value: InspectionPlace.outside,
                  onChanged: (InspectionPlace? value) {
                    setState(() {
                      _radioValueInspectionPlace = value;
                    });
                  },
                ),
              ),

              /// Building address and the name section
              const Text(
                "3. Nombre y dirección de la instalación:",
                style: TextStyle(
                  fontSize: bigFont,
                ),
              ),
              TextField(
                controller: _buildingAddressController,
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
                controller: _buildingRestrictionController,
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
                controller: _inspectorObservationController,
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
                controller: _inspectedForController,
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
              TextField(
                keyboardType: TextInputType.number,
                controller: _inspectorIdentificationController,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
