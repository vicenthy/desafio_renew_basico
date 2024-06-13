import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/app_bar.componet.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/footer.component.dart';
import 'package:ryc_desafio_do_modulo_basico/view/components/main-content.content.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          toolbarHeight: 130,
          flexibleSpace: CustomAppBarComponent(),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: MainContentComponent(),
        ),
        bottomNavigationBar: CustomFooterComponent(),
      ),
    );
  }
}
