import 'package:flutter/material.dart';

enum BuildingQualification {
  Chequeado,
  Inseguro,
  Uso_restringido,
}

enum InspectionPlace {
  Interior,
  Exterior,
}

class FormFiveProvider extends ChangeNotifier {
  BuildingQualification? radioValueQualification =
      BuildingQualification.Chequeado;

  InspectionPlace? radioValueInspectionPlace = InspectionPlace.Exterior;

  final TextEditingController buildingAddressController =
      TextEditingController();

  final TextEditingController inspectorObservationController =
      TextEditingController();

  final TextEditingController buildingRestrictionController =
      TextEditingController();

  final TextEditingController inspectedForController = TextEditingController();

  final TextEditingController inspectorIdentificationController =
      TextEditingController();

  changeRadioValueQualification(BuildingQualification? value) {
    radioValueQualification = value;
    notifyListeners();
  }

  changeRadioValueInspectionPlace(InspectionPlace? value) {
    radioValueInspectionPlace = value;
    notifyListeners();
  }
}
