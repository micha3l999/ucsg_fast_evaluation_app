import 'package:http/http.dart' show Response;
import 'package:seguridad_evaluacion/src/network/api_instance.dart';

abstract class BuildingRegistrationRepository {
  static const String registrationUrl = "";

  static final ApiInstance _apiInstance = ApiInstance.getInstance()!;

  static Future sendRegistrationInfo(
    String structureType,
    String roofStructure,
    String columnStructure,
    String wallStructure,
    String preConnection,
    String coatings,
    String illuminationThings,
    String stairsAndExits,
    String hasGas,
    String hasElectricity,
    String hasSlopes,
    String hasCracks,
    String buildingQualification,
    String inspectionPlace,
    String installationAddress,
    String restrictions,
    String inspectorObservation,
    String emergencyComments,
    String inspectorIdentification,
  ) async {
    Uri url = _apiInstance.getUrl(registrationUrl);

    try {
      Response response = await _apiInstance.client.post(url, body: {
        "structureType": structureType,
        "roofStructure": roofStructure,
        "columnStructure": columnStructure,
        "wallStructure": wallStructure,
        "preConnection": preConnection,
        "coatings": coatings,
        "illuminationThings": illuminationThings,
      });

      print(response.body);

      switch (response.statusCode) {
        case 200:
          break;
        case 419:
          break;
        default:
          break;
      }
    } catch (error) {
      print(error);
    }
  }
}
