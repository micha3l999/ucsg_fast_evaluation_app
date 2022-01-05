import 'package:http/http.dart' show Client;

class ApiInstance {
  final Client client = Client();

  static ApiInstance? _apiProviderImpl;

  static ApiInstance? getInstance() {
    _apiProviderImpl ??= ApiInstance();
    return _apiProviderImpl;
  }

  Uri getUrl(String route) {
    return Uri.parse(route);
  }

  Uri getURLParameters(String route, Map<String, String> parameters) {
    Uri url = Uri.http("", route, parameters);
    String subUrl = url.toString().substring(5);
    return Uri.parse(subUrl);
  }
}
