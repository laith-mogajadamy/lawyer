part of 'lawyers_bloc.dart';

class LawyersState extends Equatable {
  final String token;
  //
  final List<Lawyer> lawyers;
  final RequestState lawyersState;
  final String lawyersMessage;
  //
  final List<Lawyer> legalconsultant;
  //
  final List<Lawyer> typingCenters;

  const LawyersState({
    this.token = '',
    //
    this.lawyers = const [],
    this.lawyersState = RequestState.loading,
    this.lawyersMessage = '',
    //
    this.legalconsultant = const [],
    //
    this.typingCenters = const [],
  });

  LawyersState copyWith({
    String? token,
    //
    final List<Lawyer>? lawyers,
    final RequestState? lawyersState,
    final String? lawyersMessage,
    //
    final List<Lawyer>? legalconsultant,
    //
    final List<Lawyer>? typingCenters,
  }) {
    return LawyersState(
      token: token ?? this.token,

      //
      lawyers: lawyers ?? this.lawyers,
      lawyersState: lawyersState ?? this.lawyersState,
      lawyersMessage: lawyersMessage ?? this.lawyersMessage,
      //
      legalconsultant: legalconsultant ?? this.legalconsultant,
      //
      typingCenters: typingCenters ?? this.typingCenters,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        lawyers,
        lawyersState,
        lawyersMessage,
        //
        legalconsultant,
        //
        typingCenters
      ];
}
