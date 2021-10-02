// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../domain/pomodoro_store.dart';
import '../widgets/stopwatcher_widget.dart';
import '../widgets/input_time_widget.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.settings),
      //   onPressed: () {},
      //   backgroundColor: Colors.red,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: StopWatcherWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InputTimeWidget(
                    title: 'Work',
                    value: store.workTime,
                    inc: store.started && store.isWorking()
                        ? null
                        : store.incrementWorkTime,
                    dec: store.started && store.isWorking()
                        ? null
                        : store.decrementWorkTime,
                  ),
                  InputTimeWidget(
                    title: 'Rest',
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
          ),
        ],
      ),
    );
  }
}
