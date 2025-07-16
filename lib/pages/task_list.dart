import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskstorm/crud_services.dart';
import 'package:taskstorm/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  dynamic data;
  int dataCount = 0;

  @override
  void initState() {
    //dataCount = await tasksDatabase.getCount();
    super.initState();
    anAsyncFunc().then((boo) {
    setState(() {
      _loading = false;
    });});
  }

  anAsyncFunc() async{
    data = await tasksDatabase.readTask();
    log(dataCount.toString());
    log(data.toString());
  }

  final tasksDatabase = CrudServices();

  //controllers
  final _title = TextEditingController();

  //user wants to add new notes
  void addTask() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Create new task'),
            content: TextField(controller: _title),
            actions: [
              //cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _title.clear();
                },
                child: const Text('Clear'),
              ),

              //Save button
              TextButton(
                onPressed: () {
                  final newTask = Task(title: _title.text, status: 'false');
                  tasksDatabase.createTask(newTask);

                  //clearing the dialog
                  Navigator.pop(context);
                  _title.clear();
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  //user wants to update note
  //user wants to delete note

  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    if (_loading) {return CircularProgressIndicator();}
    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: ListView.builder(
        //TODO: try data.length if it works or not
        itemCount: data.length,
        itemBuilder: (context, index) {
          List task = data.map((noteMap) => Task.fromMap(noteMap)).toList();
          log(task.toString());
          return ListTile(title: Text(data[index].toString()),);
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Text('+'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
