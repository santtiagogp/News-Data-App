part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchData extends SearchEvent {

  final String query;

  const SearchData( this.query );

}
