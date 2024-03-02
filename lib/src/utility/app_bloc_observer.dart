import 'package:strava_clone/src/boot.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('$bloc has been changed $change');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    print('$bloc closed');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    print('$bloc Created');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Error $error raised from $bloc');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('$bloc from onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('$bloc from onTransition $transition');
    super.onTransition(bloc, transition);
  }
}
