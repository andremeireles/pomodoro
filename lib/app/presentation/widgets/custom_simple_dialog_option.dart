import 'package:flutter/material.dart';
import 'package:pomodoro/intl/generated/l10n.dart';

class CustomSimpleDialogOption extends StatelessWidget {
  final String text;
  final String image;
  final String country;
  final VoidCallback? callback;

  const CustomSimpleDialogOption({
    Key? key,
    required this.text,
    required this.country,
    required this.callback,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 10),
          child: Image.asset(
            image,
            height: 30,
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            AppLocalizations.load(Locale(text));
            Navigator.pop(context, true);
            callback!();
          },
          child: Text(country),
        ),
      ],
    );
  }
}
