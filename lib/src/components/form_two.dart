import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_two_provider.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class FormTwo extends StatefulWidget {
  const FormTwo({Key? key}) : super(key: key);

  @override
  State<FormTwo> createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormTwoProvider>(builder: (_, provider, child) {
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
                      "Estructura de la vivienda",
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
                ...buildRoofStructure(provider),
                const SizedBox(
                  height: 8,
                ),
                ...buildColumnStructure(provider),
                ...buildWallStructureForm(provider),
                ...buildPreConnection(provider),
              ],
            ),
          ),
        ),
      );
    });
  }

  buildRoofStructure(FormTwoProvider provider) {
    return [
      const Text(
        " 1. Indique el material del techo",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Cubiertas metálicas"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Cubiertas_de_metal,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Cubiertas onduladas de fibrocemento"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Techos_de_fibrocemento_corrugado,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Cubiertas de tejas asfálticas"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Techos_de_tejas_de_asfalto,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Cubiertas autoportantes"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Techos_autoportantes,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Cubiertas de policarbonato"),
        leading: Radio<StructureType>(
          groupValue: provider.radioValueRoof,
          value: StructureType.Cubiertas_de_policarbonato,
          onChanged: (StructureType? value) {
            provider.changeRadioValueRoof(value);
          },
        ),
      ),
    ];
  }

  buildColumnStructure(FormTwoProvider provider) {
    return [
      const Text(
        " 2. Indique el material usado para las columnas",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Concreto"),
        leading: Radio<ColumnStructures>(
          groupValue: provider.radioValueColumn,
          value: ColumnStructures.Concreto,
          onChanged: (ColumnStructures? value) {
            provider.changeRadioValueColumn(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Acero"),
        leading: Radio<ColumnStructures>(
          groupValue: provider.radioValueColumn,
          value: ColumnStructures.Acero,
          onChanged: (ColumnStructures? value) {
            provider.changeRadioValueColumn(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Madera"),
        leading: Radio<ColumnStructures>(
          groupValue: provider.radioValueColumn,
          value: ColumnStructures.Madera,
          onChanged: (ColumnStructures? value) {
            provider.changeRadioValueColumn(value);
          },
        ),
      ),
    ];
  }

  buildWallStructureForm(FormTwoProvider provider) {
    return [
      const Text(
        " 3. De que material estan construidas las paredes",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Concreto"),
        leading: Radio<WallStructure>(
          groupValue: provider.radioValueWall,
          value: WallStructure.Concreto,
          onChanged: (WallStructure? value) {
            provider.changeRadioValueWall(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Madera"),
        leading: Radio<WallStructure>(
          groupValue: provider.radioValueWall,
          value: WallStructure.Madera,
          onChanged: (WallStructure? value) {
            provider.changeRadioValueWall(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Ladrillo"),
        leading: Radio<WallStructure>(
          groupValue: provider.radioValueWall,
          value: WallStructure.Ladrillo,
          onChanged: (WallStructure? value) {
            provider.changeRadioValueWall(value);
          },
        ),
      ),
      ListTile(
        title: const Text("Piedra"),
        leading: Radio<WallStructure>(
          groupValue: provider.radioValueWall,
          value: WallStructure.Piedra,
          onChanged: (WallStructure? value) {
            provider.changeRadioValueWall(value);
          },
        ),
      ),
    ];
  }

  buildPreConnection(FormTwoProvider provider) {
    return [
      const Text(
        " 4. Existen conexiones prefabricadas?",
        style: TextStyle(
          fontSize: bigFont,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      ListTile(
        title: const Text("Sí"),
        leading: Radio<Pre>(
          groupValue: provider.radioValuePre,
          value: Pre.Si,
          onChanged: (Pre? value) {
            provider.changeRadioValuePre(value);
          },
        ),
      ),
      ListTile(
        title: const Text("No"),
        leading: Radio<Pre>(
          groupValue: provider.radioValuePre,
          value: Pre.No,
          onChanged: (Pre? value) {
            provider.changeRadioValuePre(value);
          },
        ),
      ),
    ];
  }
}
