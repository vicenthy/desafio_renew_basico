import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/main-content.component.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/register-content.component.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/reward-content.dart';
enum NavPage{ Home, Register, Reward}

class HomeState  {
  final _pages = [MainContentComponent(),RegisterContentComponent(),RewardContentComponent()];
  final int index;
  final String title;

  HomeState({required this.index, required this.title});

  Widget selectPage(int index){
    return _pages[index];
  }

}
