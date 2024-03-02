// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  inputChanged,
  loading,
  success,
  failure,
}

class SearchState extends Equatable {
  const SearchState({
    this.status = SearchStatus.initial,
    this.searchText = "",
    this.properties = const <Property>[],
  });

  final SearchStatus? status;
  final String? searchText;
  final List<Property>? properties;

  @override
  List<Object> get props => [searchText!, properties!, status!];

  SearchState copyWith({
    SearchStatus? status,
    String? searchText,
    List<Property>? properties,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchText: searchText ?? this.searchText,
      properties: properties ?? this.properties,
    );
  }
}
