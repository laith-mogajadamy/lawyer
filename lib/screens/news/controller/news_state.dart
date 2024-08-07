part of 'news_bloc.dart';

class NewsState extends Equatable {
  final String token;
  //
  final List<NewsM> news;
  final RequestState newsState;
  final String newsMessage;
  //

  const NewsState({
    this.token = '',
    //
    this.news = const [],
    this.newsState = RequestState.loading,
    this.newsMessage = '',
    //
  });

  NewsState copyWith({
    String? token,
    //
    List<NewsM>? news,
    RequestState? newsState,
    String? newsMessage,
    //
  }) {
    return NewsState(
      token: token ?? this.token,

      //
      news: news ?? this.news,
      newsState: newsState ?? this.newsState,
      newsMessage: newsMessage ?? this.newsMessage,
      //
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        news,
        newsState,
        newsMessage,
        //
      ];
}
