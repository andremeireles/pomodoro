// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/app/presentation/widgets/float_dialog.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro/intl/generated/l10n.dart';

import '../../domain/pomodoro_store.dart';
import '../widgets/stopwatcher_widget.dart';
import '../widgets/input_time_widget.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    final controller = context.watch<FloatDialog>();

    return Observer(
      builder: (_) => Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            controller.changeLocales(context);
          },
          hoverElevation: 0,
          backgroundColor: store.isWorking() ? Colors.red : Colors.green,
          child: Icon(Icons.settings),
          tooltip: AppLocalizations.of(context).tooltip,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: StopWatcherWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTimeWidget(
                    title: AppLocalizations.of(context).work,
                    value: store.workTime,
                    inc: store.started && store.isWorking()
                        ? null
                        : store.incrementWorkTime,
                    dec: store.started && store.isWorking()
                        ? null
                        : store.decrementWorkTime,
                  ),
                  InputTimeWidget(
                    title: AppLocalizations.of(context).rest,
                    value: store.restTime,
                    inc: store.started && store.isResting()
                        ? null
                        : store.incrementRestTime,
                    dec: store.started && store.isResting()
                        ? null
                        : store.decrementRestTime,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
