import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/scaffold_login.dart';
import 'package:seguridad_evaluacion/src/components/sign_in_form.dart';
import 'package:seguridad_evaluacion/src/pages/sign_up.dart';
import 'package:seguridad_evaluacion/src/pages/update_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ScaffoldLogin(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: const EdgeInsets.all(20),
                        child: Image.asset("assets/images/logo_ucsg.png"),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: SignInForm(
                          changeLoadingStatus: changeLoadingStatus,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp()));
                        },
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                                text: "o ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                      text: "Crea tu cuenta",
                                      style: TextStyle(color: Colors.blue)),
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const UpdatePassword()));
                        },
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                                text: "",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                      text: "¿Olvidastes tu contraseña?",
                                      style: TextStyle(color: Colors.blue)),
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: const Color.fromRGBO(255, 255, 255, 0.7),
              child: const Center(
                child: const CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  void changeLoadingStatus() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }
}
