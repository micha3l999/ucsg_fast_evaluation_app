import 'package:flutter/material.dart';

enum StructureType { house, building, department }

class FormOneProvider extends ChangeNotifier {
  StructureType? radioValue = StructureType.house;

  void changeStructure(StructureType type) {
    radioValue = type;
    notifyListeners();
  }
}
