part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class Searchlawyers extends SearchEvent {
  Searchlawyers();

  @override
  List<Object?> get props => [];
}

class Bottomshow extends SearchEvent {
  final bool? bottom;

  Bottomshow({
    this.bottom,
  });

  @override
  List<Object?> get props => [bottom];
}

class Filtershow extends SearchEvent {
  final bool? filter;

  Filtershow({
    this.filter,
  });

  @override
  List<Object?> get props => [filter];
}

class ChangeSearchField extends SearchEvent {
  final String? searchfield;

  ChangeSearchField({
    this.searchfield,
  });

  @override
  List<Object?> get props => [searchfield];
}

class ChangeFilterType extends SearchEvent {
  final String? filtertype;

  ChangeFilterType({
    this.filtertype,
  });

  @override
  List<Object?> get props => [filtertype];
}

class CountryCheck extends SearchEvent {
  final City? slelected;

  final bool? check;

  CountryCheck({
    this.check,
    this.slelected,
  });

  @override
  List<Object?> get props => [
        check,
        slelected,
      ];
}

class CityCheck extends SearchEvent {
  final City? slelected;

  final bool? check;

  CityCheck({
    this.check,
    this.slelected,
  });

  @override
  List<Object?> get props => [
        check,
        slelected,
      ];
}

class CheckPractise extends SearchEvent {
  final Practice? slelected;

  final bool? check;

  CheckPractise({
    this.check,
    this.slelected,
  });

  @override
  List<Object?> get props => [
        check,
        slelected,
      ];
}

class CheckLanguage extends SearchEvent {
  final Language? slelected;

  final bool? check;

  CheckLanguage({
    this.check,
    this.slelected,
  });

  @override
  List<Object?> get props => [
        check,
        slelected,
      ];
}

class GetSearchFilters extends SearchEvent {
  GetSearchFilters();

  @override
  List<Object?> get props => [];
}
