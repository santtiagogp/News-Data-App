import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/latest_news_model.dart';
import 'package:news_app/domain/use_cases/news_use_cases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final NewsUseCases _useCases;

  HomeBloc(this._useCases) : super(HomeInitial()) {

    on<LoadDataEvent>( (event, emit) async {

      emit( HomeLoading() );

      final response = await _useCases.getLatestNews();

      emit( HomeLoaded(response) );

    } );

  }
}
