import 'package:flutter/material.dart';
import 'package:moor_test/data/moor_database.dart';
import 'package:provider/provider.dart';

class NewTaskInput extends StatefulWidget {
  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  DateTime newTaskDate;
  TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[_buildTextField(context), _buildDateButton(context)],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Task Name'),
        onTap: () {
          final database = Provider.of<AppDatabase>(context);
          final task = Task(
            name: controller.text,
            dueDate: newTaskDate,
          );
          database.insertNewTask(task);
          resetValueAfterSubmit();
        },
      ),
    );
  }

  IconButton _buildDateButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () async {
        newTaskDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2005),
            lastDate: DateTime(2050));
      },
    );
  }

  void resetValueAfterSubmit() {
    setState(() {
      newTaskDate = null;
      controller.clear();
    });
  }
}
