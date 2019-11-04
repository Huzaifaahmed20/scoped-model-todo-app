import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/TodoModel.dart';
import './CustomBottomModal.dart';

class CustomScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoRef = ScopedModel.of<TodoModel>(context, rebuildOnChange: true);
    final todos = todoRef.todos;
    return Scaffold(
        appBar: AppBar(
          title: Text('Scoped Model Todo'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Add Todo'),
          icon: Icon(Icons.add),
          onPressed: () => openCustomBottomModal(context),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final title = todos[index]['title'];
              final description = todos[index]['description'];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text('$title'),
                    subtitle: Text('$description'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.purple,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          onPressed: () => todoRef.deleteTodo(index),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
