import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

enum StructureType { house, building, department }

class FormOne extends StatefulWidget {
  const FormOne({Key? key}) : super(key: key);

  @override
  State<FormOne> createState() => _FormOneState();
}

class _FormOneState extends State<FormOne> {
  StructureType? _radioValue = StructureType.house;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  Flexible(
                    flex: 4,
                    child: const Text(
                      "Indique la edificación que desea registrar",
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
                title: Text("Casa"),
                leading: Radio<StructureType>(
                  groupValue: _radioValue,
                  value: StructureType.house,
                  onChanged: (StructureType? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Edificio"),
                leading: Radio<StructureType>(
                  groupValue: _radioValue,
                  value: StructureType.building,
                  onChanged: (StructureType? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Departamento"),
                leading: Radio<StructureType>(
                  groupValue: _radioValue,
                  value: StructureType.department,
                  onChanged: (StructureType? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
