import 'package:bloctwo/bloc/task_bloc.dart';
import 'package:bloctwo/network/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Test'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<TaskBloc, TaskState> (
              builder: (context, state) {
                if(state is TaskInitial) {
                  return Center(
                    child: Text('No Data Yet'),
                  );
                }
                if(state is LoadingTaskState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is LoadedTaskState) {
                  return _listTasks(context, state.taskModels);
                }
                if(state is FailedTaskState) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: FlatButton(
              child: Text('Get Data', style: TextStyle(color: Colors.white),),
              color: Colors.green,
              onPressed: () {
                BlocProvider.of<TaskBloc>(context)..add(GetTaskEvent());
              },
            ),
          )
        ],
      ),
    );
  }

  ListView _listTasks(BuildContext context, List<TaskModel> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
        itemBuilder: (BuildContext context,int index){
          return Card(
            child: Container(
              width: double.infinity,
              child: ListTile(
                leading: Image.network(tasks[index].url),
                title: Text(tasks[index].title),
              ),
            ),
          );
    });
  }
}
