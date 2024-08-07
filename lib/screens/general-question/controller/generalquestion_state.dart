part of 'generalquestion_bloc.dart';

class GeneralquestionState extends Equatable {
  final String token;
  //
  final List<Generalquestion> generalquestions;
  final RequestState generalquestionsState;
  final String generalquestionMessage;
  //
  final String generalquestionreplyMessage;
  //
  final List<FQuestion> frequentlyquestions;
  final RequestState frequentlyquestionsState;
  final String frequentlyquestionMessage;
  //
  const GeneralquestionState({
    this.token = '',
    //
    this.generalquestions = const [],
    this.generalquestionsState = RequestState.loading,
    this.generalquestionMessage = '',
    //
    this.generalquestionreplyMessage = '',
    //
    this.frequentlyquestions = const [],
    this.frequentlyquestionsState = RequestState.loading,
    this.frequentlyquestionMessage = '',
  });

  GeneralquestionState copyWith({
    String? token,
    //
    List<Generalquestion>? generalquestions,
    RequestState? generalquestionsState,
    String? generalquestionMessage,
    //
    String? generalquestionreplyMessage,
    //
    List<FQuestion>? frequentlyquestions,
    RequestState? frequentlyquestionsState,
    String? frequentlyquestionMessage,
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
      //
      frequentlyquestions: frequentlyquestions ?? this.frequentlyquestions,
      frequentlyquestionsState:
          frequentlyquestionsState ?? this.frequentlyquestionsState,
      frequentlyquestionMessage:
          frequentlyquestionMessage ?? this.frequentlyquestionMessage,
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
        generalquestionreplyMessage,
        //
        frequentlyquestions,
        frequentlyquestionsState,
        frequentlyquestionMessage,
      ];
}
