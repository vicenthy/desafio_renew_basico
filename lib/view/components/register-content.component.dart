import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';

class RegisterContentComponent extends StatefulWidget {
  RegisterContentComponent({super.key});

  @override
  State<RegisterContentComponent> createState() => _RegisterContentComponentState();
}

class _RegisterContentComponentState extends State<RegisterContentComponent> {
final _state = getIt.get<HomeActions>();


  @override
  Widget build(BuildContext context) {
    return Text(_state.value.title);
  }
}