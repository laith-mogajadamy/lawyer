import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';

class AddConsultation {
  static Future<http.Response> addconsultation(
    String token,
    int id,
    String title,
    String description,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "title": title,
      "description": description,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}consultation/$id");
    http.Response response = await http.post(url, headers: headers, body: body);

    return response;
  }
}
