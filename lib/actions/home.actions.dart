import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/core/models/task.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/task.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/state/home_state.dart';

class HomeActions extends ValueNotifier<HomeState> {
  final _taskRepository = getIt.get<TaskRepository>();

  HomeActions()
      : super(HomeState(
            index: 0,
            taskModel: TaskModel(
                title: '',
                description: '',
                status: '',
                taskDate: DateTime.now())));

  selectPage(int index) {
    value = HomeState(
        index: index,
        taskModel: TaskModel(
            title: '', description: '', status: '', taskDate: DateTime.now()));
  }

  selectPageWithTitle(int index, String title) {
    value = HomeState(
        index: index,
        taskModel: TaskModel(
            title: title,
            description: '',
            status: '',
            taskDate: DateTime.now()));
  }

  saveTask(TaskModel taskModel) {
    _taskRepository.save(taskModel.toJson());
  }
}
