import 'package:equatable/equatable.dart';

class FQuestion extends Equatable {
  final dynamic id;

  final dynamic title;
  final dynamic shortDescription;
  final dynamic description;

  final dynamic createdAt;
  final dynamic img;
  //
  const FQuestion({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.createdAt,
    required this.img,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        shortDescription,
        description,
        createdAt,
        img,
        //
      ];
}
