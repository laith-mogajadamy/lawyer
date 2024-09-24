import 'package:equatable/equatable.dart';

class Practice extends Equatable {
  final dynamic id;

  final dynamic name;
  final dynamic description;

  const Practice({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
      ];
}
