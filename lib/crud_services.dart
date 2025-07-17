


import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskstorm/task.dart';

class CrudServices {
  final database = Supabase.instance.client;

  // Create
  Future createTask(Task task) async {
    await database.from('Quests').insert({'title': task.title, 'status': task.status});
  }

  // Update
  Future updateTask(Task task, String title) async {
    await database.from('Quests').update({'title': title, 'status': task.status}).eq('id', task.id!);
  }

  // Read
  // Future readTask() async {
  //   final data = await database.from('Quests').select();
  //   log(data.toString());
  //   return data;
  // }
  final stream = Supabase.instance.client.from('Quests').stream(primaryKey: ['id']).map((data) => data.map((taskMap) => Task.fromMap(taskMap)).toList());

  //get total task count
  Future getCount() async {
    final count = await database.from('Quests').count();
    return count;
  }

  // Delete
  Future deleteTask(Task task) async {
    await database.from('Quests').delete().eq('id', task.id!);
  }
}