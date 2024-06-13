import 'package:flutter/material.dart';

class CustomFooterComponent extends StatelessWidget {
  const CustomFooterComponent({super.key});

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
        );
    }
}