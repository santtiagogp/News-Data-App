import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/entities/news_model.dart';

import '../../../../domain/use_cases/news_use_cases.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final NewsUseCases _useCases;

  SearchBloc( this._useCases ) : super(SearchInitial()) {

    on<SearchData>((event, emit) async {
      
      emit(SearchLoading());

      final response = await _useCases.searchNews( event.query );

      emit(SearchDataLoaded( response ));

    });

  }
}
