import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seguridad_evaluacion/src/pages/sign_in.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaluación de seguridad',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        primaryColor: const Color(primaryColor),
      ),
      home: const SignIn(),
    );
  }
}
