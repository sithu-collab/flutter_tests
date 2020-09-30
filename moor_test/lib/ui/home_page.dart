import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:moor_test/data/moor_database.dart';
import 'package:moor_test/ui/widget/new_task_input_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moor Test'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildListTask(context),
          ),
          NewTaskInput(),
        ],
      ),
    );
  }

  StreamBuilder<List<Task>> _buildListTask(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllTasks(),
      builder: (_, AsyncSnapshot<List<Task>> snapshot) {
        final tasks = snapshot.data ?? List();
        return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, int index) {
              final itemTask = tasks[index];
              return _buildListItem(itemTask, database);
            });
      },
    );
  }

  Widget _buildListItem(Task itemTask, AppDatabase database) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          color: Colors.red,
          caption: 'Delete',
          icon: Icons.delete,
          onTap: () => database.deleteTask(itemTask),
        ),
      ],
      child: CheckboxListTile(
        title: Text(itemTask.name),
        subtitle: Text(itemTask.dueDate ?.toString() ?? 'No Date'),
          value: itemTask.completed,
          onChanged: (newValue) {
            database.updateTask(itemTask.copyWith(completed: newValue));
          }),
    );
  }
}
