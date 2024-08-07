import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/city.dart';
import 'package:lawyer/models/language.dart';
import 'package:lawyer/models/language_model.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/models/practice.dart';
import 'package:lawyer/models/practice_model.dart';
import 'package:lawyer/screens/search/data/searchrequest.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<Searchlawyers>((event, emit) async {
      print("Searchlawyers");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          searchState: RequestState.loading,
          token: ptoken,
          bottom: false,
        ));
        print("state.token");
        print(state.token);
        // http.Response response =
        //     await Searchrequest.search(event.query, state.token);
        print(state.searchfield);

        http.Response response = await Searchrequest.search(
            state.searchfield,
            (state.selectedcitys.isNotEmpty) ? state.selectedcitys : [],
            (state.selectedpractices.isNotEmpty) ? state.selectedpractices : [],
            (state.selectedlanguages.isNotEmpty) ? state.selectedlanguages : [],
            state.token);
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
          print("state.searchlawyers=");
          print(state.searchState);
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
    //
    on<GetSearchFilters>((event, emit) async {
      print("GetSearchFilters");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          searchState: RequestState.loading,
          token: ptoken,
        ));
        print("state.token");
        print(state.token);
        http.Response practiseresponse =
            await SearchFilterRequest.getpractice();
        var practiseresponsemap = jsonDecode(practiseresponse.body);
        print("practiseresponsemap=");
        print(practiseresponsemap);
        http.Response languageresponse =
            await SearchFilterRequest.getlanguage();
        var languageresponsemap = jsonDecode(languageresponse.body);
        //get the locations
        print("practiseresponsemap=");
        print(practiseresponsemap);
        print("languageresponsemap=");
        print(languageresponsemap);

        if (practiseresponse.statusCode == 200 &&
            languageresponse.statusCode == 200) {
          emit(state.copyWith(
            locations: ["1", "2"],
            practices: List<PracticeModel>.from(
              (practiseresponsemap as List).map(
                (e) => PracticeModel.fromJson(e),
              ),
            ),
            languages: List<LanguageModel>.from(
              (languageresponsemap as List).map(
                (e) => LanguageModel.fromJson(e),
              ),
            ),
            searchfiltersState: RequestState.loaded,
          ));
          print("state.practices=");
          print(state.practices);
          print("state.languages=");
          print(state.languages);
        } else {
          emit(state.copyWith(
            searchfiltersState: RequestState.error,
            searchfiltersMessage: practiseresponsemap["message"],
          ));
        }
      } else {
        emit(state.copyWith(
          searchfiltersState: RequestState.error,
          searchfiltersMessage: "Unauthenticated",
        ));
      }
    });
    //
    on<Filtershow>((event, emit) async {
      print("Filtershow");
      emit(
        state.copyWith(
          filter: event.filter,
          bottom: false,
        ),
      );
      if (state.practices.isEmpty ||
          state.languages.isEmpty ||
          state.locations.isEmpty) {
        add(GetSearchFilters());
      } else {}
    });
    on<Bottomshow>((event, emit) async {
      emit(
        state.copyWith(
          bottom: event.bottom,
        ),
      );
    });
    on<ChangeSearchField>((event, emit) async {
      emit(
        state.copyWith(
          searchfield: event.searchfield,
        ),
      );
      print(state.searchfield);
    });
    //
    on<ChangeFilterType>((event, emit) async {
      emit(
        state.copyWith(
          filtertype: event.filtertype,
        ),
      );
      print(state.filtertype);
    });
    on<CountryCheck>((event, emit) async {
      if (state.filtertype == "location") {
        emit(
          state.copyWith(
            selectedcountry: event.slelected,
            // searchfield:
            //     (state.searchfield == "location") ? "Practice" : "location",
          ),
        );
        print("slected");
        print(state.selectedcountry);
      }
    });
    on<CityCheck>((event, emit) async {
      if (state.filtertype == "location") {
        List<City> slected = List.from(state.selectedcitys);

        if (event.check!) {
          slected.add(event.slelected!);
        } else {
          slected.remove(event.slelected);
        }
        emit(
          state.copyWith(
            selectedcitys: slected,
            // searchfield:
            //     (state.searchfield == "location") ? "Practice" : "location",
          ),
        );
        print("slected");
        print(state.selectedcountry);

        print(state.selectedcitys);
      }
    });
    on<CheckPractise>((event, emit) async {
      if ((state.filtertype == "Practice")) {
        List<Practice> slected = List.from(state.selectedpractices);
        if (event.check!) {
          slected.add(event.slelected!);
        } else {
          slected.remove(event.slelected);
        }
        emit(
          state.copyWith(
            selectedpractices: slected,
            // searchfield:
            //     (state.searchfield == "location") ? "Practice" : "location",
          ),
        );
        print("slected");
        print(state.selectedpractices);
      }
    });
    on<CheckLanguage>((event, emit) async {
      List<Language> slected = List.from(state.selectedlanguages);

      if (event.check!) {
        slected.add(event.slelected!);
      } else {
        slected.remove(event.slelected);
      }
      emit(
        state.copyWith(
          selectedlanguages: slected,
          // searchfield:
          //     (state.searchfield == "location") ? "Practice" : "location",
        ),
      );
      print("slected");
      print(state.selectedlanguages);
    });
  }
}
