import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seguridad_evaluacion/src/providers/form_one_provider.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class FormOne extends StatefulWidget {
  const FormOne({Key? key}) : super(key: key);

  @override
  State<FormOne> createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormOneProvider>(builder: (_, provider, child) {
      return Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: const [
                    Spacer(),
                    Flexible(
                      flex: 4,
                      child: Text(
                        "Ingrese los datos de la Edificacion",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: extraBigFont,
                          color: Color(primaryColor),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  title: const Text("Ubicacion Del Edificio"),
                  leading: Radio<StructureTypeOne>(
                    groupValue: provider.radioValue,
                    value: StructureTypeOne.Ubicacion_Del_Edificio,
                    onChanged: (StructureTypeOne? value) {
                      provider.radioValueSetter = value;
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Descripcion Del Edifico"),
                  leading: Radio<StructureTypeOne>(
                    groupValue: provider.radioValue,
                    value: StructureTypeOne.Descripcion_Del_Edifico,
                    onChanged: (StructureTypeOne? value) {
                      provider.radioValueSetter = value;
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Caracteristicas Estructurales"),
                  leading: Radio<StructureTypeOne>(
                    groupValue: provider.radioValue,
                    value: StructureTypeOne.Caracteristicas_Estructurales,
                    onChanged: (StructureTypeOne? value) {
                      provider.radioValueSetter = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
