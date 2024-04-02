import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';

class Auth {
  static Future<http.Response> register(
    String name,
    String email,
    String password,
    String password2,
    String role,
    String phone,
  ) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password2,
      "role": role,
      "phone": phone,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}register");
    http.Response response =
        await http.post(url, headers: Global.headers, body: body);
    return response;
  }

  static Future<http.Response> login(
    String email,
    String password,
  ) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}login");
    http.Response response =
        await http.post(url, headers: Global.headers, body: body);
    return response;
  }

  static Future<http.Response> getuser1(
    String token,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse("${Global.url}user/19");
    http.Response response = await http.get(url, headers: headers);

    return response;
  }
}
