import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';

class Generalquestionreqwest {
  static Future<http.Response> getgeneralquestion(
    String token,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse("${Global.url}general-question");
    http.Response response = await http.get(url, headers: headers);

    return response;
  }
}
