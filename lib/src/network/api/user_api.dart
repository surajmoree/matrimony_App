import 'dart:convert';

import 'api.dart';

class UserApi extends Api {

  Future<dynamic> memberEmailLogin(jsonData) async {
    try {
    final getResultData =
        await requestPOST(path: 'memberEmailLogin', parameters: jsonData);
    String userData = super.stringToBase64(getResultData['data']);
    final Map<String, dynamic> resultData =  {
          'token' : getResultData["accessToken"],
          'userData': jsonDecode(userData)
      };    
    return resultData;        
    }
     catch (_) {
      throw ('Not able to memberEmailLogin');
    }
  }

}