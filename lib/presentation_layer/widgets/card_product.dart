import 'package:flutter/material.dart';

Widget cardProduct() {
  return Card(
    elevation: 50,
    child: Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 0,
          top: -10,
          child: Row(
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.minimize_sharp),
                      ),
                    ),
                    Text('data'),
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.minimize_sharp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
