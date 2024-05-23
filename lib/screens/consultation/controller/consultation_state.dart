part of 'consultation_bloc.dart';

class ConsultationState extends Equatable {
  final String token;
  //
  final RequestState consultationState;
  final String consultationMessage;
  //
  final String consultationreplyMessage;
  final RequestState invoicestate;
  final String invoiceMessage;

  const ConsultationState({
    this.token = '',
    //
    this.consultationState = RequestState.loading,
    this.consultationMessage = '',
    //
    this.consultationreplyMessage = '',
    //
    this.invoicestate = RequestState.loading,
    this.invoiceMessage = '',
  });

  ConsultationState copyWith({
    String? token,
    //
    RequestState? consultationState,
    String? consultationMessage,
    //
    String? consultationreplyMessage,
    //
    RequestState? invoicestate,
    String? invoiceMessage,
  }) {
    return ConsultationState(
      token: token ?? this.token,

      //
      consultationState: consultationState ?? this.consultationState,
      consultationMessage: consultationMessage ?? this.consultationMessage,
      //
      consultationreplyMessage:
          consultationreplyMessage ?? this.consultationreplyMessage,
      //
      invoicestate: invoicestate ?? this.invoicestate,
      invoiceMessage: invoiceMessage ?? this.invoiceMessage,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        consultationState,
        consultationMessage,
        //
        consultationreplyMessage,
        //
        invoicestate,
        invoiceMessage,
      ];
}
