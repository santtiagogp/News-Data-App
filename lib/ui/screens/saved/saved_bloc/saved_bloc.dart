import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/news_model.dart';
import '../../../../domain/use_cases/news_use_cases.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {

  final NewsUseCases _useCases;

  SavedBloc(this._useCases) : super(SavedInitial()) {

    on<SaveNewsEvent>((event, emit) {

      event.news.saved ? false : true;

      if( event.news.saved ) {
        return;
      } else {
        _useCases.saveNews(event.news);
      }


    });

    on<LoadSavedNewsEvent>((event, emit) async {

      emit( LoadingNews() );

      final news = await _useCases.getSavedNews();

      news.isNotEmpty ? emit(SavedNews(news)) : emit(SavedInitial());

    });

    

  }
}
