part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  final String? searchText;
  const SearchEvent({this.searchText});

  @override
  List<Object> get props => [searchText!];

  @override 
  String toString() => "I'm the type of $runtimeType";
}

class SearchChanged extends SearchEvent {
  final String? seachText;
  const SearchChanged(this.seachText);
}

class SearchSubmitted extends SearchEvent {
  final String? seachText;
  const SearchSubmitted({this.seachText});
}

class SearchReset extends SearchEvent {
  const SearchReset();
}

class ShowLoader extends SearchEvent {
  const ShowLoader();
}
