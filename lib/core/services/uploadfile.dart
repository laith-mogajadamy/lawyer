import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lawyer/core/network/global.dart';
import 'package:http_parser/http_parser.dart';

class Uploadfile {
  static Future lawyerprofileedit(
    int id,
    String token,
    final File? fimage,
    final String? name,
    final String? email,
    final String? password,
    final String? passwordconfirmation,
    final String? gender,
    final String? number,
    final String? birth,
    final String? country,
    final String? city,
    final String? emiratesid,
    final File? frontemiratesid,
    final File? backemiratesid,
    final String? landline,
    final String? bio,
    final String? yearsofpractice,
    final String? location,
    final int? consultationPrice,
    final int? available,
    final List<File>? certification,
    final List<File>? licenses,
    final List<String>? practices,
    final List<String>? languages,
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
    List licensesllist = [];
    for (var i = 0; i < licenses!.length; i++) {
      licensesllist.add(
        await MultipartFile.fromFile(
          licenses[i].path,
          filename: licenses[i].path.split('/').last,
          contentType: MediaType('file', 'pdf'),
        ),
      );
    }
    FormData formdata = FormData.fromMap(
      {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordconfirmation,
        "gender": gender,
        "phone": number,
        "birth": birth,
        "country": country,
        "city": city,
        "emirates_id": emiratesid,
        "front_emirates_id": await MultipartFile.fromFile(
          frontemiratesid!.path,
          filename: frontemiratesid.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "back_emirates_id": await MultipartFile.fromFile(
          backemiratesid!.path,
          filename: backemiratesid.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "land_line": landline,
        "consultation_price": consultationPrice,
        "bio": bio,
        "location": location,
        "years_of_practice": yearsofpractice,
        "available": available,
        "certification[]": certificationlist,
        "licenses[]": licensesllist,
        "practices[]": practices,
        "languages[]": languages,
        "profile": await MultipartFile.fromFile(
          fimage!.path,
          filename: fimage.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
      },
    );

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().post(
      "${Global.url}lawyer/$id",
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

  static Future clientprofileedit(
    int id,
    String token,
    final File? fimage,
    final String? name,
    final String? email,
    final String? password,
    final String? passwordconfirmation,
    final String? gender,
    final String? number,
    final String? birth,
    final String? country,
    final String? city,
    final String? emiratesid,
    final File? frontemiratesid,
    final File? backemiratesid,
    final String? occupation,
  ) async {
    print("Uploadfile");
    print(fimage);

    FormData formdata = FormData.fromMap(
      {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordconfirmation,
        "gender": gender,
        "phone": number,
        "birth": birth,
        "country": country,
        "city": city,
        "emirates_id": emiratesid,
        "front_emirates_id": await MultipartFile.fromFile(
          frontemiratesid!.path,
          filename: frontemiratesid.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "back_emirates_id": await MultipartFile.fromFile(
          backemiratesid!.path,
          filename: backemiratesid.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
        "occupation": occupation,
        "profile": await MultipartFile.fromFile(
          fimage!.path,
          filename: fimage.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ),
      },
    );

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().post(
      "${Global.url}client/$id",
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