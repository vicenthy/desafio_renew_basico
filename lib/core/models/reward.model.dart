import 'package:ryc_desafio_do_modulo_basico/core/models/base.model.dart';

class RewardModel extends BaseModel{
  final String title;
  final String description;
  final String imageUrl;
  final List<int> coins;

  RewardModel({required this.title, required this.description, required this.imageUrl, required this.coins}); 

}