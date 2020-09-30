import 'package:bloctwo/bloc/task_bloc.dart';
import 'package:bloctwo/network/model/api_service.dart';
import 'package:bloctwo/ui/my_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setUpLogging();
  runApp(MyApp());
}

void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) => {
    print('${event.level.name} : ${event.error} : ${event.message}')
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService> (
      create: (context) => ApiService.create(),
      child: Consumer<ApiService> (
        builder: (context, apiService, child) {
          return BlocProvider<TaskBloc> (
            create: (context) => TaskBloc(apiService),
            child: MaterialApp(
              title: 'Bloc Test',
              home: MyHomePage(),
              theme: ThemeData(
                primaryColor: Colors.red
              ),
            ),
          );
        },
      ),
    );
  }
}
