import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/news_model.dart';
import '../../../../domain/use_cases/news_use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final NewsUseCases _useCases;

  HomeBloc(this._useCases) : super(HomeInitial()) {

    on<LoadDataEvent>( (event, emit) async {

      emit( HomeLoading() );

      final response = await _useCases.getLatestNews();

      List<News> cardData = List.empty( growable: true );
      List<News> listData = List.empty( growable: true );

      for( int i = 0; i < 5; i++ ) {
        cardData.add( response.results[i] );
      }

      for( int i = 6; i < response.results.length; i++ ) {
        listData.add(response.results[i]);
      }

      emit( HomeLoaded(listData, cardData) );

    } );

  }
}
