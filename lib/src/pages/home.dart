import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/pages/evaluation_form.dart';
import 'package:seguridad_evaluacion/src/pages/get_all_users_data.dart';
import 'package:seguridad_evaluacion/src/pages/get_all_users_data2.dart';
import 'package:seguridad_evaluacion/src/pages/profile.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Spacer(),
            GestureDetector(
              child: const Text("Salir"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        backgroundColor: const Color(primaryColor),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: const Text(
                  "Evaluación de seguridad de edificaciones",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(primaryColor),
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const EvaluationForm()));
                },
                child: ListTile(
                  leading: Text(
                    "Registrar edificación",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AllUserData2()));
                },
                child: ListTile(
                  leading: Text(
                    "Consultar datos propios",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.person_search),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => AllUserData()));
                },
                child: ListTile(
                  leading: Text(
                    "Consultar datos globales",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.search),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => UserProfile()));
                },
                child: ListTile(
                  leading: Text(
                    "Administrar perfil",
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.account_circle_sharp),
                ),
              ),
              const Divider(),
              /*PrimaryButton(
                  buttonText: "Registar edificación",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const EvaluationForm()));
                  }),
              const SizedBox(
                height: 8,
              ),
              PrimaryButton(
                  buttonText: "Consultar datos",
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => AllUserData()));
                  }),
              const SizedBox(
                height: 8,
              ),
              PrimaryButton(
                  buttonText: "Administrar perfil",
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => UserProfile()));
                  }),
              const SizedBox(
                height: 8,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
