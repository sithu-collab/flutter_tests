import 'package:bloc_test/bloc/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _title = 'Bloc Test';
 // ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UsersBloc usersBloc = BlocProvider.of<UsersBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Theme
                    .of(context)
                    .accentColor),
              ),
            );
          }
          if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.usersList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Image.network('${state.usersList[index].url}'),
                        title: Text(
                          '${state.usersList[index].title}',
                        ),
//                        subtitle: Text(
//                          '${state.usersList[index].email}',
//                        ),
//                            trailing: Text(
//                              '${state.usersList[index].id}',
//                            ),
                      ),
                    ),
                  );
                });
          }
          if (state is ErrorState) {
            return Center(
                child: Text(state.error)
            );
          }
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme
                    .of(context)
                    .primaryColor,
                Colors.grey[900],
              ]
              ),
            ),
          );
        },
        // child: _listFutureTasks(context),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.terrain,),
        backgroundColor: Theme
            .of(context)
            .accentColor,
        onPressed: () {
          usersBloc..add(FetchDataEvent());
        },
      ),
    );
  }
}
//  bool _onScrollNotification(ScrollNotification notification, UsersLoadedState state) {
//    if(notification is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
//      BlocProvider.of<UsersBloc>(context)..add(LoadMoreUsersEvent(users: state.usersList));
//    }
//    return false;
//  }
//}
//
//  FutureBuilder _listFutureTasks(BuildContext context) {
//    return FutureBuilder<List<TaskModel>>(
//      future: Provider.of<ApiService>(context, listen: false).getTasks(),
//      builder: (context, AsyncSnapshot<List<TaskModel>> snapshot) {
//        if (!snapshot.hasData) {
//          return Center(
//            child: CircularProgressIndicator(
//              valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
//            ),
//          );
//        }
//        final users = snapshot.data;
//        return _listTasks(context, users);
//      },
//    );
//  }

