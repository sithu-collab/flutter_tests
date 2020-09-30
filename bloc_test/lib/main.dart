import 'package:bloc_test/bloc/users/users_bloc.dart';
import 'package:bloc_test/network/api_service.dart';
import 'package:bloc_test/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "Bloc Test";
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ApiService.create(),
      child: Consumer<ApiService>(
        builder: (context, apiService, child) {
          return BlocProvider<UsersBloc>(
            create: (context) => UsersBloc(api: apiService),
            child: MaterialApp(
              title: _title,
              home: HomeScreen(),
              theme: ThemeData(
                  primaryColor: Colors.black,
                  accentColor: Colors.tealAccent
              ),
            ),
          );
        }
      ),
    );
  }
}
