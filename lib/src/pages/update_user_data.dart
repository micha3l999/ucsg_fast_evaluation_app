import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class UpdateUserData extends StatefulWidget {
  const UpdateUserData({Key? key}) : super(key: key);

  @override
  _UpdateUserDataState createState() => _UpdateUserDataState();
}

class _UpdateUserDataState extends State<UpdateUserData> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _identificationController =
          TextEditingController(),
      _nameController = TextEditingController(),
      _addressController = TextEditingController(),
      _ageController = TextEditingController(),
      _passwordController = TextEditingController(),
      _passwordRepeatedController = TextEditingController();
  String? _identification;
  String? _name;
  String? _address;
  String? _age;
  String? _password;
  String? _passwordRepeated;
  String _identificationHelper = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(primaryColor),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nombre completo"),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: normalPadding),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (String? value) {
                          if (value != null && value == "") {
                            return "Este campo es obligatorio";
                          }
                        },
                        onSaved: (String? value) {
                          _name = value;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    Text("Dirección de la vivienda"),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: normalPadding),
                      child: TextFormField(
                        controller: _addressController,
                        validator: (String? value) {
                          if (value != null && value == "") {
                            return "Este campo es obligatorio";
                          }
                        },
                        onSaved: (String? value) {
                          _address = value;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    Text("Edad"),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: normalPadding),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _ageController,
                        validator: (String? value) {
                          if (value != null && value == "") {
                            return "Este campo es obligatorio";
                          }
                        },
                        onSaved: (String? value) {
                          _age = value;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    ),
                    Text("N° de Identificación"),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: normalPadding),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
