import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/pages/evaluation_form.dart';
import 'package:seguridad_evaluacion/src/repository/sign_in.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key, required this.changeLoadingStatus})
      : super(key: key);

  final void Function() changeLoadingStatus;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  String? _identification, _password;
  String _passwordHelper = "", _identificationHelper = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Column(
            children: [
              Container(
                child: const Text(
                  "Identificación",
                  style: TextStyle(fontSize: mediumFont),
                ),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                onTap: () {
                  setState(() {
                    _identificationHelper = "";
                    _passwordHelper = "";
                  });
                },
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: const Text(
                  "Contraseña",
                  style: TextStyle(fontSize: mediumFont),
                ),
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
              ),
              TextFormField(
                onTap: () {
                  setState(() {
                    _identificationHelper = "";
                    _passwordHelper = "";
                  });
                },
                validator: (String? value) {
                  if (value != null && value == "") {
                    return "Este campo es obligatorio";
                  }
                },
                onSaved: (String? value) {
                  _password = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  helperText: _passwordHelper,
                  helperStyle: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              PrimaryButton(
                buttonText: "Iniciar sesión",
                onTap: loginUser,
              ),
            ],
          ),
          key: _formKey,
        ),
      ],
    );
  }

  Future<void> loginUser() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Update loading status to show the loading screen
      widget.changeLoadingStatus();

      Map apiResponse =
          await SignInRepository.signIn(_identification!, _password!);

      // Update loading status to hide the loading screen
      widget.changeLoadingStatus();

      if (apiResponse["success"] == true) {
        // Navigate to first evaluation form screen
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const EvaluationForm()));
      } else {
        switch (apiResponse["conflict"]) {
          case "PASSWORD":
            setState(() {
              _passwordHelper = "La contraseña es incorrecta";
            });
            break;
          case "NOT_REGISTERED":
            setState(() {
              _identificationHelper = "No se encuentra registrado";
            });
            break;
        }
      }
    }
  }
}
