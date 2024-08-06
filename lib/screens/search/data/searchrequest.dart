import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';
import 'package:lawyer/models/city.dart';
import 'package:lawyer/models/language.dart';
import 'package:lawyer/models/practice.dart';

class Searchrequest {
  static Future<http.Response> search(
    String name,
    List<City> citys,
    List<Practice> practice,
    List<Language> language,
    String token,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    List cityslist = [];
    for (var i = 0; i < citys.length; i++) {
      cityslist.add(citys[i].id);
    }
    List languagelist = [];
    for (var i = 0; i < language.length; i++) {
      languagelist.add(language[i].name);
    }
    List practicelist = [];
    for (var i = 0; i < practice.length; i++) {
      practicelist.add(practice[i].name);
    }
    var url = Uri.parse(
        "${Global.url}lawyer?filter=[name]=$name&filter=[city]=$cityslist&filter=[practice]=$practicelist&filter=[language]=$languagelist");
    http.Response response = await http.get(
      url,
      headers: headers,
    );

    return response;
  }
}

class SearchFilterRequest {
  static Future<http.Response> getpractice() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    var url = Uri.parse("${Global.url}practice");
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    var responsemap = jsonDecode(response.body);
    print(responsemap);
    return response;
  }

  static Future<http.Response> getlanguage() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    var url = Uri.parse("${Global.url}language");
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    var responsemap = jsonDecode(response.body);
    print(responsemap);

    return response;
  }
}
