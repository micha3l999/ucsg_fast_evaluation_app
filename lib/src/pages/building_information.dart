import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/repository/all_user_data.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class BuildingInformation extends StatefulWidget {
  const BuildingInformation(
      {Key? key, required this.buildingId, required this.userId})
      : super(key: key);

  // Values to get all the information about the building
  final String buildingId;
  final String userId;

  @override
  _BuildingInformationState createState() => _BuildingInformationState();
}

class _BuildingInformationState extends State<BuildingInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Evaluación de seguridad"),
        backgroundColor: const Color(primaryColor),
      ),
      body: Container(
        padding: const EdgeInsets.all(normalPadding),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "Datos de la edificación",
                    style: TextStyle(
                      color: Color(primaryColor),
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      await AllUserDataRepository.deleteBuilding(
                          widget.buildingId, widget.userId);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(),
            Expanded(
              child: FutureBuilder(
                builder: (_, AsyncSnapshot<Map> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!["success"]) {
                      return buildInformation(
                          snapshot.data!["data"]["building"]);
                    } else {
                      return Center(
                        child: Text(
                            "Ocurrió un error, por favor vuelve a intentarlo"),
                      );
                    }
                  }
                  return Container(
                    color: const Color.fromRGBO(255, 255, 255, 0.7),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                future: AllUserDataRepository.getBuildingInformation(
                    widget.buildingId),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildInformation(Map buildingInfo) {
    List<Widget> listTiles = [];

    /*for (var element in buildingInfo.entries) {
      listTiles.add(buildListTileBuilding(title, value))
    }*/
    listTiles.add(buildListTileBuilding(
        "Lugar de inspección", buildingInfo["inspectionPlace"]));

    listTiles.add(buildListTileBuilding("Identificación del inspector",
        buildingInfo["inspectorIdentification"]));

    listTiles.add(buildListTileBuilding(
        "Estructura del techo", buildingInfo["roofStructure"]));

    listTiles.add(buildListTileBuilding(
        "Escaleras y salidas", buildingInfo["stairsAndExits"]));

    listTiles
        .add(buildListTileBuilding("Propietario", buildingInfo["userName"]));

    listTiles.add(buildListTileBuilding("Tiene Gas", buildingInfo["hasGas"]));

    listTiles.add(buildListTileBuilding(
        "Comentarios de emergencia", buildingInfo["emergencyComments"]));

    listTiles
        .add(buildListTileBuilding("Tiene fisuras", buildingInfo["hasCracks"]));

    listTiles.add(buildListTileBuilding(
        "Calificación de la vivienda", buildingInfo["buildingQualification"]));

    listTiles.add(buildListTileBuilding(
        "Estructura de las paredes", buildingInfo["wallStructure"]));

    listTiles.add(buildListTileBuilding(
        "Tiene electricidad", buildingInfo["hasElectricity"]));

    listTiles.add(buildListTileBuilding(
        "Tipo de estructura", buildingInfo["structureType"]));

    listTiles.add(buildListTileBuilding(
        "Identificación del propietario", buildingInfo["userId"]));

    listTiles.add(buildListTileBuilding(
        "Estructura de las columnas", buildingInfo["columnStructure"]));

    listTiles
        .add(buildListTileBuilding("Revestimientos", buildingInfo["coatings"]));

    listTiles.add(buildListTileBuilding(
        "Observaciones del inspector", buildingInfo["inspectorObservation"]));

    listTiles.add(
        buildListTileBuilding("Restricciones", buildingInfo["restrictions"]));

    listTiles.add(buildListTileBuilding(
        "Lugar de instalación", buildingInfo["installationAddress"]));

    listTiles.add(buildListTileBuilding(
        "Artefactos de iluminación", buildingInfo["illuminationThings"]));

    listTiles.add(
        buildListTileBuilding("Tiene pendientes", buildingInfo["hasSlopes"]));

    listTiles.add(buildListTileBuilding(
        "Existen conexiones prefabricadas", buildingInfo["preConnection"]));

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: listTiles,
      ),
    );
  }

  buildListTileBuilding(String title, String value) {
    return ListTile(
      title: Text(title),
      trailing: Text(value),
    );
  }
}
