import 'package:ryc_desafio_do_modulo_basico/core/models/base.model.dart';

class TaskModel extends BaseModel{
  final String title;
  final String description;
  final DateTime taskDate;
  final String status;

  TaskModel({id, required this.title, required this.description, required this.taskDate, required this.status});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'taskDate': taskDate.toIso8601String(),
      'status': status,
    };
  }


    factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      taskDate: DateTime.parse(json['taskDate']),
      status: json['status'],
    );
  }
}