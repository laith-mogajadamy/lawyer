part of 'generalquestion_bloc.dart';

abstract class GeneralquestionEvent extends Equatable {}

class GetGeneralquestion extends GeneralquestionEvent {
  GetGeneralquestion();

  @override
  List<Object?> get props => [];
}

class ReplayGeneralquestion extends GeneralquestionEvent {
  final int? id;
  final String? replay;

  ReplayGeneralquestion({this.replay, this.id});

  @override
  List<Object?> get props => [id, replay];
}

class AddGeneralquestion extends GeneralquestionEvent {
  final String? question;

  AddGeneralquestion({this.question});

  @override
  List<Object?> get props => [question];
}
