import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lawyer/core/network/global.dart';
import 'package:http_parser/http_parser.dart';

class Uploadfile {
  static Future profileedit(
    int id,
    String token,
    String? name,
    String? email,
    String? number,
    String? birth,
    int? location,
    int? gender,
    int? consultationprice,
    File? fimage,
    List<File>? certification,
  ) async {
    print("Uploadfile");
    print(certification);
    print(fimage);

    List certificationlist = [];
    for (var i = 0; i < certification!.length; i++) {
      certificationlist.add(
        await MultipartFile.fromFile(
          certification[i].path,
          filename: certification[i].path.split('/').last,
          contentType: MediaType('file', 'pdf'),
        ),
      );
    }
    FormData formdata = FormData.fromMap(
      {
        "name": name,
        "email": email,
        "phone": number,
        "birth": birth,
        "location": location,
        "gender": gender,
        "consultation_price": consultationprice,
        "profileUser": await MultipartFile.fromFile(
          fimage!.path,
          filename: fimage.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "certification[]": certificationlist,
      },
    );

    // Map data = {
    //   "name": name,
    //   "email": email,
    //   "phone": number,
    //   "birth": birth,
    //   "location": location,
    //   "gender": gender,
    //   "consultation_price": consultationprice,
    //   "profileUser": fimage,
    //   "certification": certification
    // };
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().post(
      "${Global.url}user/$id",
      data: formdata,
      options: Options(headers: headers, method: "POST"),
      onSendProgress: (count, total) {
        print("count=$count");
        print("total=$total");
      },
    );
    print(response.statusCode);

    print(response.data);
    return response;
  }
}
//  List<int> imageData = byteData.buffer.asUint8List();
//               MultipartFile multipartFile = new MultipartFile.fromBytes(
//                 imageData,
//                 filename: 'load_image',
//                 contentType: MediaType("image", "jpg"),
//               );