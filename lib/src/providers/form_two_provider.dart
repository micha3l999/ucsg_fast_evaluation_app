import 'package:flutter/material.dart';

enum StructureType {
  metalCovers,
  corrugatedFiberCementRoofing,
  asphaltTileRoofs,
  selfSupportingRoofs,
  polycarbonateCovers,
}

enum ColumnStructures {
  concrete,
  steel,
  wood,
}

enum WallStructure {
  concrete,
  wood,
  brick,
  stone,
}

enum Pre { yes, no }

class FormTwoProvider extends ChangeNotifier {
  StructureType? radioValueRoof = StructureType.metalCovers;
  ColumnStructures? radioValueColumn = ColumnStructures.concrete;
  WallStructure? radioValueWall = WallStructure.concrete;
  Pre? radioValuePre = Pre.yes;

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
