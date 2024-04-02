part of 'lawyers_bloc.dart';

class LawyersState extends Equatable {
  final String token;
  //
  final List<Lawyer> lawyers;
  final RequestState lawyersState;
  final String lawyersMessage;
  //
  const LawyersState({
    this.token = '',
    //
    this.lawyers = const [],
    this.lawyersState = RequestState.loading,
    this.lawyersMessage = '',
    //
  });

  LawyersState copyWith({
    String? token,
    //
    final List<Lawyer>? lawyers,
    final RequestState? lawyersState,
    final String? lawyersMessage,
  }) {
    return LawyersState(
      token: token ?? this.token,

      //
      lawyers: lawyers ?? this.lawyers,
      lawyersState: lawyersState ?? this.lawyersState,
      lawyersMessage: lawyersMessage ?? this.lawyersMessage,
      //
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
      ];
}
