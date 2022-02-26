import 'package:flutter/material.dart';

enum StructureTypeOne { Ubicacion_Del_Edificio, Descripcion_Del_Edifico, Caracteristicas_Estructurales }

class FormOneProvider extends ChangeNotifier {
  StructureTypeOne? radioValue = StructureTypeOne.Ubicacion_Del_Edificio;

  set radioValueSetter(StructureTypeOne? value) {
    radioValue = value;
    notifyListeners();
  }
}
