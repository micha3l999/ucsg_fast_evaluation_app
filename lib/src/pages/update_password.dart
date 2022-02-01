import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/repository/profile.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';
import 'package:seguridad_evaluacion/src/utils/global_functions.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> with GlobalFunctions {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController(),
      _passwordRepeatedController = TextEditingController(),
      _identificationController = TextEditingController();
  String _passwordHelper = "";
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(primaryColor),
          title: Text("Evaluación de seguridad"),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Actualización de contraseña",
                            style: TextStyle(
                              color: Color(primaryColor),
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text("Identificación"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: normalPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _identificationController,
                              validator: (String? value) {},
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          const Text("Nueva contraseña"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: normalPadding),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: (String? value) {},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const Text("Confirmar contraseña"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: normalPadding),
                            child: TextFormField(
                              controller: _passwordRepeatedController,
                              validator: (String? value) {},
                              decoration: InputDecoration(
                                helperText: _passwordHelper,
                                helperStyle: const TextStyle(
                                  color: Colors.red,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          PrimaryButton(
                            buttonText: "Actualizar contraseña",
                            onTap: () {
                              sendData();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _loading,
                builder: (context, value, child) {
                  if (value)
                    return Container(
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  return Container();
                }),
          ],
        ),
      ),
    );
  }

  Future sendData() async {
    _loading.value = true;

    if (_identificationController.text.isEmpty &&
        _passwordController.text.isEmpty &&
        _passwordRepeatedController.text.isEmpty) {
      informationDialog(context, title: "Completa todos los campos");
      _loading.value = false;
      return;
    }
    if (_passwordController.text != _passwordRepeatedController.text) {
      setState(() {
        _passwordHelper = "Las contraseñas no coinciden";
      });
      _loading.value = false;
      return;
    }

    Map mapResponse = await ProfileRepository.updateUserData(
        "", "", "", _passwordController.text, _identificationController.text);

    if (mapResponse["success"]) {
      informationDialog(context,
          title: "La contraseña fue actualizada correctamente");
    } else {
      informationDialog(context,
          title: "Opps, hubo un error por favor intentalo nuevamente");
    }

    _loading.value = false;
  }
}
