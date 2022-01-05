import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';

class ScaffoldLogin extends StatelessWidget {
  const ScaffoldLogin({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: const Color(primaryColor),
    );
  }
}
