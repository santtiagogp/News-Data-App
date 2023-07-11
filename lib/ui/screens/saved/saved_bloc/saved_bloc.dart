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

      _useCases.saveNews(event.news);

      event.news.saved = true;

    });

    

  }
}
