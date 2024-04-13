import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;
import 'package:lawyer/screens/consultation/data/consultation_request.dart';

part 'consultation_event.dart';
part 'consultation_state.dart';

class ConsultationBloc extends Bloc<ConsultationEvent, ConsultationState> {
  ConsultationBloc() : super(const ConsultationState()) {
    on<Addconsultation>((event, emit) async {
      print("Addconsultation");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
            token: ptoken, consultationState: RequestState.loading));
        print("state.token");
        print(state.token);
        http.Response response = await ConsultationRequest.addconsultation(
            state.token, event.id, event.title!, event.description!);
        var responsemap = await jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
              consultationMessage: "consultation added successfully ",
              consultationState: RequestState.loaded));
        } else {
          emit(state.copyWith(
            consultationMessage: responsemap["message"],
            consultationState: RequestState.error,
          ));
        }
      } else {
        emit(state.copyWith(
          consultationMessage: "Unauthenticated",
          consultationState: RequestState.error,
        ));
      }
    });
    on<Answerconsultation>((event, emit) async {
      print("Answerconsultation");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
            token: ptoken, consultationState: RequestState.loading));
        print("state.token");
        print(state.token);
        http.Response response = await ConsultationRequest.answerconsultation(
            state.token, event.id, event.answer);
        var responsemap = await jsonDecode(response.body);
        print("responsemap=");
        print(responsemap);
        if (response.statusCode == 200) {
          emit(state.copyWith(
              consultationMessage: "consultation answered successfully ",
              consultationState: RequestState.loaded));
        } else {
          emit(state.copyWith(
            consultationMessage: responsemap["message"],
            consultationState: RequestState.error,
          ));
        }
      } else {
        emit(state.copyWith(
          consultationMessage: "Unauthenticated",
          consultationState: RequestState.error,
        ));
      }
    });
  }
}
