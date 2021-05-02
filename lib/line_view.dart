import 'package:flutter/material.dart';

class LineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100].withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        width: 30,
        height: 5,
      ),
    );
  }
}
