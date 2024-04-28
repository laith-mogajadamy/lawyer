part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String token;
  //
  final List<Lawyer> lawyers;
  final RequestState searchState;
  final String lawyersMessage;
  //
  final List<Lawyer> legalconsultant;
  //
  final List<Lawyer> typingCenters;

  const SearchState({
    this.token = '',
    //
    this.lawyers = const [],
    this.searchState = RequestState.loading,
    this.lawyersMessage = '',
    //
    this.legalconsultant = const [],
    //
    this.typingCenters = const [],
  });

  SearchState copyWith({
    String? token,
    //
    final List<Lawyer>? lawyers,
    final RequestState? searchState,
    final String? lawyersMessage,
    //
    final List<Lawyer>? legalconsultant,
    //
    final List<Lawyer>? typingCenters,
  }) {
    return SearchState(
      token: token ?? this.token,

      //
      lawyers: lawyers ?? this.lawyers,
      searchState: searchState ?? this.searchState,
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
        searchState,
        lawyersMessage,
        //
        legalconsultant,
        //
        typingCenters
      ];
}
