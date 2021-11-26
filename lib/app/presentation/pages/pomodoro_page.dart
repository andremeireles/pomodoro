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
    final fabAction = context.watch<FloatDialog>();
    final workController =
        TextEditingController(text: store.workTime.toString());
    final restController =
        TextEditingController(text: store.restTime.toString());

    return Observer(
      builder: (_) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            onPressed: () {
              fabAction.changeLocales(context);
            },
            hoverElevation: 0,
            backgroundColor: store.isWorking() ? Colors.red : Colors.green,
            child: Icon(Icons.settings),
            tooltip: AppLocalizations.of(context).tooltip,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                StopWatcherWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InputTimeWidget(
                      title: AppLocalizations.of(context).work,
                      controller: workController,
                      readOnly: store.workReadOnly(),
                      // WARNING: fixar recebimento de 0, nulo ou maior que o tempo maximo
                      onSubmitted: store.started
                          ? (text) {
                              store.workTime = int.parse(workController.text);
                            }
                          : (text) {
                              store.workTime = int.parse(workController.text);
                              if (store.isWorking()) {
                                store.minutes = int.parse(workController.text);
                                store.restart();
                              }
                            },
                      inc: store.started && store.isWorking()
                          ? null
                          : () {
                              store.incrementWorkTime();
                              workController.text = store.workTime.toString();
                            },
                      dec: store.started && store.isWorking()
                          ? null
                          : () {
                              store.decrementWorkTime();
                              workController.text = store.workTime.toString();
                            },
                    ),
                    InputTimeWidget(
                      title: AppLocalizations.of(context).rest,
                      controller: restController,
                      readOnly: store.restReadOnly(),
                      onSubmitted: store.started
                          ? (text) {
                              store.restTime = int.parse(restController.text);
                            }
                          : (text) {
                              store.restTime = int.parse(restController.text);
                              if (store.isResting()) {
                                store.minutes = int.parse(restController.text);
                                store.restart();
                              }
                            },
                      inc: store.started && store.isResting()
                          ? null
                          : () {
                              store.incrementRestTime();
                              restController.text = store.restTime.toString();
                            },
                      dec: store.started && store.isResting()
                          ? null
                          : () {
                              store.decrementRestTime();
                              restController.text = store.restTime.toString();
                            },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
