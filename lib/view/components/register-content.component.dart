import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/models/task.model.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/state/home_state.dart';

class RegisterContentComponent extends StatefulWidget {
  RegisterContentComponent({super.key});

  @override
  State<RegisterContentComponent> createState() =>
      _RegisterContentComponentState();
}

class _RegisterContentComponentState extends State<RegisterContentComponent> {
  final _state = getIt.get<HomeActions>();
  final registerFormKey = GlobalKey();
  final textTitleController = TextEditingController(text: '');
  final textDescriptionController = TextEditingController(text: '');
  final textDateController = TextEditingController(text: '');
  DateTime? selectDate;

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 15,
                controller: textTitleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 40,
                controller: textDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Short Description',
                  border: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textDateController,
                readOnly: true,
                onTap: () async {
                  final selectDate = await showDatePicker(
                    context: context, 
                    firstDate: DateTime.now(), 
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now());
                  this.selectDate = selectDate;
                  this.textDateController.text = DateFormat('dd/MM/yyyy').format(selectDate!);    
                },
                decoration: InputDecoration(
                  labelText: 'Due date',
                  border: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.purple, width: 1.0),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _state.value = _state.value.copyWith(
                    taskModel: TaskModel(
                  title: this.textTitleController.text,
                  description: this.textDescriptionController.text,
                  taskDate: selectDate ?? DateTime.now(),
                  status: 'PENDING',
                ));
                _state.saveTask(_state.value.taskModel);
                _state.selectPage(NavPage.Home.index);
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
