import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/reward.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';

class CustomAppBarComponent extends StatefulWidget {
  const CustomAppBarComponent({
    super.key,
  });

  @override
  State<CustomAppBarComponent> createState() => _CustomAppBarComponentState();
}

class _CustomAppBarComponentState extends State<CustomAppBarComponent> {
final _state = getIt.get<RewardActions>();




  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: _state, builder: (context, value, _) {
      return Container(
      padding: const EdgeInsets.all(10),
      child:  Column(
        children:  [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 70,
                width: 70,
                child: const CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
              Row(
                children: value.userModel.lifes.map( (value){
                  return Icon(
                Icons.favorite,
                color: value ? Colors.red : Colors.grey,
              );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.fort),
              const SizedBox(width: 10,),
              Text(
                "${value.userModel.coins} coins",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )
            ],
          )
        ],
      ),
    );

    });
  }
}
