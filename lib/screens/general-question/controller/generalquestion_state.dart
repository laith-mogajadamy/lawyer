part of 'generalquestion_bloc.dart';

class GeneralquestionState extends Equatable {
  final String token;
  //
  final List<Generalquestion> generalquestions;
  final RequestState generalquestionsState;
  final String generalquestionMessage;
  //
  const GeneralquestionState({
    this.token = '',
    //
    this.generalquestions = const [],
    this.generalquestionsState = RequestState.loading,
    this.generalquestionMessage = '',
    //
  });

  GeneralquestionState copyWith({
    String? token,
    //
    final List<Generalquestion>? generalquestions,
    final RequestState? generalquestionsState,
    final String? generalquestionMessage,
  }) {
    return GeneralquestionState(
      token: token ?? this.token,

      //
      generalquestions: generalquestions ?? this.generalquestions,
      generalquestionsState:
          generalquestionsState ?? this.generalquestionsState,
      generalquestionMessage:
          generalquestionMessage ?? this.generalquestionMessage,
      //
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        generalquestions,
        generalquestionsState,
        generalquestionMessage,
        //
      ];
}
