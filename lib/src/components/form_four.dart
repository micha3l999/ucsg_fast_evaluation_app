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
                      "Geotécnico",
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
        " 11. ¿Existen pendientes o escombros?",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Sí"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.Si,
          onChanged: (Slopes? value) {
            provider.changeRadioValueSlopes(value);
          },
        ),
      ),
      ListTile(
        title: const Text("No"),
        leading: Radio<Slopes>(
          groupValue: provider.radioValueSlopes,
          value: Slopes.No,
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
        " 12. ¿Existen fisuras o movimientos de la tierra?",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Sí"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.Si,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
      ListTile(
        title: const Text("No"),
        leading: Radio<Cracks>(
          groupValue: provider.radioValueCracks,
          value: Cracks.No,
          onChanged: (Cracks? value) {
            provider.changeRadioValueCracks(value);
          },
        ),
      ),
    ];
  }
}
