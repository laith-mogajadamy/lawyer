part of 'consultation_bloc.dart';

abstract class ConsultationEvent extends Equatable {}

class Addconsultation extends ConsultationEvent {
  final int id;
  final String? title;
  final String? description;
  Addconsultation(
      {required this.id, required this.title, required this.description});

  @override
  List<Object?> get props => [id, title, description];
}
