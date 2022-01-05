import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:seguridad_evaluacion/src/network/api_instance.dart';

abstract class SignUpRepository {
  static const signUpUrl =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/createUser";

  static final ApiInstance _apiInstance = ApiInstance.getInstance()!;

  static Future<Map> signUp(String identification, String password) async {
    Uri url = _apiInstance.getUrl(signUpUrl);

    // Make Api Request
    try {
      Response response = await _apiInstance.client.post(url,
          headers: {
            'Content-type': 'application/json',
          },
          body: jsonEncode({
            "identification": identification,
            "password": password,
          }));

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
}
