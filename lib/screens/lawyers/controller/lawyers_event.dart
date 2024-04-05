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
