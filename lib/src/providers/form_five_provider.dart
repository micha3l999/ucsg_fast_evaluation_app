import 'package:flutter/material.dart';

enum BuildingQualification {
  checked,
  insecure,
  restrictedUse,
}

enum InspectionPlace {
  inside,
  outside,
}

class FormFiveProvider extends ChangeNotifier {
  BuildingQualification? radioValueQualification =
      BuildingQualification.checked;

  InspectionPlace? radioValueInspectionPlace = InspectionPlace.outside;

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
