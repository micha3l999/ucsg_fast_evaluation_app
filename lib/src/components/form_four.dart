import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_four_provider.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class FormFour extends StatefulWidget {
  const FormFour({Key? key}) : super(key: key);

  @override
  _FormFourState createState() => _FormFourState();
}

class _FormFourState extends State<FormFour> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormFourProvider>(builder: (_, provider, child) {
      return Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Spacer(),
                    Text(
                      "Caracteristicas de la estructura",
                      style: TextStyle(
                        color: Color(primaryColor),
                        fontSize: extraBigFont,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  " 1. Indique la distancia entre columnas",
                  style: TextStyle(
                    fontSize: bigFont,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: provider.controller1,
                ),
                const Text(
                  " 2. Indique numero de columnas",
                  style: TextStyle(
                    fontSize: bigFont,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: provider.controller2,
                ),
                const Text(
                  " 3. Indique cuantos muros tiene la estructura",
                  style: TextStyle(
                    fontSize: bigFont,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: provider.controller3,
                ),
                ...buildSlopes(provider),
                ...buildCracks(provider),
              ],
            ),
          ),
        ),
      );
    });
  }

  buildSlopes(FormFourProvider provider) {
    return [
      const Text(
        " 4. ¿Existen irregularidades?",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Ejes Verticales Discontinuas"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Ejes_Verticales_Discontinuas,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Piso debil"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Piso_debil,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Columna Corta"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Columna_Corta,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Torsional"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Torsional,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Retroceso en esquinas"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Retroceso_en_esquinas,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Discontinuidad Sistemas De Pisos"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Discontinuidad_Sistemas_De_Pisos,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Ejes Estructurales No Paralelos"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Ejes_Estructurales_No_Paralelos,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
    ];
  }

  buildCracks(FormFourProvider provider) {
    return [
      const Text(
        "5. Daños Observados",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Daños Estructurales En Vigas"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Danos_Estructurales_En_Vigas,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Daños Estructurales En Columnas"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Danos_Estructurales_En_Columnas,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Daños Estructurales En Losas"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Danos_Estructurales_En_Losas,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Daños_Estructurales_En_Conexiones"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Danos_Estructurales_En_Conexiones,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Daños Estructurales En Muros"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Danos_Estructurales_En_Muros,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Daños Estructurales En Cubiertas"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Danos_Estructurales_En_Cubiertas,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Daños En Paredes"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks. Danos_En_Paredes,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Asentamientos Diferenciales"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Asentamientos_Diferenciales,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
    ];
  }
}
