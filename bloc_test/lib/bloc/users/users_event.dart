part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AppStartedEvent extends UsersEvent {}

class FetchDataEvent extends UsersEvent {}
//
//class RefreshUsersEvent extends UsersEvent {}
//
//class LoadMoreUsersEvent extends UsersEvent {
//
//  final List<TaskModel> users;
//
//  LoadMoreUsersEvent({@required this.users}) : assert(users != null);
//
//  @override
//  String toString() => 'LoadMoreUsersEvent{ users: $users}';
//
//}