import 'dart:convert';
import 'dart:io';

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

  static Future<http.Response> logout(String token) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    };
    var url = Uri.parse("${Global.url}logout");
    http.Response response = await http.post(
      url,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> getuser1(
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

  // static Future profileedit(
  //   int id,
  //   String token,
  //   String? name,
  //   String? email,
  //   String? number,
  //   String? birth,
  //   int? location,
  //   int? gender,
  //   String? consultationprice,
  //   File? fimage,
  //   List<File>? certification,
  // ) async {
  //   var streem = http.ByteStream(certification![0].openRead());
  //   streem.cast();
  //   var length = await certification[0].length();
  //   Map data = {
  //     "name": name,
  //     "email": email,
  //     "phone": number,
  //     "birth": birth,
  //     "location": location,
  //     "gender": gender,
  //     "consultation_price": consultationprice,
  //     "profileUser": fimage,
  //     "certification": certification
  //   };
  //   Map<String, String> headers = {
  //     "Content-type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer $token",
  //   };

  //   // var body = jsonEncode(data);
  //   var url = Uri.parse("${Global.url}user/$id");
  //   // http.Response response = await http.post(url, headers: headers, body: body);
  //   var request = http.MultipartRequest("POST", url);
  //   request.fields["name"] = name!;
  //   var files = http.MultipartFile("certification", streem, length);
  //   request.files.add(files);
  //   request.headers.addAll(headers);
  //   var response = await request.send();
  //   print(response.statusCode);
  //   print(response.stream.toString());
  //   return response;
  // }
}
