import 'package:flutter/material.dart';

class StopwatcherButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? click;

  const StopwatcherButtonWidget({
    Key? key,
    required this.text,
    required this.icon,
    this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ElevatedButton(
        onPressed: click,
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          textStyle: TextStyle(fontSize: 25),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                size: 35,
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
