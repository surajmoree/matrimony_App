import 'package:equatable/equatable.dart';

class LoggedInUser extends Equatable {
  const LoggedInUser(
      {required this.userId,
      required this.uuId,
      this.name,
      this.email,
      this.photo,
      this.roleTypeId,
      this.roleName,
      this.token});

  final String userId, uuId;
  final String? name, email, photo, roleName, token, roleTypeId;

  static const empty = LoggedInUser(userId: '', uuId: '');

  factory LoggedInUser.fromJson(Map<dynamic, dynamic> loggedInUserJson) {
    try {
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

      return loggedInUser;
    } catch (e) {
      print('Error while creating user from json');
      return LoggedInUser.empty;
    }
  }

  Map<String, dynamic> objectToJson(LoggedInUser loggedInUser) {
    return {
      'userId': loggedInUser.userId,
      'uuId': loggedInUser.uuId,
      'name': loggedInUser.name,
      'email': loggedInUser.email,
      'photo': loggedInUser.photo,
      'roleTypeId': loggedInUser.roleTypeId,
      'roleName': loggedInUser.roleName,
      'token': loggedInUser.token,
    };
  }

  @override
  String toString() {
    return "LoggedInUser(userId: $userId, uuId: $uuId, name: $name, email: $email, photo: $photo, roleTypeId: $roleTypeId, roleName: $roleName, token: $token)";
  }

  @override
  List<Object?> get props =>
      [userId, uuId, name, email, photo, roleTypeId, roleName, token];
}
