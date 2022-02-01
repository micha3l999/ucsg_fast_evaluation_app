import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:seguridad_evaluacion/src/dependencies/shared_preferences_keys.dart';
import 'package:seguridad_evaluacion/src/dependencies/shared_preferences_repo.dart';
import 'package:seguridad_evaluacion/src/network/api_instance.dart';

abstract class BuildingRegistrationRepository {
  static const String registrationUrl =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/register-buildings";

  static final ApiInstance _apiInstance = ApiInstance.getInstance()!;

  static Future<Map> sendRegistrationInfo(
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

    String? user =
        await SharedPreferencesRepo.getPrefer(SharedPreferencesKeys.user);
    String identification = "";
    String userName = "";
    if (user != null) {
      identification = jsonDecode(user)["id"];
      userName = jsonDecode(user)["name"];
    }

    try {
      Response response = await _apiInstance.client.post(url,
          body: jsonEncode({
            "structureType": structureType,
            "roofStructure": roofStructure,
            "columnStructure": columnStructure,
            "wallStructure": wallStructure,
            "preConnection": preConnection,
            "coatings": coatings,
            "illuminationThings": illuminationThings,
            "stairsAndExits": stairsAndExits,
            "hasGas": hasGas,
            "hasElectricity": hasElectricity,
            "hasSlopes": hasSlopes,
            "hasCracks": hasCracks,
            "buildingQualification": buildingQualification,
            "inspectionPlace": inspectionPlace,
            "installationAddress": installationAddress,
            "restrictions": restrictions,
            "inspectorObservation": inspectorObservation,
            "emergencyComments": emergencyComments,
            "inspectorIdentification": inspectorIdentification,
            "userId": identification,
            "userName": userName,
          }));
      switch (response.statusCode) {
        case 200:
          return {
            "success": true,
            "conflict": "NONE",
          };
        case 400:
          return {
            "success": false,
            "conflict": "INSPECTOR_IDENTIFICATION",
          };
        default:
          break;
      }
    } catch (error) {
      print(error);
    }
    return {
      "success": false,
      "conflict": "ERROR",
    };
  }
}
