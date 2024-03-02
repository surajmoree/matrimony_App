import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strava_clone/src/boot.dart';

import '../../../dropDown/cityList.dart';
import '../../../dropDown/colorList.dart';
import '../variables.dart';

class ResidentialForm extends StatefulWidget {
  final Function(File) updateImage;
  ResidentialForm({
    required this.updateImage,
  });
  String selectedPropertyType = 'Personal';
  @override
  State<ResidentialForm> createState() {
    return _ResidentialFormState();
  }
}

typedef void ImageCallback(File image);

class _ResidentialFormState extends State<ResidentialForm> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  DateTime _selectedYear = DateTime.now();

  final picker = ImagePicker();
  bool _load = false;

  void _imageCallback(File newImage) {
    setState(() {
      image = newImage;
      _load = true;
    });
  }

  Future getImageFromGallery(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
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
                  showYear = "${dateTime.year}";
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedButton = 'Hyundai';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButton == 'Hyundai'
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(
                              'Hyundai',
                              style: TextStyle(
                                  color: selectedButton == 'Hyundai'
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = 'Kia';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: selectedButton == 'Kia'
                                  ? Colors.blue
                                  : Colors.white),
                          child: Text(
                            'Kia',
                            style: TextStyle(
                                color: selectedButton == 'Kia'
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
                                selectedButton = 'Daewoo';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButton == 'Daewoo'
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(
                              'Daewoo',
                              style: TextStyle(
                                  color: selectedButton == 'Daewoo'
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = 'Renault';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: selectedButton == 'Renault'
                                  ? Colors.blue
                                  : Colors.white),
                          child: Text(
                            'Renault',
                            style: TextStyle(
                                color: selectedButton == 'Renault'
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
                                selectedButton = 'SsangYong';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButton == 'SsangYong'
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(
                              'SsangYong',
                              style: TextStyle(
                                  color: selectedButton == 'SsangYong'
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = 'Alpheon';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: selectedButton == 'Alpheon'
                                  ? Colors.blue
                                  : Colors.white),
                          child: Text(
                            'Alpheon ',
                            style: TextStyle(
                                color: selectedButton == 'Alpheon'
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
                                selectedButton = 'Proto';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButton == 'Proto'
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(
                              'Proto',
                              style: TextStyle(
                                  color: selectedButton == 'Proto'
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = 'Asia Motors';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: selectedButton == 'Asia Motors'
                                  ? Colors.blue
                                  : Colors.white),
                          child: Text(
                            'Asia Motors',
                            style: TextStyle(
                                color: selectedButton == 'Asia Motors'
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
                                selectedButton = 'volvo';
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButton == 'volvo'
                                    ? Colors.blue
                                    : Colors.white),
                            child: Text(
                              'volvo',
                              style: TextStyle(
                                  color: selectedButton == 'volvo'
                                      ? Colors.white
                                      : Colors.black),
                            ))),
                    Container(
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButton = 'Genesis';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: selectedButton == 'Genesis'
                                  ? Colors.blue
                                  : Colors.white),
                          child: Text(
                            'Genesis',
                            style: TextStyle(
                                color: selectedButton == 'Genesis'
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
                  height: 16,
                ),
                Container(
                  height: 65,
                  width: 460,
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
                      Text('${selectValue1}'),

                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, StateSetter setState) {
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
                                                      color:
                                                          Colors.grey.shade500),
                                                ),
                                                color: Colors.white,
                                              ),
                                              child:
                                                  Center(child: Text('Status')),
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
                                                            color: Colors
                                                                .grey.shade500),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: ListTile(
                                                      title: Text('YES'),
                                                      leading: Radio(
                                                        value: 'YES',
                                                        groupValue:
                                                            selectValue1,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectValue1 = value
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
                                                            color: Colors
                                                                .grey.shade500),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: ListTile(
                                                      title: Text('NO'),
                                                      leading: Radio(
                                                        //  value: 2,
                                                        value: 'NO',
                                                        groupValue:
                                                            selectValue1,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            selectValue1 = value
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
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5)),
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
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Cancle')),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    width: 80,
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          varicarController
                                                                  .text =
                                                              selectValue1;

                                                          Navigator.of(context)
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
                ),
                SizedBox(
                  height: 20,
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 5, 70, 0),
                  child: Container(
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
                      value: selectedCity,
                      onChanged: (String? value) {
                        setState(() {
                          selectedCity = value;
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 5, 70, 0),
                  child: TextFormField(
                    controller: locationController,
                    validator: (String? name) {
                      if (name!.isEmpty) {
                        return "Please Enter location";
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: "Enter location",
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 65),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 5, 70, 0),
                  child: TextFormField(
                    controller: carNameController,
                    validator: (String? name) {
                      if (name!.isEmpty) {
                        return "Please Enter car name";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: "Car Name",
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 5, 70, 0),
                  child: TextFormField(
                    controller: carDescriptionController,
                    validator: (String? name) {
                      if (name!.isEmpty) {
                        return "Please Enter car description";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: "Car description",
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 5, 70, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (String? name) {
                      if (name!.isEmpty) {
                        return "Please Enter car price";
                      }
                      return null;
                    },
                    controller: pricectrl,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.label_off_outlined),
                        suffix: Text(
                          'INR',
                          style: TextStyle(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        labelText: "Price*",
                        hintStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 65,
                  width: 460,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 220,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(showYear),
                            SizedBox(
                              width: 120,
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

                      // tyre

                      Container(
                        width: 220,
                        height: 60,
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
                            Text('${selectValue2}'),
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
                                                          Radius.circular(5))),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                            color:
                                                                Color.fromRGBO(
                                                                    158,
                                                                    158,
                                                                    158,
                                                                    1)),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500),
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          child: ListTile(
                                                            title: Text('NEW'),
                                                            leading: Radio(
                                                              value: 'NEW',
                                                              groupValue:
                                                                  selectValue2,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectValue2 =
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
                                                            color: Colors.white,
                                                          ),
                                                          child: ListTile(
                                                            title: Text('OLD'),
                                                            leading: Radio(
                                                              //  value: 2,
                                                              value: 'OLD',
                                                              groupValue:
                                                                  selectValue2,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectValue2 =
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
                                                                  .circular(5),
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
                                                          child: ElevatedButton(
                                                              onPressed: () {
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
                                                          child: ElevatedButton(
                                                              onPressed: () {
                                                                tyrefieldController
                                                                        .text =
                                                                    selectValue2;

                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child:
                                                                  Text('Ok')),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 60,
                  width: 460,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // accidental
                      Container(
                        width: 220,
                        height: 60,
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
                            Text('${selectValue3}'),
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
                                                          Radius.circular(5))),
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
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border(
                                                              bottom: BorderSide(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500),
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          child: ListTile(
                                                            title: Text('YES'),
                                                            leading: Radio(
                                                              value: 'YES',
                                                              groupValue:
                                                                  selectValue3,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectValue3 =
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
                                                            color: Colors.white,
                                                          ),
                                                          child: ListTile(
                                                            title: Text('NO'),
                                                            leading: Radio(
                                                              //  value: 2,
                                                              value: 'NO',
                                                              groupValue:
                                                                  selectValue3,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectValue3 =
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
                                                                  .circular(5),
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
                                                          child: ElevatedButton(
                                                              onPressed: () {
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
                                                          child: ElevatedButton(
                                                              onPressed: () {
                                                                accidentalController
                                                                        .text =
                                                                    selectValue3;

                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child:
                                                                  Text('Ok')),
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
                        width: 220,
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
                                    width: 20,
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
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
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
                              value: selectedColor,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedColor = value;
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 70),
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
                            image: FileImage(image),
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








// import "package:flutter/material.dart";
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:strava_clone/src/module/database/note_database.dart' as db;
// FocusNode FocusNodeFirstName = new FocusNode();
// FocusNode FocusNodePassword = new FocusNode();
// TextEditingController usernamec=TextEditingController();
// class MySignUp extends StatefulWidget {
//   const MySignUp({super.key});
//   @override
//   State<MySignUp> createState() => _MySignUpState();
// }
// class _MySignUpState extends State<MySignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//       Container(
//         height:900,
//         width: 800,
//     child: Stack(
//       children: [
//       Container(
//         child: ListView(
//           children: [
//             CarouselSlider(
//               items:[
//                  Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           color:Colors.black.withOpacity(0.3),
//                           image: const DecorationImage(
//                             image: NetworkImage(
                            
//                                 "https://images.unsplash.com/photo-1541625602330-2277a4c46182?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y3ljbGluZ3xlbnwwfHwwfHx8MA%3D%3D",),
//                             alignment: Alignment.center,
//                             fit: BoxFit.cover,
                            
//                           ),
//                         ),
                       
//                  ),
//                  Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: const DecorationImage(
//                             image: NetworkImage(
//                                 "https://images.unsplash.com/photo-1541625810516-44f1ce894bcd?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGN5Y2xpbmd8ZW58MHx8MHx8fDA%3D"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
                    
//                  ),
//                   Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: const DecorationImage(
//                             image: NetworkImage(
//                                 "https://media.istockphoto.com/id/1262293243/photo/d.jpg?s=612x612&w=0&k=20&c=HfhtRWYeR49mVmALB1zCzgOhY3YZ9ndnRnIb02CpvB8="),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
                    
//                  ),
                 
                
//             ]  ,
    
//       options: CarouselOptions(
//                       height:900,
                     
//                       enlargeCenterPage: true,
//                       autoPlay: true,
//                       aspectRatio: 4/3,
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enableInfiniteScroll: true,
//                       autoPlayAnimationDuration:
//                           const Duration(milliseconds:400),
//                       viewportFraction: 1,
    
                       
                    
//                     ),
//                   ),
                  
    
//               ]
//         )),
//         Positioned(left:50,right:50,top:200,child: SingleChildScrollView(
//          child: Container
//          (
//            //          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey ),
//                   color: Colors.black.withOpacity(0.4),
//                   height:450,width: 100,

//                                  child: Column(
//                                   children: [
        
//                                       Padding(
//                                        padding: const EdgeInsets.fromLTRB(10,10,10,10),
//                                         child: SizedBox(
//                                                                   height:40,width:500,
//                                                                  child: Card(
//                                                                     child: Center(child: InkWell(
//                                                                       onTap: (){},
//                                                                      child: Row(
//                                        children: [
//                                           Image.asset("assets/images/google.png"),
//                                            Padding(
//                                            padding: const EdgeInsets.fromLTRB(19,0,0,0),
//                                              child: Text("sign up using Google",style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),),
//                                            ),
                                           
       
//                                          ],
//                                                                       ),
//                                                                     )),
//                                                                   ),
//                                                                ),
//                                       ),
//                              SizedBox(
//                                  height:40,width:400,
//                                 child: Padding(
//                                   padding: const EdgeInsets.fromLTRB(10,0,10,0),
//                                   child: Card(
//                                     color: Color.fromARGB(255, 71, 131, 244),
//                                     child: Center(child: InkWell(
//                                        onTap: (){},
//                                        child: Row(
//                                          children: [
//                                          Image.asset("assets/images/facebook.png",height: 20,width:35),
                                           
//                                           Padding(
//                                              padding: const EdgeInsets.fromLTRB(20,0,0,0),
//                                             child: Text("Sign Up using Facebook",style: TextStyle(fontSize:14, fontWeight: FontWeight.bold),),
//                                           ),
//                                           Divider(
//                                             color: Colors.black,
//                                             thickness:3
//                                           )
//                                         ],
//                                       ),
//                                     )),
//                                   ),
//                                 ),
//                               ),
       
//                                 Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: TextField(
//                                         controller: usernamec,
//                                         style: TextStyle(color: Colors.white),
//                                         decoration: InputDecoration(
//                                           fillColor: Colors.white,
//                                           //filled: true,
//                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1 )),
//                                           hintText: "  Enter Username",hintStyle: TextStyle(color: Colors.white),
//                                           labelText: "  Username",labelStyle: TextStyle(
//                                   color: FocusNodeFirstName.hasFocus
//                                       ? Colors.blue
//                                       : Colors.grey.shade200),
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.grey)),
                            
//                                         ),
//                                       ),
//                                     ),
//                                      Padding(
//                                        padding: const EdgeInsets.all(8.0),
//                                        child: TextField(
//                                         decoration: InputDecoration(
//                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1 )),
//                                           hintText: "  Enter Password",hintStyle: TextStyle(color: Colors.white),
//                                           labelText: "  Password",labelStyle: TextStyle(
//                                   color: FocusNodePassword.hasFocus
//                                       ? Colors.blue
//                                       : Colors.grey.shade200),
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.grey)),
//                                         ),
//                                                                  ),
//                                      ),
//                                       Padding(
//                                        padding: const EdgeInsets.all(8.0),
//                                        child: TextField(
//                                         decoration: InputDecoration(
//                                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(1 )),
//                                           hintText: "  Confirm Password",hintStyle: TextStyle(color: Colors.white),
//                                           labelText: " Confirm Password",labelStyle: TextStyle(
//                                   color: FocusNodeFirstName.hasFocus
//                                       ? Colors.blue
//                                       : Colors.grey.shade200),
//                               focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.grey)),
//                                         ),
//                                                                  ),
//                                      ),
                                        
//                                         Padding(
//                                           padding:  EdgeInsets.all(8.0),
//                                           child: SizedBox(width:500,
//                                             child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade900), onPressed: (){
                                   
//                                             usernamec.clear();

//                                              Navigator.pushNamed(context,'/detail');
//                                             }, child: Text("Sign Up")),
//                                           ),
//                                         ),
//                                         Row(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(left:55.0),
//                                               child: Text("Already Member ?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 246, 242, 231)),),
//                                             ),
//                                            TextButton(onPressed: (){

//                                             Navigator.pushNamed(context,'/note');
//                                            }, child: Text("Login",style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue.shade100,fontSize: 16),))
//                                           ],
//                                         )
                                        

                    
                     
                          
                                     
//                              ],
//                            )
                      
                          
//         )
//        ))
//       ] )),
//     );
  
//   }
  

 
// }

