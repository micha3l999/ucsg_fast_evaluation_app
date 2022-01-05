import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/scaffold_login.dart';
import 'package:seguridad_evaluacion/src/components/sign_up_form.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Registre su cuenta para una inspección estructural ",
                        style: TextStyle(
                            fontSize: extraBigFont, color: Color(primaryColor)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SignUpForm(
                        changeLoadingStatus: changeLoadingStatus,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Color.fromRGBO(255, 255, 255, 0.7),
              child: Center(
                child: CircularProgressIndicator(),
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
