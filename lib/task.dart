// import 'dart:developer';

class Task{
  int? id;
  String title;
  bool status;

  Task({
    this.id,
    required this.title,
    required this.status
  });

  // map --> task
  factory Task.fromMap(Map<String, dynamic> map){
    // log(map['title']);
    // log(map['status']);
    return Task(
      id: map['id'] as int,
      title: map['title'] as String,
      status: map['status'] as bool
    );
  }



  // task --> map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'status': status
    };
  }



}
