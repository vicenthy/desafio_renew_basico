import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/state/home_state.dart';

class MainContentComponent extends StatefulWidget {
  MainContentComponent({super.key});

  @override
  State<MainContentComponent> createState() => _MainContentComponentState();
}

class _MainContentComponentState extends State<MainContentComponent> {
final _state = getIt.get<HomeActions>();
final titleTextController = TextEditingController( text: "");



  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: titleTextController,
                          decoration: InputDecoration(
                            labelText: 'test',
                            border: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        _state.selectPageWithTitle(NavPage.Register.index, titleTextController.text);
                      },
                      icon: Icon(
                        Icons.add,
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.greenAccent),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                      side: BorderSide(color: Colors.greenAccent)),
                  leading: Text("Titulo Tarefa"),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Dias restantes"),
                      Text("20"),
                    ],
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          );
  }
}