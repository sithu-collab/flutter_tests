import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String _title = 'Page Two';
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: Container(
        child: Center(
          child: Text('Page Two', style: TextStyle(fontSize: 22.0),),
        ),
      ),
    );
  }
}
