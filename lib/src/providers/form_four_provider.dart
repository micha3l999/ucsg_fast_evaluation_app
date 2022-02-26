import 'package:flutter/material.dart';

enum Slopes {
  Ejes_Verticales_Discontinuas,
  Piso_debil,
  Columna_Corta,
  Torsional,
  Retroceso_en_esquinas,
  Discontinuidad_Sistemas_De_Pisos,
  Ejes_Estructurales_No_Paralelos,
}

enum Cracks {
  Danos_Estructurales_En_Vigas,
  Danos_Estructurales_En_Columnas,
  Danos_Estructurales_En_Losas,
  Danos_Estructurales_En_Conexiones,
  Danos_Estructurales_En_Muros,
  Danos_Estructurales_En_Cubiertas,
  Danos_En_Paredes,
  Asentamientos_Diferenciales,
}

class FormFourProvider extends ChangeNotifier {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  Slopes? radioValueSlopes = Slopes.Ejes_Verticales_Discontinuas;
  Cracks? radioValueCracks = Cracks.Danos_Estructurales_En_Vigas;

  changeRadioValueSlopes(Slopes? value) {
    radioValueSlopes = value;
    notifyListeners();
  }

  changeRadioValueCracks(Cracks? value) {
    radioValueCracks = value;
    notifyListeners();
  }
}
