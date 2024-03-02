import 'dart:io';

import 'package:strava_clone/src/network/models/property_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchBloc() : super(const SearchState()) {
    on<SearchChanged>(_onSearchChanged);
    on<SearchSubmitted>(_searchSubmitted);
    on<ShowLoader>(_showLoader);
    on<SearchReset>(_searchReset);
  }

  void _onSearchChanged(SearchChanged event, Emitter<SearchState> emit) {
    emit(state.copyWith(status: SearchStatus.loading));
  }

  void _searchReset(SearchReset event, Emitter<SearchState> emit) {
    emit(state.copyWith(status: SearchStatus.initial));
  }

   void _showLoader(ShowLoader event, Emitter<SearchState> emit) {
    emit(state.copyWith(status: SearchStatus.loading));
  }

  Future<void> _searchSubmitted(SearchSubmitted event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchStatus.loading));
    final posts = await fetchPost(page:1, searchText: event.seachText);
    // List<String> posts = ["one", "Two", "Trhee"];
    emit(state.copyWith(status: SearchStatus.success));
    // sleep(const Duration(milliseconds: 10000));
    // emit(const SearchInitial(''));
  }

  Future<void>  fetchPost({int page = 1, String? searchText}) async {
    var url = Uri.https('staging-api.uae.estate', '/api/app_get_search_list', {'page':'1'});
    print(url);
    try {
      var response = await http.get(url);  
      switch (response.statusCode) {
        case 200:
          
          break;  
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch(e) {
        rethrow;
    }
  }


}
