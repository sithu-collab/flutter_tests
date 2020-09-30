import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloctwo/network/model/api_service.dart';
import 'package:bloctwo/network/model/task_model.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final ApiService api;
  TaskBloc(this.api) : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if(event is GetTaskEvent) {
      yield LoadingTaskState();
      try{
        final response = await api.getTasks();
        yield LoadedTaskState(response);
      }on SocketException catch(e){
        yield FailedTaskState(e.toString());
      }on Exception catch(e) {
        yield FailedTaskState(e.toString());
      }
    }
  }
}
