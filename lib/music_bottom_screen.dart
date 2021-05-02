import 'package:flutter/material.dart';

class MusicBottomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 50,
                height: 20,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
