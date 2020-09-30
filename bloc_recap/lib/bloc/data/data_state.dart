part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoadingState extends DataState {}

class GetDataState extends DataState {}

class ErrorState extends DataState {}