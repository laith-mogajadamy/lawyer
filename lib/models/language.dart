import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final dynamic id;

  final dynamic name;

  const Language({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
