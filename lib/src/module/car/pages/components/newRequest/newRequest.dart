import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../car.dart';
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
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CarPage()));
              },
            ),
            title: Text(
              'New Request',
              style: TextStyle(color: Colors.black),
            )),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Form(
                  key:  _formKey,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add a description of the required car',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: descriptionController,
                          onChanged: (value) => checkFields(),
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText:
                                'Please write a detailed description of your request...',
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            'Price range',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: priceRangeController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) => checkFields(),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'INR price (Optional)',
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Choose the city',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
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
                        SizedBox(height: 20),
                        Text(
                          'Select ways to contact you',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.30,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4)),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    toggleButton1("Call");
                                  },
                                  icon: Icon(
                                    Icons.call_outlined,
                                    color: selectedButton1 == "Call"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  label: Text(
                                    'Call',
                                    style: TextStyle(
                                      color: selectedButton1 == "Call"
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedButton1 == "Call"
                                        ? Colors.blue
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  toggleButton2("WhatsApp");
                                },
                                icon: Icon(
                                  FontAwesomeIcons.whatsapp,
                                  color: selectedButton2 == "WhatsApp"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                label: Text(
                                  'WhatsApp',
                                  style: TextStyle(
                                    color: selectedButton2 == "WhatsApp"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedButton2 == "WhatsApp"
                                      ? Colors.blue
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.chat_sharp),
                                label: Text('Chats'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Visibility(
                          visible: isContainerVisible,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Number',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              IntlPhoneField(
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Mobile Number',
                                ),
                                initialCountryCode: 'IN',
                                showDropdownIcon: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        if (allFieldsFilled)
                          Center(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await _storage.write(
                                      key: 'description',
                                      value: descriptionController.text);
                                  await _storage.write(
                                      key: 'price',
                                      value: priceRangeController.text);
                                  await _storage.write(
                                      key: 'selectedCity',
                                      value: selectedCity2 ?? "");
                                  await _storage.write(
                                      key: 'phone',
                                      value: phoneNumberController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Form values stored securely.')),
                                  );

                                  print('${descriptionController.text}');
                                  print('${priceRangeController.text}');
                                  print('${selectedCity2}');
                                  print('${phoneNumberController.text}');
                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
            ),
          );
        }));
  }
}
