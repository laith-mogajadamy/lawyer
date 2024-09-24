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

class Generalquestionreplay {
  static Future<http.Response> generalquestionreplay(
    String token,
    String reply,
    int id,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "reply": reply,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}general-question/$id/reply");
    http.Response response = await http.post(url, headers: headers, body: body);

    return response;
  }
}

class Addgeneralquestion {
  static Future<http.Response> addgeneralquestion(
    String token,
    String title,
    String question,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "title": title,
      "question": question,
    };
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}general-question");
    http.Response response = await http.post(url, headers: headers, body: body);

    return response;
  }
}

class FrequentlyQuestionReqwest {
  static Future<http.Response> getfrequentlyquestion(
    String token,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse("${Global.url}frequently-question");
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> getfrequentlyquestionEN(
      // String token,
      ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      // "Authorization": "Bearer $token"
    };
    var url = Uri.parse("${Global.url}FAQ/en");
    http.Response response = await http.get(url, headers: headers);

    return response;
  }

  static Future<http.Response> getfrequentlyquestionAR(
      // String token,
      ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      // "Authorization": "Bearer $token"
    };
    var url = Uri.parse("${Global.url}FAQ/ar");
    http.Response response = await http.get(url, headers: headers);

    return response;
  }
}
