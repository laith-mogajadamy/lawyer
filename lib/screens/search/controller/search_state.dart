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
//
  final bool filter;

  final bool bottom;
  final String searchfield;

  final List location;
  final List practice;
  final List locations;
  final List practices;

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
    //
    this.bottom = false,
    this.filter = false,
    this.searchfield = 'location',
    this.location = const [],
    this.practice = const [],
    this.locations = const [],
    this.practices = const [],
  });

  SearchState copyWith({
    String? token,
    //
    List<Lawyer>? lawyers,
    RequestState? searchState,
    String? lawyersMessage,
    //
    List<Lawyer>? legalconsultant,
    //
    List<Lawyer>? typingCenters,
    //
    bool? bottom,
    bool? filter,
    String? searchfield,
    List? location,
    List? practice,
    List? locations,
    List? practices,
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
      //
      filter: filter ?? this.filter,

      bottom: bottom ?? this.bottom,
      searchfield: searchfield ?? this.searchfield,
      location: location ?? this.location,
      practice: practice ?? this.practice,
      locations: locations ?? this.locations,
      practices: practices ?? this.practices,
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
        typingCenters,
        //
        bottom,
        filter,
        searchfield,
        location,
        practice,
        locations,
        practices,
      ];
}
