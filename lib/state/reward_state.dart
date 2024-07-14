import 'package:ryc_desafio_do_modulo_basico/core/models/user.model.dart';

class RewardState {
  final UserModel userModel;

  RewardState({required this.userModel});

  factory RewardState.init() {
    return RewardState(
        userModel: UserModel(name: 'current', lifes: List.filled(5, true), coins: 10));
  }
}
