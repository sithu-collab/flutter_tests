part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchCityDataEvent extends SearchEvent {
  final String cityName;
  FetchCityDataEvent({@required this.cityName}) : assert(cityName != null);

  @override
  // TODO: implement props
  List<Object> get props => [cityName];
}