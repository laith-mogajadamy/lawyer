import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lawyer/core/network/global.dart';
import 'package:lawyer/models/lawyer.dart';

class Lawyersreqwest {
  static Future<http.Response> getlawyers(
    String token,
  ) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    var url = Uri.parse("${Global.url}lawyer");
    http.Response response = await http.get(url, headers: headers);
    print(response);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  static Future<http.Response> creatgroup(
    String token,
    String name,
    List<Lawyer> members,
  ) async {
    List<int> membersid = [];
    for (var i = 0; i < members.length; i++) {
      membersid.add(members[i].id);
    }
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
    Map data = {
      "name": name,
      "members": membersid,
    };
    print(data);
    var body = jsonEncode(data);
    var url = Uri.parse("${Global.url}group");
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.statusCode);
    var responsemap = jsonDecode(response.body);
    print("responsemap=");
    print(responsemap);
    return response;
  }
}
