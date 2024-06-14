import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/state/home_state.dart';

class HomeActions extends ValueNotifier<HomeState>{
  HomeActions():super(HomeState(index: 0, title: ''));
 selectPage(int index){
  value = HomeState(index: index, title: '');
 }

 selectPageWithTitle(int index, String title){
  value = HomeState(index: index, title: title);
 } 
}