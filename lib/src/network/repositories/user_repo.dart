import '../api/user_api.dart';

class UserRepo {

  final UserApi userApi = UserApi();

  Future<dynamic> submitLoginForm(jsonData) async => await userApi.memberEmailLogin(jsonData);
    
  

}