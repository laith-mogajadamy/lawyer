part of 'generalquestion_bloc.dart';

class GeneralquestionState extends Equatable {
  final String token;
  //
  final List<Generalquestion> generalquestions;
  final RequestState generalquestionsState;
  final String generalquestionMessage;
  //
  final String generalquestionreplyMessage;

  const GeneralquestionState({
    this.token = '',
    //
    this.generalquestions = const [],
    this.generalquestionsState = RequestState.loading,
    this.generalquestionMessage = '',
    //
    this.generalquestionreplyMessage = '',
  });

  GeneralquestionState copyWith({
    String? token,
    //
    final List<Generalquestion>? generalquestions,
    final RequestState? generalquestionsState,
    final String? generalquestionMessage,
    //
    final String? generalquestionreplyMessage,
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
      generalquestionreplyMessage:
          generalquestionreplyMessage ?? this.generalquestionreplyMessage,
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
        generalquestionreplyMessage
      ];
}
