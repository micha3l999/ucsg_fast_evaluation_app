import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({Key? key, required this.buttonText, required this.onTap})
      : super(key: key);

  final String buttonText;
  final Function() onTap;

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      child: Text(
        widget.buttonText,
        style: TextStyle(fontSize: 16),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(primaryColor)),
      ),
    );
  }
}
