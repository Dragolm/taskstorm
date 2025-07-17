// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskstorm/crud_services.dart';
import 'package:taskstorm/pages/sign_in.dart';
import 'package:taskstorm/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  void initState() {
    //dataCount = await tasksDatabase.getCount();
    super.initState();
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
                  final newTask = Task(title: _title.text, status: false);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: StreamBuilder(
        stream: tasksDatabase.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // log(snapshot.error.toString());
            return AlertDialog(title: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    SizedBox(
                      width: deviceWidth*7/10,
                      child: CheckboxListTile(
                        title: Text(tasks[index].title),
                        value: tasks[index].status,
                        onChanged: (newVal) {
                          //TODO: change a local variable and then update the database slowly to reduce the latency
                          if(tasks[index].status) {
                            tasksDatabase.changeStatus(tasks[index], false);
                          }else{
                            tasksDatabase.changeStatus(tasks[index], true);
                          }
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    IconButton(onPressed: () {
                      log('message');
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () {
                      log('message2');
                    }, icon: Icon(Icons.delete))
                  ],
                );
                // return ListTile(title: Text(tasks[index].title), leading: Icon(Icons.check_box),);
              },
            );
          } else {
            return Text('NoData ig');
          }
        },
      ),
      // body: FutureBuilder<List<Map<String, dynamic>>>(
      //   future: _future,
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     final countries = snapshot.data!;
      //     return ListView.builder(
      //       itemCount: countries.length,
      //       itemBuilder: ((context, index) {
      //         final country = countries[index];
      //         return ListTile(
      //           title: Text(country['name']),
      //         );
      //       }),
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Text('+'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}



// ListView.builder(
//         //TODO: try data.length if it works or not
//         itemCount: data.length,
//         itemBuilder: (context, index) {
//           List task = data.map((noteMap) => Task.fromMap(noteMap)).toList();
//           log(task.toString());
//           return ListTile(title: Text(data[index].toString()),);
//         }),