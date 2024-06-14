import 'package:flutter/material.dart';
import 'package:ryc_desafio_do_modulo_basico/actions/home.actions.dart';
import 'package:ryc_desafio_do_modulo_basico/core/service_locator.dart';
import 'package:ryc_desafio_do_modulo_basico/state/home_state.dart';

class CustomFooterComponent extends StatelessWidget {
  CustomFooterComponent({super.key});
  final _state = getIt.get<HomeActions>();


  @override
  Widget build(BuildContext context) {
    return 
    
    BottomNavigationBar(
          backgroundColor: Colors.purple,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
                label: "Information")
          ],
          onTap: (index){
            if(index == 0){
                _state.selectPage(NavPage.Home.index);
            }
          },
        );
    }
}