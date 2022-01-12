import 'package:flutter/material.dart';

enum StructureType { house, building, department }

class FormOneProvider extends ChangeNotifier {
  StructureType? radioValue = StructureType.house;

  set radioValueSetter(StructureType? value) {
    radioValue = value;
    notifyListeners();
  }
}
