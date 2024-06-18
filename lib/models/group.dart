import 'package:equatable/equatable.dart';
import 'package:lawyer/models/message.dart';

class Groups extends Equatable {
  final dynamic id;

  final dynamic name;
  final dynamic isadmin;
  final List<Message> messeges;
  //

  const Groups({
    required this.id,
    required this.name,
    required this.isadmin,
    required this.messeges,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        isadmin,
        messeges,
        //
      ];
}
