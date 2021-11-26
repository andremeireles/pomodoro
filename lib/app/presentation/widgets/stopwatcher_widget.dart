import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/intl/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../domain/pomodoro_store.dart';
import 'stopwatcher_button_widget.dart';

class StopWatcherWidget extends StatelessWidget {
  final String? title;
  const StopWatcherWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * (3 / 4)),
            child: Container(
              color: store.isWorking() ? Colors.red : Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    store.isWorking()
                        ? AppLocalizations.of(context).workTime
                        : AppLocalizations.of(context).restTime,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AutoSizeText(
                      '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                      maxLines: 1,
                      maxFontSize: 120,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (!store.started)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: StopwatcherButtonWidget(
                                icon: Icons.play_arrow,
                                text: AppLocalizations.of(context).start,
                                click: store.start,
                              ),
                            ),
                          if (store.started)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: StopwatcherButtonWidget(
                                icon: Icons.stop,
                                text: AppLocalizations.of(context).stop,
                                click: store.stop,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: StopwatcherButtonWidget(
                              icon: Icons.refresh,
                              text: AppLocalizations.of(context).restart,
                              click: store.restart,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
