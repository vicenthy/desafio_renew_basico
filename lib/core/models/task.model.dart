import 'package:ryc_desafio_do_modulo_basico/core/models/base.model.dart';

class TaskModel extends BaseModel {
  final String title;
  final String description;
  final DateTime taskDate;
  final String status;

  TaskModel(
      {super.id,
      required this.title,
      required this.description,
      required this.taskDate,
      required this.status});

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

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? taskDate,
    String? status,
  }) {
    return TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        taskDate: taskDate ?? this.taskDate,
        status: status ?? this.status);
  }


}
