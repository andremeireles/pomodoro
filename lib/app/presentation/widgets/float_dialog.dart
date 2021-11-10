import 'package:flutter/material.dart';
import 'package:pomodoro/intl/generated/l10n.dart';

import 'custom_simple_dialog_option.dart';

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
