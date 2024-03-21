import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lawyer/core/utils/enums.dart';
import 'package:lawyer/core/utils/formstatus.dart';

part 'enter_event.dart';
part 'enter_state.dart';

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterBloc() : super(const EnterState()) {
    on<LoginUsernameChanged>((event, emit) async {
      emit(state.copyWith(
        username: event.username,
      ));
    });
    on<LoginPasswordChanged>((event, emit) async {
      emit(state.copyWith(
        password: event.password,
      ));
    });
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(
          formStatus: FormSubmitting(),
          username: state.username,
          password: state.password));

      try {
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });
  }
}
