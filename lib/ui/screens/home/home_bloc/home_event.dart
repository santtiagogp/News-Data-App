part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends HomeEvent {}

class DivideCardsData extends HomeEvent {}
