import 'package:ryc_desafio_do_modulo_basico/core/models/base.model.dart';

class UserModel extends BaseModel {
  final String name;
  final String? imageUrl;
  final List<bool> lifes;
  final int coins;

  UserModel(
      {super.id,
      required this.name,
      this.imageUrl,
      required this.lifes,
      required this.coins});


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'lifes': lifes,
      'coins': coins,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      lifes: List<bool>.from(json['lifes']),
      coins: json['coins'],
    );
  }


  UserModel copyWith(
      {String? id,
      String? name,
      String? imageUrl,
      List<bool>? lifes,
      int? coins}) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        lifes: lifes ?? this.lifes,
        coins: coins ?? this.coins);
  }
}
