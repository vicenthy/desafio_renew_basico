import 'package:ryc_desafio_do_modulo_basico/core/models/base.model.dart';

class TaskModel extends BaseModel{
  final String title;
  final String description;
  final DateTime taskDate;
  final String status;

  TaskModel({required this.title, required this.description, required this.taskDate, required this.status});


}