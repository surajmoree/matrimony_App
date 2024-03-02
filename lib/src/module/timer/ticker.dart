class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) {
      print('X: $x');
      print('ticks $ticks');
      return ticks - x - 1;
    }).take(ticks);
  }
}
