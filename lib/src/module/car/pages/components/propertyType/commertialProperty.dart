import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strava_clone/src/module/car/pages/components/variables.dart';

import '../../../dropDown/cityList.dart';
import '../../../dropDown/colorList.dart';

class CommercialForm extends StatefulWidget {
  @override
  State<CommercialForm> createState() => _CommercialFormState();
}

class _CommercialFormState extends State<CommercialForm> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  DateTime _selectedYear = DateTime.now();

  final picker = ImagePicker();
  bool _load = false;

  void _imageCallback(File newImage) {
    setState(() {
      image1 = newImage;
      _load = true;
    });
  }

  Future getImageFromGallery(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        image1 = File(pickedFile.path);
        _load = true;
      } else {
        print('No image selected.');
      }
    });
  }

  selectYear(context) async {
    print("Calling date picker");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 10, 1),
              lastDate: DateTime(2025),
              initialDate: DateTime.now(),
              selectedDate: _selectedYear,
              onChanged: (DateTime dateTime) {
                print(dateTime.year);
                setState(() {
                  _selectedYear = dateTime;
                  showYear1 = "${dateTime.year}";
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  void verifiedCarDialog1() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              elevation: 16,
              child: Container(
                height: 220,
                width: 45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade500),
                        ),
                        color: Colors.white,
                      ),
                      child: const Center(child: Text('Status')),
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: const Text('YES'),
                              value: 'YES',
                              groupValue: selectValue11,
                              onChanged: (value) {
                                setState(() {
                                  selectValue11 = value.toString();
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: const Text('NO'),
                              value: 'NO',
                              groupValue: selectValue11,
                              onChanged: (value) {
                                setState(() {
                                  selectValue11 = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 55,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancle')),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  varicarController1.text = selectValue11;

                                  Navigator.of(context).pop();
                                },
                                child: const Text('Ok')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void showTyreDialog1() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              elevation: 16,
              child: Container(
                height: 220,
                width: 45,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade500),
                        ),
                        color: Colors.white,
                      ),
                      child: const Center(child: Text('Status')),
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: const Text('NEW'),
                              value: 'NEW',
                              groupValue: selectValue22,
                              onChanged: (value) {
                                setState(() {
                                  selectValue22 = value.toString();
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: const Text('OLD'),
                              value: 'OLD',
                              groupValue: selectValue22,
                              onChanged: (value) {
                                setState(() {
                                  selectValue22 = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 55,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancle')),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  tyrefieldController1.text = selectValue22;

                                  Navigator.of(context).pop();
                                },
                                child: const Text('Ok')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void showAccidentalDialog1() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              elevation: 16,
              child: Container(
                height: 220,
                width: 45,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade500),
                        ),
                        color: Colors.white,
                      ),
                      child: const Center(child: Text('Status')),
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: const Text('YES'),
                              value: 'YES',
                              groupValue: selectValue33,
                              onChanged: (value) {
                                setState(() {
                                  selectValue33 = value.toString();
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: const Text('NO'),
                              value: 'NO',
                              groupValue: selectValue33,
                              onChanged: (value) {
                                setState(() {
                                  selectValue33 = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 55,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancle')),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  accidentalController1.text = selectValue33;

                                  Navigator.of(context).pop();
                                },
                                child: const Text('Ok')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double inputWidth = constraints.maxWidth - 20;
      return Form(
        key: MyFormkey,
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.97,
              height: 40,
              child: Row(
                children: const [
                  Icon(Icons.directions_car_outlined),
                  SizedBox(width: 10),
                  Text('Brand',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 55,
                    width: inputWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButton = "Force Motors";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == "Force Motors"
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Force Motors',
                                  style: TextStyle(
                                      color: selectedButton == "Force Motors"
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButton = "Mahindra";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedButton == "Mahindra"
                                      ? Colors.blue
                                      : Colors.white),
                              child: Text(
                                'Mahindra',
                                style: TextStyle(
                                    color: selectedButton == "Mahindra"
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 55,
                    width: inputWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButton = "Asia MotorWorks";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == "Asia MotorWorks"
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Asia MotorWorks',
                                  style: TextStyle(
                                      color: selectedButton == "Asia MotorWorks"
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedButton = "BharatBenz";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButton == "BharatBenz"
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(
                              'BharatBenz',
                              style: TextStyle(
                                  color: selectedButton == "BharatBenz"
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 55,
                    width: inputWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButton = "Tata Motors";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == "Tata Motors"
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Tata Motors',
                                  style: TextStyle(
                                      color: selectedButton == "Tata Motors"
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButton = "SML Isuzu";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedButton == "SML Isuzu"
                                      ? Colors.blue
                                      : Colors.white),
                              child: Text(
                                'SML Isuzu',
                                style: TextStyle(
                                    color: selectedButton == "SML Isuzu"
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 55,
                    width: inputWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButton = "Hindustan Motors";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == "Hindustan Motors"
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Hindustan Motors',
                                  style: TextStyle(
                                      color:
                                          selectedButton == "Hindustan Motors"
                                              ? Colors.white
                                              : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButton = "Asia Motors";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      selectedButton == "Asia Motors"
                                          ? Colors.blue
                                          : Colors.white),
                              child: Text(
                                'Asia Motors',
                                style: TextStyle(
                                    color: selectedButton == "Asia Motors"
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButton = "volvo";
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedButton == "volvo"
                                      ? Colors.blue
                                      : Colors.white),
                              child: Text(
                                'volvo',
                                style: TextStyle(
                                    color: selectedButton == "volvo"
                                        ? Colors.white
                                        : Colors.black),
                              ))),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    double inputWidth = constraints.maxWidth - 20;
                    return InkWell(
                      onTap: () {
                        verifiedCarDialog1();
                      },
                      child: Container(
                        height: 60,
                        width: inputWidth,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(Icons.directions_car_filled),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(child: Text('Varified Car')),
                            const SizedBox(width: 110),
                            // Text();
                            Text('${selectValue11}'),

                            IconButton(
                                onPressed: () {
                                  verifiedCarDialog1();
                                },
                                icon: const Icon(Icons.arrow_drop_down)),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    double inputWidth = constraints.maxWidth - 20;
                    return Container(
                      width: inputWidth,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
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
                          children: [
                            const Icon(
                              Icons.location_city,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
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
                        value: selectedCity1,
                        onChanged: (String? value) {
                          setState(() {
                            selectedCity1 = value;
                          });
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
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth -
                          20; // Adjust padding and margins

                      return Container(
                        width: inputWidth,
                        child: TextFormField(
                          controller: locationController1,
                          validator: (String? name) {
                            if (name!.isEmpty) {
                              return "Please Enter location";
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              labelText: "Enter location",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Icon(Icons.directions_car_outlined),
                        const SizedBox(width: 10),
                        const Text('Car Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth -
                          20; // Adjust padding and margins

                      return Container(
                        width: inputWidth,
                        child: TextFormField(
                          controller: carNameController1,
                          validator: (String? name) {
                            if (name!.isEmpty) {
                              return "Please Enter car name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              labelText: "Car Name",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth -
                          20; // Adjust padding and margins

                      return Container(
                        width: inputWidth,
                        child: TextFormField(
                          controller: carDescriptionController1,
                          validator: (String? name) {
                            if (name!.isEmpty) {
                              return "Please Enter car description";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              labelText: "Car description",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth -
                          20; // Adjust padding and margins

                      return Container(
                        width: inputWidth,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (String? name) {
                            if (name!.isEmpty) {
                              return "Please Enter car price";
                            }
                            return null;
                          },
                          controller: pricectrl1,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.label_off_outlined),
                              suffix: Text(
                                'INR',
                                style: TextStyle(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              labelText: "Price*",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    double inputWidth = constraints.maxWidth - 20;
                    return Container(
                      height: 60,
                      width: inputWidth,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              selectYear(context);
                            },
                            child: Container(
                              height: 60,
                              width: inputWidth / 2 - 10,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(showYear1),
                                  SizedBox(
                                    width: inputWidth / 2 - 100,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      selectYear(context);
                                    },
                                    child: const Icon(
                                      Icons.calendar_month,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showTyreDialog1();
                            },
                            child: Container(
                              height: 60,
                              width: inputWidth / 2 - 10,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 15),
                                  const Expanded(child: Text('Tyre')),

                                  Text('${selectValue22}'),
                                  InkWell(
                                      onTap: () {
                                        showTyreDialog1();
                                      },
                                      child: const Icon(Icons.arrow_drop_down)),
                                  const SizedBox(width: 8),
                                  // IconButton(
                                  //     onPressed: () {
                                  //       showTyreDialog1();
                                  //     },
                                  //     icon: Icon(Icons.arrow_drop_down)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    double inputWidth = constraints.maxWidth - 20;
                    return Container(
                      height: 60,
                      width: inputWidth,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showAccidentalDialog1();
                            },
                            child: Container(
                              height: 60,
                              width: inputWidth / 2 - 10,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 15),
                                  const Expanded(child: Text('Accidental')),
                                  Text('${selectValue33}'),
                                  InkWell(
                                      onTap: () {
                                        showAccidentalDialog1();
                                      },
                                      child: const Icon(Icons.arrow_drop_down)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: inputWidth / 2 - 10,
                            decoration: const BoxDecoration(
                                //  border: Border.all(),
                                //   borderRadius: BorderRadius.circular(2),
                                ),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1))),
                              validator: (String? name) {
                                if (name!.isEmpty) {
                                  return "Please enter color";
                                }
                                return null;
                              },
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  const Icon(
                                    Icons.car_repair,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'Select color',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              items: colors
                                  .map((String item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromARGB(255, 51, 50, 50),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: selectedColor1,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedColor1 = value;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        const Icon(Icons.image),
                        const SizedBox(width: 10),
                        const Text('Car Images',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _load
                      ? Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(image1),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(15.0),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              height: 200,
                              width: 200,
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  'No Image Selected',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                  ElevatedButton(
                    onPressed: () {
                      getImageFromGallery(ImageSource.gallery);
                    },
                    child: const Text('Upload Picture'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 20,
                    width: 320,
                    child: const Center(
                        child: Text(
                      'Please select car images',
                      style: TextStyle(color: Colors.black),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        )),
      );
    });
  }
}
