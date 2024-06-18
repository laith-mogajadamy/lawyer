import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';

class Searchrequest {
  static Future<http.Response> search(
    String name,
    String location,
    String practice,
    String token,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };

    var url = Uri.parse(
        "${Global.url}user?filter=[name]=$name&filter=[location]=$location&filter=[practice]=$practice");
    http.Response response = await http.get(
      url,
      headers: headers,
    );

    return response;
  }
}
