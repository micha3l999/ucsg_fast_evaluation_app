import 'package:flutter/material.dart';

enum Slopes {
  yes,
  no,
}

enum Cracks {
  yes,
  no,
}

class FormFourProvider extends ChangeNotifier {
  Slopes? radioValueSlopes = Slopes.no;
  Cracks? radioValueCracks = Cracks.no;

  changeRadioValueSlopes(Slopes? value) {
    radioValueSlopes = value;
    notifyListeners();
  }

  changeRadioValueCracks(Cracks? value) {
    radioValueCracks = value;
    notifyListeners();
  }
}
