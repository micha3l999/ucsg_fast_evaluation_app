import 'package:flutter/material.dart';

enum Slopes {
  Si,
  No,
}

enum Cracks {
  Si,
  No,
}

class FormFourProvider extends ChangeNotifier {
  Slopes? radioValueSlopes = Slopes.No;
  Cracks? radioValueCracks = Cracks.No;

  changeRadioValueSlopes(Slopes? value) {
    radioValueSlopes = value;
    notifyListeners();
  }

  changeRadioValueCracks(Cracks? value) {
    radioValueCracks = value;
    notifyListeners();
  }
}
