import 'dart:async';

import 'package:mobx/mobx.dart';
import '../core/enum/pomodoro_store_enum.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = PomodoroStoreBase with _$PomodoroStore;

abstract class PomodoroStoreBase with Store {
  @observable
  bool started = false;

  @observable
  int minutes = 2;

  @observable
  int seconds = 0;

  @observable
  int workTime = 2;

  @observable
  int restTime = 1;

  @observable
  IntervalTypeEnum intervalType = IntervalTypeEnum.work;

  Timer? timer;

  /// Starts the stopwatch if not already running.
  @action
  void start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds--;
      }
    });
  }

  /// Stops the stopwatch if already running.
  @action
  void stop() {
    started = false;
    timer?.cancel();
  }

  /// Similar to stop but restarts the minutes.
  @action
  void restart() {
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }

  @action
  void incrementWorkTime() {
    workTime++;
    if (isWorking()) {
      restart();
    }
  }

  @action
  void decrementWorkTime() {
    if (workTime > 1) {
      workTime--;
      if (isWorking()) {
        restart();
      }
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
    if (isResting()) {
      restart();
    }
  }

  @action
  void decrementRestTime() {
    if (restTime > 1) {
      restTime--;
      if (isResting()) {
        restart();
      }
    }
  }

  bool isWorking() {
    return intervalType == IntervalTypeEnum.work;
  }

  bool isResting() {
    return intervalType == IntervalTypeEnum.rest;
  }

  void _changeIntervalType() {
    if (isWorking()) {
      intervalType = IntervalTypeEnum.rest;
      minutes = restTime;
    } else {
      intervalType = IntervalTypeEnum.work;
      minutes = workTime;
    }
    seconds = 0;
  }
}
