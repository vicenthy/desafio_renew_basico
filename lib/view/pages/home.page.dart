import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/app_bar.componet.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/footer.component.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final _state = getIt.get<HomeActions>();


@override
  void initState() {
    _state.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          toolbarHeight: 130,
          flexibleSpace: const CustomAppBarComponent(),
        ),
        body: ValueListenableBuilder(
            valueListenable: _state, 
            builder: (BuildContext context, value, _){
              return value.selectPage(value.index);
              
            }),
        bottomNavigationBar: CustomFooterComponent(),
      ),
    );
  }
}
