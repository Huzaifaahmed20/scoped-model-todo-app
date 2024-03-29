import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './models/TodoModel.dart';
import './widgets/CustomScaffold.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<TodoModel>(
      model: TodoModel(),
      child: CustomScaffold(),
    );
  }
}
