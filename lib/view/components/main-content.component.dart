import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/models/task.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/repository/task.repository.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/state/home_state.dart';

class MainContentComponent extends StatefulWidget {
  MainContentComponent({super.key});

  @override
  State<MainContentComponent> createState() => _MainContentComponentState();
}

class _MainContentComponentState extends State<MainContentComponent> {
  final _state = getIt.get<HomeActions>();
  final _taskRepository = getIt.get<TaskRepository>();
  final titleTextController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: titleTextController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  _state.selectPageWithTitle(
                      NavPage.Register.index, titleTextController.text);
                },
                icon: const Icon(
                  Icons.add,
                ),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.greenAccent),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ValueListenableBuilder(
                    valueListenable: _state,
                    builder: (BuildContext context, value, __) {
                      return ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: value.taskModelList.map((item) {
                          final isDone = item.status == 'DONE';
                          final daysDueDate = item.taskDate.difference(DateTime.now()).inDays;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    topLeft: Radius.circular(12),
                                  ),
                                  side: BorderSide(color: daysDueDate > 0 ? Colors.greenAccent : Colors.red )),
                              leading: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: isDone
                                            ? Colors.green
                                            : Colors.black,
                                        decoration: isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                  Text(
                                    item.description,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: isDone
                                            ? Colors.green
                                            : Colors.black,
                                        decoration: isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                ],
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Due Date",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                      "${item.taskDate.difference(DateTime.now()).inDays}",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  _state.updateStatus(item.id!);
                                  _state.load();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: item.status == 'DONE'
                                        ? Colors.greenAccent
                                        : daysDueDate > 0 ? Colors.grey : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    })),
          ),
        )
      ],
    );
  }
}
