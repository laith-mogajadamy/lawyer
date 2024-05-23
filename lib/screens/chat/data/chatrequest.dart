import 'dart:io';
import 'package:dio/dio.dart';
import 'package:lawyer/core/network/global.dart';
import 'package:http_parser/http_parser.dart';

class SendMessageToUser {
  static Future sendmessage(
    int id,
    String token,
    String? message,
    File? attachment,
  ) async {
    print("SendMessage");
    print(attachment);

    FormData formdata = FormData.fromMap(
      {
        "message": (message != null) ? message : "",
        "attachment": (attachment != null)
            ? await MultipartFile.fromFile(
                attachment.path,
                filename: attachment.path.split("/").last,
                contentType: MediaType('image', 'jpg'),
              )
            : null
      },
    );

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().post(
      "${Global.url}chat/send_message_to_user/$id",
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

class SendMessageToGroup {
  static Future sendmessagetogroup(
    int id,
    String token,
    String? message,
    File? attachment,
  ) async {
    print("SendMessage");
    print(attachment);

    FormData formdata = FormData.fromMap(
      {
        "message": message,
        "attachment": (attachment != null)
            ? await MultipartFile.fromFile(
                attachment.path,
                filename: attachment.path.split("/").last,
                contentType: MediaType('image', 'jpg'),
              )
            : null
      },
    );

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().post(
      "${Global.url}chat/send_message_to_group/$id",
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

class GetMessagesInChat {
  static Future getmessages(
    int id,
    String token,
  ) async {
    print("GetMessages");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().get(
      "${Global.url}chat/get_message_in_chat/$id",
      options: Options(headers: headers, method: "GET"),
    );
    print(response.statusCode);

    print(response.data);

    return response;
  }
}

class GetAttachmentsInChat {
  static Future getattachments(
    int id,
    String token,
  ) async {
    print("GetAttachmentsInChat");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().get(
      "${Global.url}chat/attachments_chat/$id",
      options: Options(headers: headers, method: "GET"),
    );
    print(response.statusCode);

    print(response.data);
    return response;
  }
}

class GetMessagesInGroup {
  static Future getmessagesingroup(
    int id,
    String token,
  ) async {
    print("GetMessagesInGroup");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().get(
      "${Global.url}chat/get_message_in_group/$id",
      options: Options(headers: headers, method: "GET"),
    );
    print(response.statusCode);

    print(response.data);
    return response;
  }
}

class GetAttachmentsInGroup {
  static Future getattachments(
    int id,
    String token,
  ) async {
    print("GetAttachmentsInGroup");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().get(
      "${Global.url}chat/attachments_group/$id",
      options: Options(headers: headers, method: "GET"),
    );
    print(response.statusCode);

    print(response.data);
    return response;
  }
}

class GetPusherConfigrequest {
  static Future getpusherconfig(
    String? token,
  ) async {
    print("GetPusherConfig");

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };

    Response response = await Dio().get(
      "${Global.url}pusher_config",
      options: Options(headers: headers, method: "GET"),
    );
    print(response.statusCode);

    print(response.data);

    return response;
  }
}
