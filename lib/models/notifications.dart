import 'package:equatable/equatable.dart';

class Notifications extends Equatable {
  final dynamic userid;
  final dynamic joineduser;
  final dynamic email;
  //
  final dynamic createdAt;
  //
  final dynamic clientid;
  final dynamic clientname;
  final dynamic consultationid;
  final dynamic consultationtitle;

  const Notifications({
    required this.userid,
    required this.joineduser,
    required this.email,
    required this.createdAt,
    required this.clientid,
    required this.clientname,
    required this.consultationid,
    required this.consultationtitle,
  });

  @override
  List<Object?> get props => [
        userid,
        joineduser,
        email,
        //
        createdAt,
        //
        clientid,
        clientname,
        consultationid,
        consultationtitle,
      ];
}
