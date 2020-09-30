import 'package:flutter/material.dart';
import 'package:moor_test/data/moor_database.dart';
import 'package:moor_test/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: MaterialApp(
        home: HomePage(),
        title: 'Moor Test',
      ),
    );
  }
}
