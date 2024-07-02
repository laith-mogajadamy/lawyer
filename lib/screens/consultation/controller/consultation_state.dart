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
  final List paymentmethods;

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
    this.paymentmethods = const [],
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
    List? paymentmethods,
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
      paymentmethods: paymentmethods ?? this.paymentmethods,
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
        paymentmethods,
      ];
}
