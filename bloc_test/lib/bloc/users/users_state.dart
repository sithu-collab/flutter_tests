part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class FetchDataState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<TaskModel> usersList;

  UsersLoadedState({@required this.usersList}) : assert(usersList != null);
}

class ErrorState extends UsersState {
  final String error;

  ErrorState(this.error);
}
