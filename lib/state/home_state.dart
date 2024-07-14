import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/core/models/task.model.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/main-content.component.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/register-content.component.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/reward-content.dart';
enum NavPage{ Home, Register, Reward}

class HomeState  {
  final _pages = [MainContentComponent(),
                  RegisterContentComponent(),
                  RewardContentComponent()];
  final int index;
  final TaskModel taskModel;
  final List<TaskModel> taskModelList;

  HomeState({ required this.index, required this.taskModel, required this.taskModelList });

  Widget selectPage(int index){
    return _pages[index];
  }


HomeState copyWith({
    int? index,
    TaskModel? taskModel,
    List<TaskModel>? taskModelList
}){
  return HomeState(
    index: index ?? this.index, 
    taskModel: taskModel ?? this.taskModel,
    taskModelList: taskModelList ?? this.taskModelList);
}
}
