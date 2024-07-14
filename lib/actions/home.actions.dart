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
                taskDate: DateTime.now()),
                taskModelList: List.empty(growable: true)));

  selectPage(int index) {
    value = HomeState(
      index: index,
      taskModel: TaskModel(
          title: '', 
          description: '', 
          status: '', 
          taskDate: DateTime.now()),
          taskModelList: _taskRepository.findAll(),
    );
  }

  selectPageWithTitle(int index, String title) {
    value = HomeState(
      index: index,
      taskModel: TaskModel(
          title: title, 
          description: '', 
          status: '', 
          taskDate: DateTime.now()),
      taskModelList: _taskRepository.findAll(),
    );
  }

  saveTask(TaskModel taskModel) {
    _taskRepository.save(taskModel.toJson());
  }

  load() {
    value = value.copyWith(
        index: value.index,
        taskModel: value.taskModel,
        taskModelList: _taskRepository.findAll());
  }

  updateStatus(String id) {
    TaskModel foundTask =  TaskModel.fromJson(_taskRepository.findById(id));
    TaskModel editTask;
    if (foundTask.status == 'DONE') {
      editTask = foundTask.copyWith(status: 'PENDING');
    } else {
      editTask = foundTask.copyWith(status: 'DONE');
    }
    _taskRepository.update(editTask.toJson());
  }
}
