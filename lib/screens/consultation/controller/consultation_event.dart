part of 'consultation_bloc.dart';

abstract class ConsultationEvent extends Equatable {}

class Addconsultation extends ConsultationEvent {
  final int id;
  final String? title;
  final String? description;
  final String? invoiceid;
  final String? receiverid;
  final String? invoicevalue;

  Addconsultation(
      {required this.id,
      required this.title,
      required this.description,
      required this.invoiceid,
      required this.receiverid,
      required this.invoicevalue});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        invoiceid,
        receiverid,
        invoicevalue,
      ];
}

class Answerconsultation extends ConsultationEvent {
  final int id;
  final String answer;
  Answerconsultation({
    required this.id,
    required this.answer,
  });

  @override
  List<Object?> get props => [id, answer];
}

class SendInvoice extends ConsultationEvent {
  final String invoiceId;
  final String senderid;
  final String receiverid;
  final String consultationid;
  final String invoicevalue;

  SendInvoice({
    required this.invoiceId,
    required this.senderid,
    required this.receiverid,
    required this.consultationid,
    required this.invoicevalue,
  });

  @override
  List<Object?> get props => [
        invoiceId,
        senderid,
        receiverid,
        consultationid,
        invoicevalue,
      ];
}

class AddPaymentMethods extends ConsultationEvent {
  final List methods;
  AddPaymentMethods({
    required this.methods,
  });

  @override
  List<Object?> get props => [
        methods,
      ];
}

class StartPayment extends ConsultationEvent {
  final String? language;
  final int paymentid;
  final int senderid;
  final String? title;
  final String? description;
  final int? receiverid;
  final String? invoicevalue;

  StartPayment({
    required this.language,
    required this.paymentid,
    required this.senderid,
    required this.title,
    required this.description,
    required this.receiverid,
    required this.invoicevalue,
  });

  @override
  List<Object?> get props => [
        language,
        paymentid,
        senderid,
        title,
        description,
        receiverid,
        invoicevalue,
      ];
}
