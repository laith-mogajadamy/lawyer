part of 'lawyers_bloc.dart';

abstract class LawyersEvent extends Equatable {}

class Getlawyers extends LawyersEvent {
  Getlawyers();

  @override
  List<Object?> get props => [];
}

class GetlegalConsultant extends LawyersEvent {
  GetlegalConsultant();

  @override
  List<Object?> get props => [];
}

class GettypingCenter extends LawyersEvent {
  GettypingCenter();

  @override
  List<Object?> get props => [];
}

class Selecteshow extends LawyersEvent {
  final bool? selecte;

  Selecteshow({
    this.selecte,
  });

  @override
  List<Object?> get props => [selecte];
}

class CheckLawyer extends LawyersEvent {
  final Lawyer? lawyer;

  final bool? check;

  CheckLawyer({
    this.check,
    this.lawyer,
  });

  @override
  List<Object?> get props => [
        check,
        lawyer,
      ];
}

class CreateGroup extends LawyersEvent {
  final String? name;

  CreateGroup({
    this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
