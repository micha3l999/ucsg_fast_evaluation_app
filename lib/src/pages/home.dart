import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/pages/evaluation_form.dart';
import 'package:seguridad_evaluacion/src/pages/profile.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evaluación Rápida"),
        backgroundColor: Color(primaryColor),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                buttonText: "Registar edificación",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const EvaluationForm()));
                }),
            const SizedBox(
              height: 8,
            ),
            PrimaryButton(buttonText: "Consultar datos", onTap: () {}),
            const SizedBox(
              height: 8,
            ),
            PrimaryButton(
                buttonText: "Administrar perfil",
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => UserProfile()));
                }),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
