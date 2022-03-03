import 'package:flutter/material.dart';
import 'package:seguridad_evaluacion/src/components/primary_button.dart';
import 'package:seguridad_evaluacion/src/pages/qualify_building.dart';
import 'package:seguridad_evaluacion/src/repository/all_user_data.dart';
import 'package:seguridad_evaluacion/src/utils/colors.dart';
import 'package:seguridad_evaluacion/src/utils/dimensions.dart';

class BuildingInformation extends StatefulWidget {
  const BuildingInformation(
      {Key? key,
      required this.buildingId,
      required this.userId,
      required this.ownRecords})
      : super(key: key);

  // Values to get all the information about the building
  final String buildingId;
  final String userId;
  final bool ownRecords;

  @override
  _BuildingInformationState createState() => _BuildingInformationState();
}

class _BuildingInformationState extends State<BuildingInformation> {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Evaluación de seguridad"),
        backgroundColor: const Color(primaryColor),
      ),
      body: Stack(
        children: [
          Container(
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Spacer(),
                      widget.ownRecords
                          ? TextButton(
                              onPressed: () async {
                                setState(() {
                                  _loading.value = !_loading.value;
                                });
                                await AllUserDataRepository.deleteBuilding(
                                    widget.buildingId, widget.userId);
                                setState(() {
                                  _loading.value = !_loading.value;
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text("Eliminar"))
                          : SizedBox(),
                      const SizedBox(
                        width: 16,
                      ),
                      PrimaryButton(
                          buttonText: "Calificar",
                          onTap: () async {
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => QualifyBuilding(
                                      buildingId: widget.buildingId,
                                      userId: widget.userId,
                                    )));
                            setState(() {});
                          }),
                    ],
                  ),
                )
              ],
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
    );
  }

  buildInformation(Map buildingInfo) {
    List<Widget> listTiles = [];

    /*for (var element in buildingInfo.entries) {
      listTiles.add(buildListTileBuilding(title, value))
    }*/
    listTiles.add(buildListTileBuilding(
        "Fecha de inspección", buildingInfo["inspectionDate"]));

    listTiles.add(
        buildListTileBuilding("Calle principal", buildingInfo["mainStreet"]));

    listTiles.add(buildListTileBuilding(
        "Numeracion e interseccion", buildingInfo["numberIntersection"]));

    listTiles.add(buildListTileBuilding(
        "Sector/Barrio/Ciudadela", buildingInfo["district"]));

    listTiles.add(
        buildListTileBuilding("Ciudad/Canton/Provincia", buildingInfo["city"]));

    listTiles.add(buildListTileBuilding(
        "Codigo catastral", buildingInfo["cadastralCode"]));

    listTiles.add(
        buildListTileBuilding("Otros detalles", buildingInfo["otherDetails"]));

    listTiles.add(buildListTileBuilding(
        "NUmero de niveles altos o bajos", buildingInfo["highLowLevels"]));

    listTiles.add(buildListTileBuilding(
        "Área de planta baja", buildingInfo["lowLevelArea"]));

    listTiles.add(buildListTileBuilding(
        "Área de planta alta", buildingInfo["highLevelArea"]));

    listTiles.add(buildListTileBuilding(
        "Edad de la estructura", buildingInfo["structureAge"]));

    listTiles.add(buildListTileBuilding("Ocupación primaria de la estructura",
        buildingInfo["firstStructureOccupation"]));

    listTiles.add(buildListTileBuilding(
        "Tipo de construcción", buildingInfo["constructionType"]));

    listTiles.add(buildListTileBuilding(
        "Distancia entre columnas", buildingInfo["columnsDistance"]));

    listTiles.add(buildListTileBuilding(
        "Número de columnas", buildingInfo["columnsNumber"]));

    listTiles.add(buildListTileBuilding(
        "Cantidad de muros", buildingInfo["wallsNumber"]));

    listTiles.add(buildListTileBuilding(
        "Tipo de irregularidades", buildingInfo["isIrregularities"]));

    listTiles.add(buildListTileBuilding(
        "Daños observados", buildingInfo["observedDamage"]));

    listTiles.add(buildListTileBuilding(
        "Ubicacion del Edificio", buildingInfo["inspectionPlace"]));

    listTiles.add(buildListTileBuilding("Identificación del inspector",
        buildingInfo["inspectorIdentification"]));

    listTiles.add(buildListTileBuilding(
        "Comentarios de emergencia", buildingInfo["emergencyComments"]));

    listTiles.add(buildListTileBuilding(
        "Calificación de la vivienda", buildingInfo["buildingQualification"]));

    listTiles.add(buildListTileBuilding(
        "Lugar de instalación", buildingInfo["installationAddress"]));

    listTiles.add(buildListTileBuilding(
        "Observaciones del inspector", buildingInfo["inspectorObservation"]));

    listTiles.add(
        buildListTileBuilding("Restricciones", buildingInfo["restrictions"]));

    /*listTiles.add(buildListTileBuilding(
        "Ubicacion del Edificio", buildingInfo["inspectionPlace"]));

    listTiles.add(buildListTileBuilding("Identificación del inspector",
        buildingInfo["inspectorIdentification"]));

    listTiles.add(buildListTileBuilding(
        "Numero de niveles del edificio", buildingInfo["roofStructure"]));

    listTiles.add(buildListTileBuilding(
        "Edad de la estructura", buildingInfo["stairsAndExits"]));

    listTiles
        .add(buildListTileBuilding("Propietario", buildingInfo["userName"]));

    listTiles.add(
        buildListTileBuilding("Tipo de Construccion", buildingInfo["hasGas"]));

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
        "Existen conexiones prefabricadas", buildingInfo["preConnection"]));*/

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: listTiles,
      ),
    );
  }

  buildListTileBuilding(String title, String value) {
    return ListTile(
      subtitle: Text(title),
      title: Text(value),
    );
  }
}
