import 'package:flutter/material.dart';

enum Gas { Si, No }

enum Electricity { Si, No }

class FormThreeProvider extends ChangeNotifier {
  final TextEditingController controllerCoating = TextEditingController();
  final TextEditingController controllerIllumination = TextEditingController();
  final TextEditingController controllerDepartures = TextEditingController();

  Gas? radioValueGas = Gas.Si;
  Electricity? radioValueElectricity = Electricity.Si;

  changeRadioValueGas(Gas? value) {
    radioValueGas = value;
    notifyListeners();
  }

  changeRadioValueElectricity(Electricity? value) {
    radioValueElectricity = value;
    notifyListeners();
  }
}
