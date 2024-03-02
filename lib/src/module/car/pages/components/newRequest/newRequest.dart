import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../dropDown/cityList.dart';

class newRequest extends StatefulWidget {
  @override
  State<newRequest> createState() => _newRequestState();
}

class _newRequestState extends State<newRequest> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedButton1 = "";
  String selectedButton2 = "";
  final descriptionController = TextEditingController();
  final priceRangeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String? selectedCity2;

  bool allFieldsFilled = false;
  bool isContainerVisible = false;

  void toggleButton1(String buttonName1) {
    setState(() {
      if (selectedButton1 == buttonName1) {
        selectedButton1 = "";
        isContainerVisible = false;
      } else {
        selectedButton1 = buttonName1;
        isContainerVisible = true;
      }
    });
  }

  void toggleButton2(String buttonName2) {
    setState(() {
      if (selectedButton2 == buttonName2) {
        selectedButton2 = "";
        isContainerVisible = false;
      } else {
        selectedButton2 = buttonName2;
        isContainerVisible = true;
      }
    });
  }

  void checkFields() {
    if (descriptionController.text.isNotEmpty &&
        priceRangeController.text.isNotEmpty &&
        selectedCity2 != null) {
      setState(() {
        allFieldsFilled = true;
      });
    } else {
      setState(() {
        allFieldsFilled = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'New Request',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: SingleChildScrollView(    //singlechildscrollcontroller
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Add a description of the required car',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: TextFormField(
                    controller: descriptionController,
                    onChanged: (value) => checkFields(),
                    maxLines: 5,
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      //      labelText: "Enter location",
                      hintText:
                          'Please write a detailed description of your request: Car type, Rent or Buy, car color, car name, etc...',

                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Price range',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: TextFormField(
                    controller: priceRangeController,
                    keyboardType: TextInputType.number,
                    maxLines: 2,
                    onChanged: (value) => checkFields(),
                    style: TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintText: 'INR price (Optional)',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Choose the city',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Container(
                    height: 100,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          hintStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      validator: (String? name) {
                        if (name!.isEmpty) {
                          return "Please Enter city";
                        }
                        return null;
                      },
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Select city',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedCity2,
                      onChanged: (String? value) {
                        setState(() {
                          selectedCity2 = value;
                        });
                        checkFields();
                        dropdownStyleData:
                        DropdownStyleData(
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.redAccent,
                          ),
                          elevation: 8,
                          offset: const Offset(10, 100),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Select ways to contact you',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          toggleButton1("Call");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedButton1 == "Call"
                                  ? Colors.blue
                                  : Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          height: 45,
                          width: 175,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 55,
                              ),
                              Icon(
                                Icons.call_outlined,
                                color: selectedButton1 == "Call"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Call',
                                style: TextStyle(
                                  color: selectedButton1 == "Call"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          toggleButton2("WhatsApp");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedButton2 == "WhatsApp"
                                  ? Colors.blue
                                  : Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          height: 45,
                          width: 175,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 45,
                              ),
                              Icon(
                                FontAwesomeIcons.whatsapp,
                                size: 22,
                                color: selectedButton2 == "WhatsApp"
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'WhatsApp',
                                style: TextStyle(
                                  color: selectedButton2 == "WhatsApp"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        height: 45,
                        width: 175,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.chat_sharp,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Chats',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                    visible: isContainerVisible,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text('Phone Number',
                                style: TextStyle(fontSize: 25))),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          child: IntlPhoneField(
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                            initialCountryCode: 'IN',
                            showDropdownIcon: true,
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 20),
                if (allFieldsFilled)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _storage.write(
                            key: 'description',
                            value: descriptionController.text);
                        await _storage.write(
                            key: 'price', value: priceRangeController.text);
                        await _storage.write(
                            key: 'selectedCity', value: selectedCity2 ?? "");
                        await _storage.write(
                            key: 'phone', value: phoneNumberController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Form values stored securely.')),
                        );

                        print('${descriptionController.text}');
                        print('${priceRangeController.text}');
                        print('${selectedCity2}');
                        print('${phoneNumberController.text}');
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
