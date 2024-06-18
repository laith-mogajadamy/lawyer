part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class GetNews extends NewsEvent {
  GetNews();

  @override
  List<Object?> get props => [];
}
