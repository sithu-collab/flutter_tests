import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/network/api_service.dart';
import 'package:bloc_test/network/model/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final ApiService api;

  UsersBloc({@required this.api})
      : assert(api != null),
        super(UsersInitial());

  @override
  Stream<UsersState> mapEventToState(UsersEvent event,) async* {
//    if(event is AppStartedEvent) {
//      yield* _mapAppStartedToState();
//    }else if(event is RefreshUsersEvent){
//      yield* _getUsers(users: []);
//    }
//    else if(event is LoadMoreUsersEvent){
//      yield* _mapLoadMoreUsersState(event);
//    }else if(event is FetchDataEvent) {
//      yield FetchDataState();
//    }

    if (event is FetchDataEvent) {
      try {
        yield UsersLoadingState();
        final response = await api.getTasks();
        yield UsersLoadedState(usersList: response);
      } on SocketException catch (e) {
        yield ErrorState(e.toString());
      } on Exception catch (e) {
        yield ErrorState(e.toString());
      }
    }
  }
}
//  Stream<UsersState> _getUsers({List<TaskModel> users, int page = 0}) async*{
//    try{
//      List<TaskModel> usersList = users + await api.getTasks();
//      yield UsersLoadedState(usersList: usersList);
//    }catch(err){
//      yield ErrorState(err.toString());
//      throw err;
//    }
//  }
//
//  Stream<UsersState> _mapAppStartedToState() async*{
//    yield UsersLoadingState();
//    yield* _getUsers(users: []);
//  }
//
//  Stream<UsersState> _mapLoadMoreUsersState(LoadMoreUsersEvent event) async* {
//    final int nextPage = event.users.length ~/ ApiService.perPage;
//    yield* _getUsers(users: event.users, page: nextPage);
//  }
//}
