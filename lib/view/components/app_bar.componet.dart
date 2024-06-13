import 'package:flutter/material.dart';

class CustomAppBarComponent extends StatelessWidget {
  const CustomAppBarComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CircleAvatar(
                  child: Icon(
                    Icons.person,
                  ),
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Icon(
                Icons.favorite,
              ),
              Icon(
                Icons.favorite,
              ),
              Icon(
                Icons.favorite,
              ),
              Icon(
                Icons.favorite,
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.fort),
              Text(
                "10 coins",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              )
            ],
          )
        ],
      ),
    );
  }
}
