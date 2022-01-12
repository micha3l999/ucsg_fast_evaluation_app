import 'package:flutter/material.dart';

enum Gas { yes, no }

enum Electricity { yes, no }

class FormThreeProvider extends ChangeNotifier {
  final TextEditingController controllerCoating = TextEditingController();
  final TextEditingController controllerIllumination = TextEditingController();
  final TextEditingController controllerDepartures = TextEditingController();

  Gas? radioValueGas = Gas.yes;
  Electricity? radioValueElectricity = Electricity.yes;

  changeRadioValueGas(Gas? value) {
    radioValueGas = value;
    notifyListeners();
  }

  changeRadioValueElectricity(Electricity? value) {
    radioValueElectricity = value;
    notifyListeners();
  }
}
