part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppStatus status;
  final User user;
  final LoggedInUser? loggedInUser;

  const AppState._(
      {required this.status,
      this.user = User.empty,
      this.loggedInUser = LoggedInUser.empty});

  const AppState.authenticated(User user, [LoggedInUser? loggedInUser])
      : this._(
          status: AppStatus.authenticated,
          user: user,
          loggedInUser: loggedInUser == LoggedInUser.empty
              ? LoggedInUser.empty
              : loggedInUser,
        );

  const AppState.unauthenticated()
      : this._(
          status: AppStatus.unauthenticated,
          user: User.empty,
          loggedInUser: LoggedInUser.empty,
        );

  @override
  List<Object> get props => [status, user, loggedInUser!];
}
