import 'package:flutter/material.dart';

enum StructureType {
  Cubiertas_de_metal,
  Techos_de_fibrocemento_corrugado,
  Techos_de_tejas_de_asfalto,
  Techos_autoportantes,
  Cubiertas_de_policarbonato,
}

enum ColumnStructures {
  Concreto,
  Acero,
  Madera,
}

enum WallStructure {
  Concreto,
  Madera,
  Ladrillo,
  Piedra,
}

enum Pre { Si, No }

class FormTwoProvider extends ChangeNotifier {
  StructureType? radioValueRoof = StructureType.Cubiertas_de_metal;
  ColumnStructures? radioValueColumn = ColumnStructures.Concreto;
  WallStructure? radioValueWall = WallStructure.Concreto;
  Pre? radioValuePre = Pre.Si;

  changeRadioValueRoof(StructureType? value) {
    radioValueRoof = value;
    notifyListeners();
  }

  changeRadioValueColumn(ColumnStructures? value) {
    radioValueColumn = value;
    notifyListeners();
  }

  changeRadioValueWall(WallStructure? value) {
    radioValueWall = value;
    notifyListeners();
  }

  changeRadioValuePre(Pre? value) {
    radioValuePre = value;
    notifyListeners();
  }
}
