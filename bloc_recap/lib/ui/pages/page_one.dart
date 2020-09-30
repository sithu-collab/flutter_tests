import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _title = 'Page One';
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: Container(
        child: Center(
          child: Text('Page One', style: TextStyle(fontSize: 22.0),),
        ),
      ),
    );
  }
}
