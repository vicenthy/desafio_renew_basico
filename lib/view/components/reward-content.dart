import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/reward.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/user.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';

class RewardContentComponent extends StatefulWidget {
  RewardContentComponent({super.key});

  @override
  State<RewardContentComponent> createState() => _RewardContentComponentState();
}

class _RewardContentComponentState extends State<RewardContentComponent> {
  final _state = getIt.get<RewardActions>();
  final _userRepository = getIt.get<UserRepository>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.pink,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 100,
                    child: ClipPolygon(
                        sides: 6,
                        borderRadius: 5.0, // Default 0.0 degrees
                        rotate: 90.0, // Default 0.0 degrees
                        child: Image.asset('assets/images/elixir.jpeg')),
                  ),

                  //
                  const Text(
                    "Elixir",
                    style: TextStyle(fontSize: 25),
                  ),
                  IconButton(
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alertDialog(context);
                        },
                      );
                      if (result) {
                        final coins = _state.value.userModel.coins;
                        final userEdit =
                            _state.value.userModel.copyWith(coins: coins - 5);
                        _userRepository.save(userEdit.toJson());
                        print(userEdit.toJson());
                      }
                    },
                    icon: Icon(Icons.shopping_cart),
                    iconSize: 50,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Restore one life point',
                      style: TextStyle(fontSize: 25)),
                  Text(
                    '5 Coins',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  alertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(context, false);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );
    // set up the AlertDialog
    return AlertDialog(
      title: const Text("Confirm"),
      content: Text("Would you like to continue?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
