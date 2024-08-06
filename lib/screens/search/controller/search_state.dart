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
  //
  final String filtertype;
  final City selectedcountry;
  final List<City> selectedcitys;
  final List<Practice> selectedpractices;
  final List locations;
  final List<City> uaecitys;
  final List<City> soudicitys;
  final List<City> coutrys;
  final List<Practice> practices;
  final List<Language> selectedlanguages;
  final List<Language> languages;
  //
  final RequestState searchfiltersState;
  final String searchfiltersMessage;
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
    this.searchfield = '',
    this.filtertype = 'location',
    this.selectedcountry = const City(id: 0, name: ''),
    this.selectedcitys = const [],
    this.uaecitys = const [
      City(id: 100, name: "Dubai"),
      City(id: 101, name: "Abu Dhabi"),
      City(id: 102, name: "Ajman"),
      City(id: 103, name: "Rak"),
      City(id: 104, name: "Fujairah"),
      City(id: 105, name: "UM ALQ"),
      City(id: 106, name: "Sharjah"),
    ],
    this.soudicitys = const [
      City(id: 1, name: "Riyadh"),
      City(id: 2, name: "Mecca"),
      City(id: 3, name: "Madina"),
      City(id: 4, name: "Damam"),
      City(id: 5, name: "Jeddah"),
      City(id: 6, name: "Khobar"),
      City(id: 7, name: "Abha"),
      City(id: 8, name: "Tabuk"),
      City(id: 9, name: "Hail"),
      City(id: 10, name: "Jazan"),
      City(id: 11, name: "Najran"),
      City(id: 12, name: "Baha"),
      City(id: 13, name: "AlJouf"),
    ],
    this.coutrys = const [
      City(id: 1, name: "Saudi"),
      City(id: 2, name: "UAE"),
    ],
    this.selectedpractices = const [],
    this.locations = const [],
    this.practices = const [],
    this.selectedlanguages = const [],
    this.languages = const [],
    //
    this.searchfiltersState = RequestState.loading,
    this.searchfiltersMessage = '',
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
    String? filtertype,
    List<City>? selectedcitys,
    City? selectedcountry,
    List<Practice>? selectedpractices,
    List? locations,
    List<Practice>? practices,
    List<City>? uaecitys,
    List<City>? soudicitys,
    List<City>? coutrys,
    List<Language>? selectedlanguages,
    List<Language>? languages,
    //
    RequestState? searchfiltersState,
    String? searchfiltersMessage,
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
      filtertype: filtertype ?? this.filtertype,
      //
      selectedcitys: selectedcitys ?? this.selectedcitys,
      selectedcountry: selectedcountry ?? this.selectedcountry,
      uaecitys: uaecitys ?? this.uaecitys,
      soudicitys: soudicitys ?? this.soudicitys,
      coutrys: coutrys ?? this.coutrys,
      selectedpractices: selectedpractices ?? this.selectedpractices,
      locations: locations ?? this.locations,
      practices: practices ?? this.practices,
      selectedlanguages: selectedlanguages ?? this.selectedlanguages,
      languages: languages ?? this.languages,
      //
      searchfiltersState: searchfiltersState ?? this.searchfiltersState,
      searchfiltersMessage: searchfiltersMessage ?? this.searchfiltersMessage,
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
        filtertype,
        selectedcitys,
        selectedcountry,
        uaecitys,
        soudicitys,
        coutrys,
        selectedpractices,
        locations,
        practices,
        selectedlanguages,
        languages,
        //
        searchfiltersState,
        searchfiltersMessage,
      ];
}
