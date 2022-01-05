import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:seguridad_evaluacion/src/network/api_instance.dart';

abstract class SignInRepository {
  static const signInUrl =
      "https://pd02ohy27i.execute-api.us-east-2.amazonaws.com/prod/loginUser";

  static final ApiInstance _apiInstance = ApiInstance.getInstance()!;

  static Future<Map> signIn(String identification, String password) async {
    Uri url = _apiInstance.getUrl(signInUrl);

    // Make Api Request
    try {
      Response response = await _apiInstance.client.put(url,
          body: jsonEncode({
            "identification": identification,
            "password": password,
          }));

      print(response.body);

      switch (response.statusCode) {
        case 200:

          // Registration successfully
          final Map responseConverted = jsonDecode(response.body);

          return {
            "message": responseConverted["message"],
            "user": responseConverted["user"],
            "success": true,
            "code": 200,
          };
        case 409:

          // Code when user is not registered
          String conflictMessage = jsonDecode(response.body);

          return {
            "message": conflictMessage,
            "success": false,
            "conflict": "NOT_REGISTERED",
          };
        case 401:

          // Response when the password is incorrect
          String conflictMessage = jsonDecode(response.body);

          return {
            "message": conflictMessage,
            "success": false,
            "conflict": "PASSWORD",
          };
        default:
          return {
            "message": "Ha ocurrido un error",
            "success": false,
          };
      }
    } catch (error) {
      // Send common error response
      return {
        "message": "Ha ocurrido un error",
        "success": false,
      };
    }
  }
}
