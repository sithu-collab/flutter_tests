import 'package:bloc_recap/bloc/page/page_bloc.dart';
import 'package:bloc_recap/ui/navigation_expression.dart';
import 'package:bloc_recap/ui/pages/page_one.dart';
import 'package:bloc_recap/ui/pages/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final PageBloc pageBloc = BlocProvider.of<PageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  child: Text('Page One', style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    pageBloc.add(PageOneEvent());
                  },
                  color: Colors.green,
                ),
                FlatButton(
                  child: Text('Page Two', style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    pageBloc.add(PageTwoEvent());
                  },
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocListener<PageBloc, PageState> (
              listener: (context, state) {
                if(state is PageOneState) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PageOne()
                  ));
                }
                if(state is PageTwoState) {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PageTwo()
                  ));
                }
              },
              child: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.arrow_forward, color: Colors.white,),
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => NavigationExpression()
                    ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
