import 'package:lawyer/models/group.dart';
import 'package:lawyer/models/messagemodel.dart';

class GroupsModel extends Groups {
  const GroupsModel({
    required super.name,
    required super.isadmin,
    required super.messeges,
    required super.id,
  });

  factory GroupsModel.fromJson(Map<String, dynamic> json) => GroupsModel(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        isadmin: json['is_admin'] ?? 0,
        messeges: List<MessageModel>.from(
          ((json['messeges'] ?? []) as List).map(
            (e) => MessageModel.fromJson(e),
          ),
        ),
        //
      );
}
