import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/screens/search/data/searchrequest.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<Searchlawyers>((event, emit) async {
      print("Getlawyers");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          searchState: RequestState.loading,
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response response = await Searchrequest.search(state.token);
        var responsemap = jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            lawyers: List<LawyerModel>.from(
              (responsemap['lawyers'] as List).map(
                (e) => LawyerModel.fromJson(e),
              ),
            ),
            searchState: RequestState.loaded,
          ));
          print("state.lawyers=");
          print(state.lawyers);
        } else {
          emit(state.copyWith(
            searchState: RequestState.error,
            lawyersMessage: responsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          searchState: RequestState.error,
          lawyersMessage: "Unauthenticated",
        ));
      }
    });
  }
}
