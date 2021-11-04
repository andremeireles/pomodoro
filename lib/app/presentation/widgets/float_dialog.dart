import 'package:flutter/material.dart';
import 'package:pomodoro/intl/generated/l10n.dart';

class FloatDialog extends ChangeNotifier {
  Future<void> changeLocales(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(AppLocalizations.of(context).dialogTitle),
          children: [
            CustomSimpleDialogOption(
              text: 'pt_BR',
              country: 'Português Brasileiro',
              callback: notifyListeners,
              image: 'assets/images/brazilian-flag.png',
            ),
            CustomSimpleDialogOption(
              text: 'en',
              country: 'English',
              callback: notifyListeners,
              image: 'assets/images/american-flag.png',
            ),
            CustomSimpleDialogOption(
              text: 'de',
              country: 'Deutsch',
              callback: notifyListeners,
              image: 'assets/images/german-flag.png',
            ),
          ],
          elevation: 10,
        );
      },
    );
  }
}

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
