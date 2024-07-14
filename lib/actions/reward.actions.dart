import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/user.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/state/reward_state.dart';

class RewardActions extends ValueNotifier<RewardState> {
  final _userRepository = getIt.get<UserRepository>();
  RewardActions() : super(RewardState.init());

  save(){
    _userRepository.save(value.userModel.toJson());
  }
}
