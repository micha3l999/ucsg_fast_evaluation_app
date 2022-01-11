import 'package:flutter/material.dart';
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
              const Text(
                "9. ¿Existen pendientes o escombros?",
                style: TextStyle(
                  fontSize: bigFont,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "10. ¿Existen fisuras o movimientos de la tierra?",
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
