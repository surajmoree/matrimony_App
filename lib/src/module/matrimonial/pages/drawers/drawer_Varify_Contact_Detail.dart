import 'dart:convert';

import 'package:strava_clone/src/boot.dart';

import '../list/country_code.dart';
import '../variables.dart';

class verify_contact extends StatefulWidget {
  @override
  State<verify_contact> createState() => _verify_contactState();
}

class _verify_contactState extends State<verify_contact> {
  @override
  void initState() {
    super.initState();
    countryList = parseJson(jsonText);
  }

  void updateCountryCode(String countryCode) {
    setState(() {
      selectedCountryCode = countryCode;
    });
  }

  void updatePhoneNumber(String phoneNumber) {
    setState(() {
      phoneController.text = phoneNumber;
    });
  }

  List<Map<String, String>> parseJson(String jsonString) {
    final Map<String, dynamic> parsed = json.decode(jsonString);
    final List<dynamic> countries = parsed['countries'];
    return countries
        .map((country) => {
              'code': country['code'].toString(),
              'name': country['name'].toString(),
            })
        .toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Contact Details'),
        backgroundColor: Colors.pink.shade400,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Color.fromARGB(255, 236, 234, 234),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Icon(
                      Icons.smartphone,
                      size: 40,
                      color: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'You will receive an SMS with verification PIN to',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(selectedCountryCode,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                        Text(
                          phoneController.text,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                        TextButton(
                            onPressed: () {
                              showEditDialog(context);
                            },
                            child: Text('Edit',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.pink)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      maxLines: 2,
                      //   controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          //            hintText: 'Mobile No.',
                          label: Text('Enter PIN',
                              style: TextStyle(color: Colors.pink))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      print('verify');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: Center(
                          child: Text('VERIFY',
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),

                  InkWell(
                         onTap: () {
                      print('resendpin');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: Center(
                          child: Text('Resend PIN',
                              style: TextStyle(color: Colors.pink))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return
            //  buildEditDialog(context);
            StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Dialog(
                insetPadding: EdgeInsets.fromLTRB(0, 280, 0, 280),
                child: buildEditDialog(context, setState),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildEditDialog(BuildContext context, StateSetter setState) {
    return Center(
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: MediaQuery.of(context).size.height, end: 0),
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.translate(
            offset: Offset(0, value),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      'Edit Mobile No.',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text('Select a country'),
                      value: selectedCountry,
                      onChanged: (String? newValue) {
                        setState(() {
                          //    selectedCountry = newValue;
                          selectedCountry = newValue!;
                          selectedCountryCode = newValue.split('_')[0];
                        });
                      },
                      items: countryList.map<DropdownMenuItem<String>>(
                          (Map<String, String> country) {
                        return DropdownMenuItem<String>(
                          value: getCombinedValue(country),
                          child: Row(
                            children: [
                              Radio<String>(
                                value: getCombinedValue(country),
                                groupValue: selectedCountry,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    // selectedCountry = newValue;
                                    selectedCountry = newValue!;
                                    //    selectedCountryCode = newValue.split('_')[0];
                                    selectedCountryCode =
                                        country['code'].toString();
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                              Text(
                                getCombinedValue(country),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          //            hintText: 'Mobile No.',
                          label: Text('Mobile No.',
                              style: TextStyle(color: Colors.pink))),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 250),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancle',
                              style: TextStyle(color: Colors.pink)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              updateCountryCode(selectedCountryCode);
                              updatePhoneNumber(phoneController.text);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Save',
                              style: TextStyle(color: Colors.pink)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
