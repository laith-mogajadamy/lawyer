import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:lawyer/core/network/global.dart';

class Auth {
  static Future clientregister(
    String type,
    String name,
    String email,
    String password,
    String password_confirmation,
    String gender,
    String phone,
    String birth,
    String country,
    String city,
    String emirates_id,
    File? front_emirates_id,
    File? back_emirates_id,
    String occupation,
  ) async {
    FormData formdata = FormData.fromMap(
      {
        "type": type,
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "gender": gender,
        "phone": phone,
        "birth": birth,
        "country": country,
        "city": city,
        "emirates_id": emirates_id,
        "front_emirates_id": await MultipartFile.fromFile(
          front_emirates_id!.path,
          filename: front_emirates_id.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "back_emirates_id": await MultipartFile.fromFile(
          back_emirates_id!.path,
          filename: back_emirates_id.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "occupation": occupation,
      },
    );
    Response response = await Dio().post(
      "${Global.url}register",
      data: formdata,
      options: Options(method: "POST"),
      onSendProgress: (count, total) {
        print("count=$count");
        print("total=$total");
      },
    );
    print(response.statusCode);

    print(response.data);
    return response;
  }

  static Future lawyerregister(
    String type,
    String name,
    String email,
    String password,
    String password_confirmation,
    String gender,
    String phone,
    String birth,
    String country,
    String city,
    String emirates_id,
    File? front_emirates_id,
    File? back_emirates_id,
    String land_line,
    String consultation_price,
    String bio,
    String location,
    String years_of_practice,
    String available,
    List<File>? certifications,
    List<File>? licenses,
    List<String> practices,
    List<String> languages,
  ) async {
    List certificationlist = [];
    for (var i = 0; i < certifications!.length; i++) {
      certificationlist.add(
        await MultipartFile.fromFile(
          certifications[i].path,
          filename: certifications[i].path.split('/').last,
          contentType: MediaType('image', 'png'),
        ),
      );
    }
    List licenseslist = [];
    for (var i = 0; i < licenses!.length; i++) {
      licenseslist.add(
        await MultipartFile.fromFile(
          licenses[i].path,
          filename: licenses[i].path.split('/').last,
          contentType: MediaType('image', 'png'),
        ),
      );
    }
    List practiceslist = [];
    for (var i = 0; i < practices.length; i++) {
      practiceslist.add(practices[i]);
    }
    List languageslist = [];
    for (var i = 0; i < languages.length; i++) {
      languageslist.add(languages[i]);
    }
    FormData formdata = FormData.fromMap(
      {
        "type": type,
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "gender": gender,
        "phone": phone,
        "birth": birth,
        "country": country,
        "city": city,
        "emirates_id": emirates_id,
        "front_emirates_id": await MultipartFile.fromFile(
          front_emirates_id!.path,
          filename: front_emirates_id.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "back_emirates_id": await MultipartFile.fromFile(
          back_emirates_id!.path,
          filename: back_emirates_id.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "land_line": land_line,
        "consultation_price": consultation_price,
        "bio": bio,
        "location": location,
        "years_of_practice": years_of_practice,
        "available": available,
        "certifications[]": certificationlist,
        "licenses[]": licenseslist,
        "practices[]": practiceslist,
        "languages[]": languageslist,
      },
    );
    Response response = await Dio().post(
      "${Global.url}register",
      data: formdata,
      options: Options(method: "POST"),
      onSendProgress: (count, total) {
        print("count=$count");
        print("total=$total");
      },
    );
    print(response.statusCode);

    print(response.data);
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
