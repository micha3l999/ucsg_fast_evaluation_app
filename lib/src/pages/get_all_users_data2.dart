import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/pages/building_information.dart';
import 'package:seguridad_evaluacion/src/repository/all_user_data.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class AllUserData2 extends StatefulWidget {
  const AllUserData2({Key? key}) : super(key: key);

  @override
  _AllUserDataState createState() => _AllUserDataState();
}

class _AllUserDataState extends State<AllUserData2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evaluación de seguridad"),
        backgroundColor: Color(primaryColor),
      ),
      body: Container(
        padding: EdgeInsets.all(normalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: const Text(
                "Edificaciones registradas",
                style: TextStyle(
                  color: Color(primaryColor),
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Expanded(
              child: FutureBuilder(
                future: AllUserDataRepository.getAllUserData(),
                builder: (_, AsyncSnapshot<Map> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!["success"]) {
                      if (snapshot.data!["data"].isNotEmpty) {
                        return buildList(snapshot.data!["data"]);
                      } else {
                        return Center(
                            child:
                                Text("No existen edificaciones registradas"));
                      }
                    }
                  }

                  return Container(
                    color: const Color.fromRGBO(255, 255, 255, 0.7),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildList(List buildingsList) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: buildingsList.length,
      separatorBuilder: (_, __) => SizedBox(
        height: 8,
      ),
      itemBuilder: (_, count) => cardInformation(buildingsList[count]),
    );
  }

  cardInformation(Map building) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => BuildingInformation(
                  buildingId: building["id"],
                  userId: building["userId"],
                )));
        setState(() {});
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Inspector : ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      building["userName"],
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    "Identificación: ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Flexible(
                    child: Text(
                      building["userId"],
                      style: TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
