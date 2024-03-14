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
  final FlutterSecureStorage _storage = FlutterSecureStorage();
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

  Widget build(BuildContext context) {
    return
     Form(
      key: MyFormkey,
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              children: const [
                SizedBox(width: 100),
                Icon(Icons.directions_car_outlined),
                SizedBox(width: 10),
                Text('Brand',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //    height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 150,
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
                      width: 150,
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
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 150,
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
                      width: 150,
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
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedButton = "Tata Motors";
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButton == "Tata Motors"
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
                      width: 150,
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
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 150,
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
                                  color: selectedButton == "Hindustan Motors"
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = "Asia Motors";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: selectedButton == "Asia Motors"
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
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 150,
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
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double inputWidth = constraints.maxWidth - 20;
                  return Container(
                    height: 60,
                    width: inputWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.directions_car_filled),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Text('Varified Car')),
                        SizedBox(width: 110),
                        // Text();
                        Text('${selectValue11}'),

                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (context, StateSetter setState) {
                                      return Dialog(
                                        elevation: 16,
                                        child: Container(
                                          height: 220,
                                          width: 45,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors
                                                            .grey.shade500),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                    child: Text('Status')),
                                              ),
                                              Container(
                                                height: 120,
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey
                                                                  .shade500),
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: ListTile(
                                                        title: Text('YES'),
                                                        leading: Radio(
                                                          value: 'YES',
                                                          groupValue:
                                                              selectValue11,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectValue11 =
                                                                  value
                                                                      .toString();
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey
                                                                  .shade500),
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: ListTile(
                                                        title: Text('NO'),
                                                        leading: Radio(
                                                          //  value: 2,
                                                          value: 'NO',
                                                          groupValue:
                                                              selectValue11,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              selectValue11 =
                                                                  value
                                                                      .toString();
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 55,
                                                    ),
                                                    Container(
                                                      width: 80,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child:
                                                              Text('Cancle')),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      width: 80,
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            varicarController1
                                                                    .text =
                                                                selectValue11;

                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text('Ok')),
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
                            },
                            icon: Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: 8,
                ),
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double inputWidth = constraints.maxWidth - 20;
                  return Container(
                    width: inputWidth,
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
                        children: [
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
                SizedBox(
                  height: 20,
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double inputWidth =
                        constraints.maxWidth - 20; // Adjust padding and margins

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
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.directions_car_outlined),
                      SizedBox(width: 10),
                      Text('Car Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double inputWidth =
                        constraints.maxWidth - 20; // Adjust padding and margins

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
                        decoration: InputDecoration(
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
                SizedBox(
                  height: 8,
                ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double inputWidth =
                        constraints.maxWidth - 20; // Adjust padding and margins

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
                        decoration: InputDecoration(
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
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double inputWidth =
                        constraints.maxWidth - 20; // Adjust padding and margins

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
                        decoration: InputDecoration(
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: inputWidth / 2 - 10,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
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
                        Container(
                          height: 60,
                          width: inputWidth / 2 - 10,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text('Tyre')),
                              SizedBox(
                                width: 29,
                              ),
                              Text('${selectValue22}'),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (context, StateSetter setState) {
                                            return Dialog(
                                              elevation: 16,
                                              child: Container(
                                                height: 220,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey
                                                                  .shade500),
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                          child:
                                                              Text('Status')),
                                                    ),
                                                    Container(
                                                      height: 120,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ListTile(
                                                              title:
                                                                  Text('NEW'),
                                                              leading: Radio(
                                                                value: 'NEW',
                                                                groupValue:
                                                                    selectValue22,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selectValue22 =
                                                                        value
                                                                            .toString();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ListTile(
                                                              title:
                                                                  Text('OLD'),
                                                              leading: Radio(
                                                                //  value: 2,
                                                                value: 'OLD',
                                                                groupValue:
                                                                    selectValue22,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selectValue22 =
                                                                        value
                                                                            .toString();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 55,
                                                          ),
                                                          Container(
                                                            width: 80,
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Cancle')),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            width: 80,
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      tyrefieldController1
                                                                              .text =
                                                                          selectValue22;

                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Ok')),
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
                                  },
                                  icon: Icon(Icons.arrow_drop_down)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: 8,
                ),
                LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double inputWidth = constraints.maxWidth - 20;
                  return Container(
                    height: 60,
                    width: inputWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: inputWidth / 2 - 10,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(child: Text('Accidental')),
                              Text('${selectValue33}'),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (context, StateSetter setState) {
                                            return Dialog(
                                              elevation: 16,
                                              child: Container(
                                                height: 220,
                                                width: 45,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.grey
                                                                  .shade500),
                                                        ),
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                          child:
                                                              Text('Status')),
                                                    ),
                                                    Container(
                                                      height: 120,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ListTile(
                                                              title:
                                                                  Text('YES'),
                                                              leading: Radio(
                                                                value: 'YES',
                                                                groupValue:
                                                                    selectValue33,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selectValue33 =
                                                                        value
                                                                            .toString();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500),
                                                              ),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: ListTile(
                                                              title: Text('NO'),
                                                              leading: Radio(
                                                                //  value: 2,
                                                                value: 'NO',
                                                                groupValue:
                                                                    selectValue33,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    selectValue33 =
                                                                        value
                                                                            .toString();
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 50,
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        5),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            5)),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 55,
                                                          ),
                                                          Container(
                                                            width: 80,
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Cancle')),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Container(
                                                            width: 80,
                                                            child:
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      accidentalController1
                                                                              .text =
                                                                          selectValue33;

                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Ok')),
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
                                  },
                                  icon: Icon(Icons.arrow_drop_down)),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: inputWidth / 2 - 10,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Select color',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
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
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
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
                                dropdownStyleData: DropdownStyleData(
                                  width: 360,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  elevation: 8,
                                  offset: const Offset(10, 100),
                                )),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(Icons.image),
                      SizedBox(width: 10),
                      Text('Car Images',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                SizedBox(
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
                            child: Center(
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
                  child: Text('Upload Picture'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 20,
                  width: 320,
                  child: Center(
                      child: Text(
                    'Please select car images',
                    style: TextStyle(color: Colors.black),
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
