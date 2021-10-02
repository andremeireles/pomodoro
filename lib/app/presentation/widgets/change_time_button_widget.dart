import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/pomodoro_store.dart';

class ChangeTimeButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function()? onPressed;

  const ChangeTimeButtonWidget({
    Key? key,
    required this.icon,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(15),
        primary: store.isWorking() ? Colors.red : Colors.green,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }
}
