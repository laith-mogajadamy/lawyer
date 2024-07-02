import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/screens/lawyers_and_translation_company/data/lawyerrqwest.dart';
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
        ));
        print("state.token");
        print(state.token);
        // http.Response response =
        //     await Searchrequest.search(event.query, state.token);
        http.Response response = await Searchrequest.search(
            state.searchfield,
            (state.selectedlocations.isNotEmpty)
                ? state.selectedlocations[0]
                : "",
            (state.selectedpractices.isNotEmpty)
                ? state.selectedpractices[0]
                : "",
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
    on<Filtershow>((event, emit) async {
      emit(
        state.copyWith(
          filter: event.filter,
        ),
      );
    });
    on<Bottomshow>((event, emit) async {
      emit(
        state.copyWith(
          bottom: event.bottom,
          locations: [
            "Abu Dhab",
            "Dubai",
            "Ajman",
            "Al Ain",
            "Fujairah",
            "Ras Al Khaima",
            "Sharjah",
            "Um Al Quwain",
          ],
          practices: [
            "Tax",
            "Business \n(corporate)",
            "Family",
            "Estate Planning",
            "Emoplyment \n& Labot",
            "Personal Injury",
            "Intellectual \nProperty",
            "Immigration",
            "Constitutional",
            "Criminal Defense",
            "Bankruptcy",
            "Entertainment",
          ],
          languages: [
            "ar",
            "en",
            "ko",
            "fr",
          ],
        ),
      );
    });
    on<ChangeSearchField>((event, emit) async {
      emit(
        state.copyWith(
          searchfield: event.searchfield,
        ),
      );
    });
    on<Check>((event, emit) async {
      if (state.searchfield == "location") {
        List slected = List.from(state.selectedlocations);

        if (event.check!) {
          slected.add(event.slelected);
        } else {
          slected.remove(event.slelected);
        }
        emit(
          state.copyWith(
            selectedlocations: slected,
            // searchfield:
            //     (state.searchfield == "location") ? "Practice" : "location",
          ),
        );
        print("slected");
        print(state.selectedlocations);
      } else if ((state.searchfield == "Practice")) {
        List slected = List.from(state.selectedpractices);

        if (event.check!) {
          slected.add(event.slelected);
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
      } else {
        List slected = List.from(state.selectedlanguages);

        if (event.check!) {
          slected.add(event.slelected);
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
      }
    });
  }
}
