part of 'saved_bloc.dart';

abstract class SavedState extends Equatable {
  const SavedState();
  
  @override
  List<Object> get props => [];
}

class SavedInitial extends SavedState {}

class SavedNews extends SavedState {
  final List<News> news;

  const SavedNews( this.news );
}

class LoadingNews extends SavedState {}