import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';

class RegisterContentComponent extends StatefulWidget {
  RegisterContentComponent({super.key});

  @override
  State<RegisterContentComponent> createState() =>
      _RegisterContentComponentState();
}

class _RegisterContentComponentState extends State<RegisterContentComponent> {
  final _state = getIt.get<HomeActions>();
  final registerFormKey = GlobalKey();
  final textTitleController = TextEditingController( text: '');
    final textDescriptionController = TextEditingController( text: '');

@override
  void initState() {
    textTitleController.text = _state.value.taskModel.title;
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: textTitleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple, width: 1.0),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple, width: 1.0),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date',
                border: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purple, width: 1.0),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _state.saveTask(_state.value.taskModel);
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
