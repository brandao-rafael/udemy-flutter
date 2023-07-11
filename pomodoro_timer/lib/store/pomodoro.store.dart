import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType { WORK, REST }

abstract class _PomodoroStore with Store {

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
  IntervalType intervalType = IntervalType.WORK;

  Timer? timer;

  @action
  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(minutes == 0 && seconds == 0) {
        _changeIntervalType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes--;
      } else {
        seconds --;
      }
    });
  }

  @action
  void stop() {
    started = false;
    timer?.cancel();
  }

  @action
  void restart() {
    stop();
    minutes = isWorking() ? workTime : restTime;
    seconds = 0;
  }
  
  @action
  void incrementWorkTime() {
    workTime++;
    if(isWorking()) {
      restart();
    }
  }

  @action
  void decreaseWorkTime() {
    if (workTime > 1) {
      workTime--;
      if(isWorking()) {
        restart();
      }
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
    if(isResting()) {
      restart();
    }
  }

  @action
  void decreaseRestTime() {
    if (restTime > 1) {
      restTime--;
      if(isResting()) {
        restart();
      }
    }
  }

  bool isWorking() {
    return intervalType == IntervalType.WORK;
  }

  bool isResting() {
    return intervalType == IntervalType.REST;
  }

  void _changeIntervalType() {
    if(isWorking()) {
      intervalType = IntervalType.REST;
      minutes = restTime;
    } else {
      intervalType = IntervalType.WORK;
      minutes = workTime;
    }
    seconds = 0;
  }
}