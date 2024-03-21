  import 'package:flutter/cupertino.dart';

TextEditingController fnameController = TextEditingController();
TextEditingController lnameController = TextEditingController();
TextEditingController dateController = TextEditingController();
TextEditingController monthController = TextEditingController();
TextEditingController yearController = TextEditingController();
bool allFieldsFilled = false;
bool allDropDownVal = false;
String? selectedReligion;
String? selectedCommunity;
String? selectedCountry;
String? selectedCountry1;
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
String selectedGender = '';
String selectedCountryCode = '+92';
  // late Country selectedCountryCode;
String phoneNumber ="";
String VerificatiobId ="";
String SmsCode = "";
TextEditingController mpinController = TextEditingController();
List<Map<String, String>> countryList = [];

String getCombinedValue(Map<String, String> country) {
    return '${country['code']} - ${country['name']}';
  }

  