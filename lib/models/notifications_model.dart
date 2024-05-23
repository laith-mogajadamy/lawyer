import 'package:lawyer/models/notifications.dart';

class NotificationsModel extends Notifications {
  const NotificationsModel({
    required super.userid,
    required super.joineduser,
    required super.email,
    required super.createdAt,
    required super.clientid,
    required super.clientname,
    required super.consultationid,
    required super.consultationtitle,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        userid: json['data']['user_id'] ?? 0,
        joineduser: json['data']['joined_user'] ?? '',
        email: json['data']['email'] ?? '',
        //
        createdAt: json['createdAt'] ?? '',
        //
        clientid: json['data']['client_id'] ?? 0,
        clientname: json['data']['client_name'] ?? '',
        consultationid: json['data']['consultation_id'] ?? 0,
        consultationtitle: json['data']['consultation_title'] ?? '',
      );
}
