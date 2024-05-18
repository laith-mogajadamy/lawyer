import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:lawyer/models/lawyer.dart';
import 'package:lawyer/models/lawyermodel.dart';
import 'package:lawyer/screens/lawyers/data/lawyerrqwest.dart';
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
        // http.Response response =
        //     await Searchrequest.search(event.query, state.token);
        http.Response response = await Lawyersreqwest.getlawyers(state.token);
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
            ["Abu Dhab", false],
            ["Dubai", false],
            ["Ajman", false],
            ["Al Ain", false],
            ["Fujairah", false],
            ["Ras Al Khaima", false],
            ["Sharjah", false],
            ["Um Al Quwain", false],
          ],
          practices: [
            ["Tax", false],
            ["Business \n(corporate)", false],
            ["Family", false],
            ["Estate Planning", false],
            ["Emoplyment \n& Labot", false],
            ["Personal Injury", false],
            ["Intellectual \nProperty", false],
            ["Immigration", false],
            ["Constitutional", false],
            ["Criminal Defense", false],
            ["Bankruptcy", false],
            ["Entertainment", false],
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
        List newlist = List.from(state.locations);
        List slected = List.from(state.location);

        print("before");

        print(newlist);
        newlist[event.index!][1] = event.check;
        print("after");

        print(newlist);
        if (event.check!) {
          slected.add(state.locations[event.index!][0]);
        } else {
          slected.remove(state.locations[event.index!][0]);
        }
        emit(
          state.copyWith(
            locations: newlist,
            location: slected,
            // searchfield:
            //     (state.searchfield == "location") ? "Practice" : "location",
          ),
        );
        print("slected");
        print(state.location);
      } else {
        List newlist = List.from(state.practices);
        List slected = List.from(state.practice);
        print("before");

        print(newlist);
        newlist[event.index!][1] = event.check;
        print("after");

        print(newlist);
        if (event.check!) {
          slected.add(state.practices[event.index!][0]);
        } else {
          slected.remove(state.practices[event.index!][0]);
        }
        emit(
          state.copyWith(
            practices: newlist,
            practice: slected,
            // searchfield:
            //     (state.searchfield == "location") ? "Practice" : "location",
          ),
        );
        print("slected");
        print(state.practice);
      }
    });
  }
}
