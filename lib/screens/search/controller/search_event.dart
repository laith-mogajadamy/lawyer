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

class Check extends SearchEvent {
  final int? index;

  final bool? check;

  Check({
    this.check,
    this.index,
  });

  @override
  List<Object?> get props => [
        check,
        index,
      ];
}
