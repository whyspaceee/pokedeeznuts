import 'package:http/http.dart';

class ApiProvider {
  static final Uri baseUri = Uri.parse("https://pokeapi.co/api/v2/");

  Future<String> apiRequest(Uri uri) async {
    final response = await get(uri);
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(
        response.statusCode,
      );
    }
    return response.body;
  }
}
