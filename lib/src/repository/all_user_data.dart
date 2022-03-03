import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:seguridad_evaluacion/src/dependencies/shared_preferences_keys.dart';
import 'package:seguridad_evaluacion/src/dependencies/shared_preferences_repo.dart';
import 'package:seguridad_evaluacion/src/network/api_instance.dart';

abstract class AllUserDataRepository {
  static final String urlAllUserData =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/get-all-buildings";
  static final String urlBuildingInformation =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/get-building-information/";
  static final String urlDelteBuilding =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/delete-building-information";

  static final ApiInstance _apiInstance = ApiInstance.getInstance()!;

  static Future<Map> getAllUserData({bool ownBuildings = false}) async {
    Uri url;
    if (!ownBuildings) {
      url = _apiInstance.getUrl(urlAllUserData);
    } else {
      String? user =
          await SharedPreferencesRepo.getPrefer(SharedPreferencesKeys.user);
      String identification = "";
      if (user != null) {
        identification = jsonDecode(user)["id"];
      }
      url = _apiInstance.getUrl(urlAllUserData + "/" + identification);
    }

    // Make Api Request
    try {
      Response response = await _apiInstance.client.get(url);
      switch (response.statusCode) {
        case 200:

          // Login successfully
          final Map responseConverted = jsonDecode(response.body);

          return {"data": responseConverted["buildings"], "success": true};
        default:
          return {
            "data": "NONE",
            "success": false,
          };
      }
    } catch (error) {
      // Catch error and send common error response
      return {
        "data": "NONE",
        "success": false,
      };
    }
  }

  static Future<Map> getBuildingInformation(String id) async {
    String urlId = urlBuildingInformation + id;
    Uri url = _apiInstance.getUrl(urlId);

    // Make API request
    try {
      Response response = await _apiInstance.client.get(url);
      switch (response.statusCode) {
        case 200:
          final Map responseConverted = jsonDecode(response.body);

          return {
            "success": true,
            "data": responseConverted,
          };

        default:
          break;
      }
    } catch (error) {
      print(error);
    }

    return {
      "success": false,
      "data": "NONE",
    };
  }

  static Future<Map> deleteBuilding(String id, String userId) async {
    Uri url = _apiInstance.getUrl(urlDelteBuilding);

    // Make Api Request
    try {
      Response response = await _apiInstance.client.put(url,
          body: jsonEncode({
            "building_id": id,
            "user_id": userId,
          }));
      switch (response.statusCode) {
        case 200:

          // Login successfully
          final Map responseConverted = jsonDecode(response.body);

          return {"data": responseConverted, "success": true};
        default:
          return {
            "data": "NONE",
            "success": false,
          };
      }
    } catch (error) {
      // Catch error and send common error response
      return {
        "data": "NONE",
        "success": false,
      };
    }
  }
}
