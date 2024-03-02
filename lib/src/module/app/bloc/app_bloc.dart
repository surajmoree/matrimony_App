import 'dart:async';
import 'package:strava_clone/src/network/models/logged_user.dart';
import 'package:equatable/equatable.dart';

import 'package:strava_clone/src/network/repositories/authentication_repo.dart';
import 'package:strava_clone/src/network/models/user_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  static int callCount = 0;

  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          (_getCurrentFirebaseUser.isNotEmpty)
              ? AppState.authenticated(
                  _getCurrentFirebaseUser,
                  _getLoggedInUser,
                )
              : const AppState.unauthenticated(),
        ) {
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_AppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) async {
    if (event.user.isNotEmpty) {
      LoggedInUser loggedInUser = _getLoggedInUser;
      if (loggedInUser == LoggedInUser.empty) {
        final getUserData = await _authenticationRepository
            .validateServerLogin(event.user.email!);
        loggedInUser = LoggedInUser(
          uuId: event.user.id,
          userId: "${getUserData["userData"]["id"]}",
          name: getUserData["userData"]["userName"],
          email: getUserData["userData"]["email"],
          photo: getUserData["userData"]["userimagePath"],
          roleTypeId: "${getUserData["userData"]["roleTypeId"]}",
          roleName: getUserData["userData"]["roleName"],
          token: getUserData["token"],
        );
      }
      emit(AppState.authenticated(event.user, loggedInUser));
    } else {
      emit(const AppState.unauthenticated());
    }
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    HydratedBloc.storage.clear();
    unawaited(_authenticationRepository.logOut());
  }

  static User get _getCurrentFirebaseUser {
    return User.fromJson(HydratedBloc.storage.read('AppBloc')["user"]);
  }

  static LoggedInUser get _getLoggedInUser {
    return LoggedInUser.fromJson(
        HydratedBloc.storage.read('AppBloc')["loggedInUser"]);
  }

  @override
  AppState fromJson(Map<String, dynamic> json) {
    print('the call fromJson is ${callCount++} - $json');
    try {
      Map<String, dynamic> userJson = json["user"];
      Map<String, dynamic> loggedInUserJson = json["loggedInUser"];
      User user = User(
          id: userJson["id"],
          email: userJson["email"],
          photo: userJson["photo"],
          name: userJson["name"]);

      LoggedInUser loggedInUser = LoggedInUser(
        userId: loggedInUserJson["userId"],
        uuId: loggedInUserJson["uuId"],
        name: loggedInUserJson["name"],
        email: loggedInUserJson["email"],
        photo: loggedInUserJson["photo"],
        roleTypeId: loggedInUserJson["roleTypeId"],
        roleName: loggedInUserJson["roleName"],
        token: loggedInUserJson["token"],
      );
      return AppState.authenticated(
        user,
        loggedInUser,
      );
    } catch (e) {
      print('problem in assing the values $e');
      return const AppState.unauthenticated();
    }
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    AppState appState = state;
    return {
      'status': appState.status.toString(),
      'user': {
        'id': appState.user.id,
        'email': appState.user.email,
        'name': appState.user.name,
        'photo': appState.user.photo
      },
      'loggedInUser': {
        'userId': appState.loggedInUser!.userId,
        'uuId': appState.loggedInUser!.uuId,
        'name': appState.loggedInUser!.name,
        'email': appState.loggedInUser!.email,
        'photo': appState.loggedInUser!.photo,
        'roleTypeId': appState.loggedInUser!.roleTypeId,
        'roleName': appState.loggedInUser!.roleName,
        'token': appState.loggedInUser!.token,
      },
    };
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
