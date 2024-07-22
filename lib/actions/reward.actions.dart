import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/core/models/user.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/user.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/state/reward_state.dart';

class RewardActions extends ValueNotifier<RewardState> {
  final _userRepository = getIt.get<UserRepository>();

  RewardActions() : super(RewardState.init());


load(){
  final localUser = _userRepository.findAll();
  if(localUser.isNotEmpty){
    final defaultUser = UserModel.fromJson(localUser.first);
    value = RewardState(userModel: defaultUser);
  } else {
    _userRepository.save(value.userModel.toJson());
  }
}

  save() {
    final coins = value.userModel.coins;
    final index = value.userModel.lifes.indexWhere((item) => item == false);
    if (index != -1) {
      value.userModel.lifes[index] = true;
    }
    final userEdit = value.userModel
        .copyWith(coins: coins - 5, lifes: value.userModel.lifes);
      _userRepository.update(userEdit.toJson());
      value = RewardState(userModel: userEdit);
  }

  addCoin() {
     final userEdit = value.userModel
        .copyWith(coins: value.userModel.coins + 5, lifes: value.userModel.lifes);
    _userRepository.update(userEdit.toJson());
    value = RewardState(userModel: userEdit);
  }
}
