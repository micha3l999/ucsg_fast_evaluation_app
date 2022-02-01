import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:seguridad_evaluacion/src/dependencies/shared_preferences_keys.dart';
import 'package:seguridad_evaluacion/src/dependencies/shared_preferences_repo.dart';
import 'package:seguridad_evaluacion/src/network/api_instance.dart';

abstract class ProfileRepository {
  static const String getProfile =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/get-user-data/";
  static const String updateProfile =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/update-user-data";
  static final ApiInstance _apiInstance = ApiInstance.getInstance()!;

  static Future<Map> getUserData() async {
    String? user =
        await SharedPreferencesRepo.getPrefer(SharedPreferencesKeys.user);
    String identification = "";
    if (user != null) {
      identification = jsonDecode(user)["id"];
    }

    String route = getProfile + identification;
    Uri url = _apiInstance.getUrl(route);

    // Make Api Request
    try {
      Response response = await _apiInstance.client.get(url);
      switch (response.statusCode) {
        case 200:

          // Login successfully
          final Map responseConverted = jsonDecode(response.body);

          return {
            "message": responseConverted["message"],
            "user": responseConverted["user"],
            "success": true
          };
        case 409:

          // Response when the user is already registered
          String conflictMessage = jsonDecode(response.body);

          return {
            "message": conflictMessage,
            "conflict": "ALREADY_REGISTERED",
            "success": false,
          };
        default:
          return {
            "message": "Ha ocurrido un error",
            "conflict": "DEFAULT_ERROR",
            "success": false,
          };
      }
    } catch (error) {
      // Catch error and send common error response
      return {
        "message": "Ha ocurrido un error",
        "success": false,
      };
    }
  }

  static Future<Map> updateUserData(
      String name, String address, String age, String password,
      [String identification = ""]) async {
    if (identification.isEmpty) {
      String? user =
          await SharedPreferencesRepo.getPrefer(SharedPreferencesKeys.user);
      if (user != null) {
        identification = jsonDecode(user)["id"];
      }
    }

    Uri url = _apiInstance.getUrl(updateProfile);

    // Make API request
    try {
      Response response = await _apiInstance.client.put(url,
          body: jsonEncode({
            "name": name,
            "address": address,
            "age": age,
            "identification": identification,
            "password": password,
          }));
      switch (response.statusCode) {
        case 200:
          final Map responseConverted = jsonDecode(response.body);

          return {
            "success": true,
          };

        default:
          break;
      }
    } catch (error) {
      print(error);
    }

    return {
      "success": false,
    };
  }
}
