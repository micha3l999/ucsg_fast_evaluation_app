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
                        "Descripcion de la construcción",
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
                  " 1. Numero de Niveles Altos o Numero de niveles Bajos // Indique La Altura de entrepisos de ser posible",
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
                  " 2. Indique el area de planta baja",
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
                  " 3. Indique el area de planta Alta",
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
                const Text(
                  " 4. Edad de la estructura ",
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
        "5. Ocupacion primaria de la estructura",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Vivienda"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Vivienda,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Asamblea Publica"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType. Asamblea_Publica,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Servicios De Emergencia"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Servicios_De_Emergencia,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Comercial"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Comercial,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Oficinas"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Oficinas,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Industrial"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Industrial,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Gobierno"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Gobierno,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Historico"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Historico,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Educativo"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Historico,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
    ];
  }

  buildElectricitySelection(FormThreeProvider provider) {
    return [
      const Text(
        " 6. Tipo de construccion",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Informal"),
        leading: Radio<Electricity>(
          groupValue: provider.radioValueElectricity,
          value: Electricity.informal,
          onChanged: (Electricity? value) {
            provider.changeRadioValueElectricity(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Tecnica"),
        leading: Radio<Electricity>(
          groupValue: provider.radioValueElectricity,
          value: Electricity.tecnica,
          onChanged: (Electricity? value) {
            provider.changeRadioValueElectricity(value);
          },
        ),
      ),
    ];
  }
}
