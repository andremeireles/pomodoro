import 'package:flutter/material.dart';
import 'change_time_button_widget.dart';

class InputTimeWidget extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? inc;
  final void Function()? dec;

  const InputTimeWidget({
    Key? key,
    required this.title,
    required this.value,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        title,
        style: TextStyle(fontSize: 25),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChangeTimeButtonWidget(
            icon: Icons.arrow_downward,
            color: Colors.white,
            onPressed: dec,
          ),
          Text(
            '$value min',
            style: TextStyle(fontSize: 18),
          ),
          ChangeTimeButtonWidget(
            icon: Icons.arrow_upward,
            color: Colors.white,
            onPressed: inc,
          ),
        ],
      ),
    ]);
  }
}
