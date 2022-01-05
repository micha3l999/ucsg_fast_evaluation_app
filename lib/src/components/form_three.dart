import 'package:flutter/material.dart';
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
                  fontSize: extraBigFont,
                  color: Color(primaryColor),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(

              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
