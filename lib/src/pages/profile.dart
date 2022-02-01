import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/pages/update_user_data.dart';
import 'package:seguridad_evaluacion/src/repository/profile.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String _userName = "";
  String _address = "";
  String _age = "";
  String _password = "";
  String _identification = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(primaryColor),
        title: const Text("Evaluación de seguridad"),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: getUserData(),
            builder: (_, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData && snapshot.data!) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Spacer(),
                        Text(
                          "Datos del usuario",
                          style: TextStyle(
                            fontSize: extraBigFont,
                            color: Color(primaryColor),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(_userName),
                      subtitle: const Text("Nombre completo"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_box),
                      title: Text(_identification),
                      subtitle: const Text("Identificación"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text(_age),
                      subtitle: const Text("Edad"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(_address),
                      subtitle: const Text("Dirección"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Spacer(),
                        PrimaryButton(
                            buttonText: "Actualizar datos",
                            onTap: () async {
                              await Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => const UpdateUserData()));
                              setState(() {});
                            }),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                );
              }
              return Container(
                color: const Color.fromRGBO(255, 255, 255, 0.7),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }),
      ),
    );
  }

  Future<bool> getUserData() async {
    Map responseRepository = await ProfileRepository.getUserData();

    if (responseRepository["success"]) {
      _userName = responseRepository["user"]["name"];
      _identification = responseRepository["user"]["id"];
      _age = responseRepository["user"]["age"];
      _address = responseRepository["user"]["address"];
      _password = responseRepository["user"]["password"];
      return true;
    }
    return false;
  }
}
