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

  final List selectedlocations;
  final List selectedpractices;
  final List locations;
  final List practices;
  final List selectedlanguages;
  final List languages;

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
    this.selectedlocations = const [],
    this.selectedpractices = const [],
    this.locations = const [],
    this.practices = const [],
    this.selectedlanguages = const [],
    this.languages = const [],
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
    List? selectedlocations,
    List? selectedpractices,
    List? locations,
    List? practices,
    List? selectedlanguages,
    List? languages,
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
      selectedlocations: selectedlocations ?? this.selectedlocations,
      selectedpractices: selectedpractices ?? this.selectedpractices,
      locations: locations ?? this.locations,
      practices: practices ?? this.practices,
      selectedlanguages: selectedlanguages ?? this.selectedlanguages,
      languages: languages ?? this.languages,
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
        selectedlocations,
        selectedpractices,
        locations,
        practices,
        selectedlanguages,
        languages,
      ];
}
