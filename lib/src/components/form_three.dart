import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_three_provider.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class FormThree extends StatefulWidget {
  const FormThree({Key? key}) : super(key: key);

  @override
  _FormThreeState createState() => _FormThreeState();
}

class _FormThreeState extends State<FormThree> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormThreeProvider>(builder: (_, provider, child) {
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
                      "Profundidad de la construcción",
                      style: TextStyle(
                        fontSize: extraBigFont,
                        color: Color(primaryColor),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  " 6. Indique que estan hechos los revestimientos",
                  style: TextStyle(
                    fontSize: bigFont,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: provider.controllerCoating,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  " 7. Indique techos o artefactos de iluminación",
                  style: TextStyle(
                    fontSize: bigFont,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: provider.controllerIllumination,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  " 8. Indique cuantas escaleras y salidas",
                  style: TextStyle(
                    fontSize: bigFont,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: provider.controllerDepartures,
                ),
                const SizedBox(
                  height: 8,
                ),
                ...buildGasSelection(provider),
                ...buildElectricitySelection(provider),
              ],
            ),
          ),
        ),
      );
    });
  }

  buildGasSelection(FormThreeProvider provider) {
    return [
      const Text(
        " 9. ¿Tiene gas en la edificación?",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Sí"),
        leading: Radio<Gas>(
          groupValue: provider.radioValueGas,
          value: Gas.yes,
          onChanged: (Gas? value) {
            provider.changeRadioValueGas(value);
          },
        ),
      ),
      ListTile(
        title: const Text("No"),
        leading: Radio<Gas>(
          groupValue: provider.radioValueGas,
          value: Gas.no,
          onChanged: (Gas? value) {
            provider.changeRadioValueGas(value);
          },
        ),
      ),
    ];
  }

  buildElectricitySelection(FormThreeProvider provider) {
    return [
      const Text(
        " 10. ¿Tiene electricidad en la edificación?",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Sí"),
        leading: Radio<Electricity>(
          groupValue: provider.radioValueElectricity,
          value: Electricity.yes,
          onChanged: (Electricity? value) {
            provider.changeRadioValueElectricity(value);
          },
        ),
      ),
      ListTile(
        title: const Text("No"),
        leading: Radio<Electricity>(
          groupValue: provider.radioValueElectricity,
          value: Electricity.no,
          onChanged: (Electricity? value) {
            provider.changeRadioValueElectricity(value);
          },
        ),
      ),
    ];
  }
}
