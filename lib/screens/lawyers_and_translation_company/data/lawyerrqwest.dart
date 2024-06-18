import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';

class Lawyersreqwest {
  static Future<http.Response> getlawyers(
    String token,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse("${Global.url}user");
    http.Response response = await http.get(url, headers: headers);

    return response;
  }
}