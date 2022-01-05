import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/pages/sign_in.dart';
import 'package:seguridad_evaluacion/src/repository/sign_up.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key, required this.changeLoadingStatus})
      : super(key: key);

  final void Function() changeLoadingStatus;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _identificationController =
          TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordRepeatedController = TextEditingController();
  String? _identification;
  String? _password;
  String? _passwordRepeated;
  String _identificationHelper = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("N° de Identificación"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: normalPadding),
            child: TextFormField(
              controller: _identificationController,
              keyboardType: TextInputType.number,
              validator: (String? value) {
                if (value != null && value == "") {
                  return "Este campo es obligatorio";
                }
              },
              onSaved: (String? value) {
                _identification = value;
              },
              decoration: InputDecoration(
                helperText: _identificationHelper,
                helperStyle: const TextStyle(
                  color: Colors.red,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text("Contraseña"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: normalPadding),
            child: TextFormField(
              controller: _passwordController,
              validator: (String? value) {
                if (value != null && value == "") {
                  return "Este campo es obligatorio";
                }
              },
              onSaved: (String? value) {
                _password = value;
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          Text("Confirmar Contraseña"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: normalPadding),
            child: TextFormField(
              controller: _passwordRepeatedController,
              validator: (String? value) {
                if (value != null && value == "") {
                  return "Este campo es obligatorio";
                } else if (_passwordController.value.text !=
                    _passwordRepeatedController.value.text) {
                  return "Las contraseñas no coinciden";
                }
              },
              onSaved: (String? value) {
                _passwordRepeated = value;
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          PrimaryButton(
            buttonText: "Crear cuenta",
            onTap: registerUser,
          ),
        ],
      ),
    );
  }

  Future<void> registerUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // If password are the same, make the request
      if (_password == _passwordRepeated) {
        widget.changeLoadingStatus();
        Map response =
            await SignUpRepository.signUp(_identification!, _password!);
        if (response["success"] == true) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SignIn()));
        } else if (response["conflict"] == "ALREADY_REGISTERED") {
          // Show error if the user is already registered
          setState(() {
            _identificationHelper = "La cuenta ya se encuentra registrada";
          });
        }

        widget.changeLoadingStatus();
      }
    }
  }
}
