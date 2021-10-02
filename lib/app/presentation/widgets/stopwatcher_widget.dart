import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
          child: Container(
            color: store.isWorking() ? Colors.red : Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  store.isWorking() ? 'Work Time' : 'Rest Time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 120,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!store.started)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: StopwatcherButtonWidget(
                          icon: Icons.play_arrow,
                          text: 'Start',
                          click: store.start,
                        ),
                      ),
                    if (store.started)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: StopwatcherButtonWidget(
                          icon: Icons.stop,
                          text: 'Stop',
                          click: store.stop,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: StopwatcherButtonWidget(
                        icon: Icons.refresh,
                        text: 'Restart',
                        click: store.restart,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
