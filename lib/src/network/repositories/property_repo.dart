import 'package:strava_clone/src/network/api/property_api.dart';


class PropertyRepo {

  final PropertyApi propertyApi = PropertyApi();

  Future<dynamic> submitLoginForm(jsonData) async {
    final resultData = await propertyApi.getProperty(jsonData);
    if (resultData['status']) {
      if (resultData['error'] != null) {
        return resultData;
      } else {
        return resultData;
      }
    } else {
      return resultData;
    }
  }

}