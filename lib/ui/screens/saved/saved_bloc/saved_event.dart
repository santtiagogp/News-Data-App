part of 'saved_bloc.dart';

abstract class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object> get props => [];
}

class SaveNewsEvent extends SavedEvent{
  final News news;

  const SaveNewsEvent( this.news );
}

class LoadSavedNewsEvent extends SavedEvent {}


