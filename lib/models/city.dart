import 'package:equatable/equatable.dart';

class City extends Equatable {
  final dynamic id;

  final String name;

  //

  const City({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,

        //
      ];
}
