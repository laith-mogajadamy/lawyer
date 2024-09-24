import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import 'package:lawyer/core/network/global.dart';
import 'package:lawyer/models/language.dart';
import 'package:lawyer/models/practice.dart';

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
    dynamic country,
    dynamic city,
    String emirates_id,
    File? front_emirates_id,
    File? back_emirates_id,
    String occupation,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    FormData formdata = FormData.fromMap(
      {
        "type": "4",
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
    print("formdata--------------");
    print(formdata.fields);
    print(formdata.files);

    Response response = await Dio().post(
      "${Global.url}register",
      data: formdata,
      options: Options(method: "POST", headers: headers),
      onSendProgress: (count, total) {
        print("count=$count");
        print("total=$total");
      },
    );

    print("4444444444444444");

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
    List<Practice> practices,
    List<Language> languages,
    File? profile,
    String? facebook,
    String? tiktok,
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
      practiceslist.add(practices[i].id);
    }
    List languageslist = [];
    for (var i = 0; i < languages.length; i++) {
      languageslist.add(languages[i].id);
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
        "profile": await MultipartFile.fromFile(
          profile!.path,
          filename: profile.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "facebook": facebook,
        "tiktok": tiktok,
      },
    );
    print(profile);
    print(profile.path);
    print(formdata.fields);
    print(formdata.files);
    Response response;
    try {
      response = await Dio().post(
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
      print('Response data: ${response.data}');
      return response;
    } on DioException catch (e) {
      void printError(DioException error) {
        switch (error.type) {
          case DioExceptionType.cancel:
            print('Request to the server was cancelled.');
            break;
          case DioExceptionType.connectionTimeout:
            print('Connection timeout with the server.');
            break;
          case DioExceptionType.receiveTimeout:
            print('Receive timeout in connection with the server.');
            break;
          case DioExceptionType.badResponse:
            print(
                'Received invalid status code: ${error.response?.statusCode}');
            print('Error data: ${error.response?.data}');
            print('Error message: ${error.message}');
            break;
          case DioExceptionType.sendTimeout:
            print('Send timeout in connection with the server.');
            break;
          case DioExceptionType.unknown:
            print('Something went wrong: ${error.message}');
            break;
          case DioExceptionType.badCertificate:
            print('Something went wrong: ${error.message}');
          case DioExceptionType.connectionError:
            print('Something went wrong: ${error.message}');
        }
      }

      printError(e);

      return e;
    } catch (e) {
      // Handle any other types of exceptions
      print('Unexpected error: $e');
      return e;
    }
  }
  //

  static Future tcompanyregister(
    String type,
    String name,
    String email,
    String password,
    String password_confirmation,
    String phone,
    String country,
    String city,
    String land_line,
    String translation_price,
    String bio,
    String location,
    String available,
    List<File>? certifications,
    List<File>? licenses,
    List<Language> languages,
    File? profile,
    String? facebook,
    String? tiktok,
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

    List languageslist = [];
    for (var i = 0; i < languages.length; i++) {
      languageslist.add(languages[i].id);
    }
    FormData formdata = FormData.fromMap(
      {
        "type": type,
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password_confirmation,
        "phone": phone,
        "country": country,
        "city": city,
        "land_line": land_line,
        "translation_price": translation_price,
        "bio": bio,
        "location": location,
        "available": available,
        "certifications[]": certificationlist,
        "licenses[]": licenseslist,
        "languages[]": languageslist,
        "profile": await MultipartFile.fromFile(
          profile!.path,
          filename: profile.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "facebook": facebook,
        "tiktok": tiktok,
      },
    );
    print(profile);
    print(profile.path);
    print(formdata.fields);
    print(formdata.files);
    Response response;
    try {
      response = await Dio().post(
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
      print('Response data: ${response.data}');
      return response;
    } on DioException catch (e) {
      void printError(DioException error) {
        switch (error.type) {
          case DioExceptionType.cancel:
            print('Request to the server was cancelled.');
            break;
          case DioExceptionType.connectionTimeout:
            print('Connection timeout with the server.');
            break;
          case DioExceptionType.receiveTimeout:
            print('Receive timeout in connection with the server.');
            break;
          case DioExceptionType.badResponse:
            print(
                'Received invalid status code: ${error.response?.statusCode}');
            print('Error data: ${error.response?.data}');
            print('Error message: ${error.message}');
            break;
          case DioExceptionType.sendTimeout:
            print('Send timeout in connection with the server.');
            break;
          case DioExceptionType.unknown:
            print('Something went wrong: ${error.message}');
            break;
          case DioExceptionType.badCertificate:
            print('Something went wrong: ${error.message}');
          case DioExceptionType.connectionError:
            print('Something went wrong: ${error.message}');
        }
      }

      printError(e);

      return e;
    } catch (e) {
      // Handle any other types of exceptions
      print('Unexpected error: $e');
      return e;
    }
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

  void printError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        print('Request to the server was cancelled.');
        break;
      case DioExceptionType.connectionTimeout:
        print('Connection timeout with the server.');
        break;
      case DioExceptionType.receiveTimeout:
        print('Receive timeout in connection with the server.');
        break;
      case DioExceptionType.badResponse:
        print('Received invalid status code: ${error.response?.statusCode}');
        print('Error data: ${error.response?.data}');
        print('Error message: ${error.message}');
        break;
      case DioExceptionType.sendTimeout:
        print('Send timeout in connection with the server.');
        break;
      case DioExceptionType.unknown:
        print('Something went wrong: ${error.message}');
        break;
      case DioExceptionType.badCertificate:
        print('Something went wrong: ${error.message}');
      case DioExceptionType.connectionError:
        print('Something went wrong: ${error.message}');
    }
  }
}
