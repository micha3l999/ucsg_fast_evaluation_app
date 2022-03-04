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
DateTime time = DateTime.now();

class FormTwoProvider extends ChangeNotifier {
  final TextEditingController controller1 = TextEditingController(
      text:
          "${time.year}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}");
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();
  final TextEditingController controller7 = TextEditingController();
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
