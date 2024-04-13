import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';

class ConsultationRequest {
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

  static Future<http.Response> answerconsultation(
    String token,
    int id,
    String answer,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "answer": answer,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}consultation/$id/answer");
    http.Response response = await http.post(url, headers: headers, body: body);

    return response;
  }
}
