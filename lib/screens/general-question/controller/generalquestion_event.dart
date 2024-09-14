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
  final String? title;

  final String? question;

  AddGeneralquestion({this.title, this.question});

  @override
  List<Object?> get props => [title, question];
}

class GetFrequentlyQuestions extends GeneralquestionEvent {
  GetFrequentlyQuestions();

  @override
  List<Object?> get props => [];
}

class GetFrequentlyQuestionsEN extends GeneralquestionEvent {
  GetFrequentlyQuestionsEN();

  @override
  List<Object?> get props => [];
}

class GetFrequentlyQuestionsAR extends GeneralquestionEvent {
  GetFrequentlyQuestionsAR();

  @override
  List<Object?> get props => [];
}
