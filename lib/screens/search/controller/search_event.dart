part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {}

class Searchlawyers extends SearchEvent {
  final String query;
  Searchlawyers({
    required this.query,
  });

  @override
  List<Object?> get props => [];
}
