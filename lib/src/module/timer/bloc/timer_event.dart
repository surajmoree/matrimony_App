part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class TimerTicked extends TimerEvent {
  const TimerTicked({required this.duration});
  final int duration;
}

class TimerResumed extends TimerEvent {
  const TimerResumed({required this.duration});
  final int duration;
}

class TimerRunPause extends TimerEvent {
  const TimerRunPause();
}
