import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/repository/profile.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';
import 'package:seguridad_evaluacion/src/utils/global_functions.dart';

class UpdateUserData extends StatefulWidget {
  const UpdateUserData({Key? key}) : super(key: key);

  @override
  _UpdateUserDataState createState() => _UpdateUserDataState();
}

class _UpdateUserDataState extends State<UpdateUserData> with GlobalFunctions {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _identificationController =
          TextEditingController(),
      _nameController = TextEditingController(),
      _addressController = TextEditingController(),
      _ageController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordRepeatedController = TextEditingController();
  String _passwordHelper = "";
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.done),
          backgroundColor: Color(primaryColor),
          onPressed: () {
            sendData();
          },
        ),
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
                            "Actualización de datos",
                            style: TextStyle(
                              color: Color(primaryColor),
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          const Text("Nombre completo"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: normalPadding),
                            child: TextFormField(
                              controller: _nameController,
                              validator: (String? value) {},
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          Text("Dirección de la vivienda"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: normalPadding),
                            child: TextFormField(
                              controller: _addressController,
                              validator: (String? value) {},
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                          ),
                          const Text("Edad"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: normalPadding),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _ageController,
                              validator: (String? value) {},
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                          ),
                          const Text("Nueva contraseña"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: normalPadding),
                            child: TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.number,
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
                              keyboardType: TextInputType.number,
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

    if (_nameController.text.isEmpty &&
        _ageController.text.isEmpty &&
        _addressController.text.isEmpty &&
        _passwordController.text.isEmpty &&
        _passwordRepeatedController.text.isEmpty) {
      informationDialog(context,
          title: "Añade datos para poder acualizar tu perfil");
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
        _nameController.text,
        _addressController.text,
        _ageController.text,
        _passwordController.text);

    if (mapResponse["success"]) {
      informationDialog(context,
          title: "El perfil fue actualizado correctamente");
    } else {
      informationDialog(context,
          title: "Opps, hubo un error por favor intentalo nuevamente");
    }

    _loading.value = false;
  }
}
