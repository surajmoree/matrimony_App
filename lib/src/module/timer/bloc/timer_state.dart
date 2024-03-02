part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial {duration: $duration}';
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress {duration: $duration}';
}

class TimerRunPaused extends TimerState {
  const TimerRunPaused(super.duration);

  @override
  String toString() => 'TimerRunPaused {duration: $duration}';
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete(super.duration);

  @override
  String toString() => 'TimeRunComplete {duration: $duration}';
}
