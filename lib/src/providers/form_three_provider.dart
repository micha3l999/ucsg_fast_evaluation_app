import 'package:flutter/material.dart';
enum StructureType {
  Vivienda,
  Asamblea_Publica,
  Servicios_De_Emergencia,
  Comercial,
  Oficinas,
  Industrial,
  Gobierno,
  Historico,
  Educativo,
}
enum Gas { Si, No }

enum Electricity { informal, tecnica }

class FormThreeProvider extends ChangeNotifier {
  final TextEditingController controllerCoating = TextEditingController();
  final TextEditingController controllerIllumination = TextEditingController();
  final TextEditingController controllerDepartures = TextEditingController();
  final TextEditingController controller1 = TextEditingController();

  StructureType? radioValueRoof = StructureType.Vivienda;
  Gas? radioValueGas = Gas.Si;
  Electricity? radioValueElectricity = Electricity.informal;

  changeRadioValueRoof(StructureType? value) {
    radioValueRoof = value;
    notifyListeners();
  }
  changeRadioValueGas(Gas? value) {
    radioValueGas = value;
    notifyListeners();
  }

  changeRadioValueElectricity(Electricity? value) {
    radioValueElectricity = value;
    notifyListeners();
  }
}
