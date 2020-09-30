import 'package:bloc_recap/bloc/data/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationExpression extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _title = 'Navigation Expression';
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: BlocListener<DataBloc, DataState> (
        listener: (context, state) {
          if(state is GetDataState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.deepOrange,
                content: Text('Success'),
              ),
            );
          }
        },
        child: BlocBuilder<DataBloc, DataState> (
          builder: (context, state) {
            if(state is DataInitial) {
              return Center(
                child: Text('Press the Button'),
              );
            }
            if(state is DataLoadingState) {
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is GetDataState) {
              return Center(child: Text('Success'),);
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: FloatingActionButton(
              child: IconButton(icon: Icon(Icons.terrain, color: Colors.white,), onPressed: () {
                BlocProvider.of<DataBloc>(context)..add(GetDataEvent());
              },),
            ),
          ),
        ],
      ),
    );
  }
}
