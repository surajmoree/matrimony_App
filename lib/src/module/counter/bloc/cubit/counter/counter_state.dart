part of 'counter_cubit.dart';

class CounterState {
  final int counterValue;
  final bool? wasIncremented;

  const CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  CounterState copyWith({
    int? counterValue,
    bool? wasIncremented,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
      wasIncremented: wasIncremented ?? this.wasIncremented,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented:
          map['wasIncremented'] != null ? map['wasIncremented'] as bool : null,
    );
  }
   
  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}
