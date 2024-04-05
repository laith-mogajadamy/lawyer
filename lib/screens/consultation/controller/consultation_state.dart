part of 'consultation_bloc.dart';

class ConsultationState extends Equatable {
  final String token;
  //
  final RequestState consultationState;
  final String consultationMessage;
  //
  final String consultationreplyMessage;

  const ConsultationState({
    this.token = '',
    //
    this.consultationState = RequestState.loading,
    this.consultationMessage = '',
    //
    this.consultationreplyMessage = '',
  });

  ConsultationState copyWith({
    String? token,
    //
    final RequestState? consultationState,
    final String? consultationMessage,
    //
    final String? consultationreplyMessage,
  }) {
    return ConsultationState(
      token: token ?? this.token,

      //
      consultationState: consultationState ?? this.consultationState,
      consultationMessage: consultationMessage ?? this.consultationMessage,
      //
      consultationreplyMessage:
          consultationreplyMessage ?? this.consultationreplyMessage,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        consultationState,
        consultationMessage,
        //
        consultationreplyMessage
      ];
}
