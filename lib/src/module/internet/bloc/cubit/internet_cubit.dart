import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../config/constants/enums.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required Connectivity connectivity})
      : super(InternetLoading()) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void monitorInternetConnection() {}

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
