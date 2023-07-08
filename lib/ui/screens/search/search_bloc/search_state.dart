part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchDataLoaded extends SearchState {

  final List<News> searchData;

  const SearchDataLoaded( this.searchData );

}
