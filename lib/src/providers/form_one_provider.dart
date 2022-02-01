import 'package:flutter/material.dart';

enum StructureType { Casa, Edificio, Departamento }

class FormOneProvider extends ChangeNotifier {
  StructureType? radioValue = StructureType.Casa;

  set radioValueSetter(StructureType? value) {
    radioValue = value;
    notifyListeners();
  }
}
