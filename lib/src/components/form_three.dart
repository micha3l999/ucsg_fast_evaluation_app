import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

enum Gas { yes, no }

enum Electricity { yes, no }

class FormThree extends StatefulWidget {
  const FormThree({Key? key}) : super(key: key);

  @override
  _FormThreeState createState() => _FormThreeState();
}

class _FormThreeState extends State<FormThree> {
  final TextEditingController _controllerCoating = TextEditingController();
  final TextEditingController _controllerIllumination = TextEditingController();
  final TextEditingController _controllerDepartures = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                controller: _controllerCoating,
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
              TextField(),
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
              TextField(),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
