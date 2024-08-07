import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/news.dart';
import 'package:lawyer/models/news_model.dart';
import 'package:lawyer/screens/news/data/news_request.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(const NewsState()) {
    on<GetNews>((event, emit) async {
      print("GetNews");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          newsState: RequestState.loading,
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response response = await NewsReqwest.getnews(state.token);
        var responsemap = await jsonDecode(response.body);
        print("news/responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            news: List<NewsM>.from(
              (responsemap as List).map(
                (e) => NewsModel.fromJson(e),
              ),
            ),
            newsState: RequestState.loaded,
          ));
          print("state.news=");
          print(state.news);
        } else {
          emit(state.copyWith(
            newsState: RequestState.error,
            newsMessage: responsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          newsState: RequestState.error,
          newsMessage: "Unauthenticated",
        ));
      }
    });
  }
}
