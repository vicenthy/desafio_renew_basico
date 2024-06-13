import 'package:ryc_desafio_do_modulo_basico/core/models/base.model.dart';

class UserModel extends BaseModel{
  final String name;
  final String imageUrl;
  final List<int> coins;

  UserModel({required this.name, required this.imageUrl, required this.coins});


}