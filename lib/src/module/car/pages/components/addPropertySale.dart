// import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:strava_clone/src/module/car/pages/components/propertyType/commertialProperty.dart';
import 'package:strava_clone/src/module/car/pages/components/propertyType/residentialProperty.dart';
import 'package:strava_clone/src/module/car/pages/components/variables.dart';

class PropertySale extends StatefulWidget {
  @override
  _PropertySaleState createState() => _PropertySaleState();
}

class _PropertySaleState extends State<PropertySale> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  String selectedPropertyType = 'Personal';

  void updateImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.white,
                  pinned: true,
                  title: Center(
                    child: Text(
                      'Add car For Sale',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 65),
                                    Icon(Icons.directions_car_outlined),
                                    SizedBox(width: 10),
                                    Text(
                                      'Car Type',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                 height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 55,
                                      color: Colors.white,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedPropertyType = 'Personal';
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              selectedPropertyType == 'Personal'
                                                  ? Colors.blue
                                                  : Colors.white,
                                        ),
                                        child: Text(
                                          'Personal',
                                          style: TextStyle(
                                            color: selectedPropertyType ==
                                                    'Personal'
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                    width: 150,
                                      height: 55,
                                      color: Colors.white,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedPropertyType = 'Transport';
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              selectedPropertyType ==
                                                      'Transport'
                                                  ? Colors.blue
                                                  : Colors.white,
                                        ),
                                        child: Text('Transport',
                                            style: TextStyle(
                                              color: selectedPropertyType ==
                                                      'Transport'
                                                  ? Colors.white
                                                  : Colors.black,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              if (selectedPropertyType == 'Personal')
                                ResidentialForm(
                                  updateImage: updateImage,
                                ),
                              if (selectedPropertyType == 'Transport')
                                CommercialForm(),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 30,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: () async {
            if (form != null &&
                form!.validate()) //MyFormkey.currentState!.validate()
            {
              if (selectedPropertyType == 'Personal') {
                await _storage.write(
                    key: 'selectedButton', value: selectedButton);
                await _storage.write(
                    key: 'varicar', value: varicarController.text);
                await _storage.write(
                    key: 'selectedCity', value: selectedCity ?? "");
                await _storage.write(
                    key: 'location', value: locationController.text);
                await _storage.write(
                    key: 'carName', value: carNameController.text);
                await _storage.write(
                    key: 'carDescription',
                    value: carDescriptionController.text);
                await _storage.write(
                    key: 'carDescription', value: pricectrl.text);

                await _storage.write(key: 'selectedYear', value: showYear);
                await _storage.write(
                    key: 'tyre', value: tyrefieldController.text);

                await _storage.write(
                    key: 'Accidental', value: accidentalController.text);
                await _storage.write(
                    key: 'selectedCity', value: selectedColor ?? "");
                if (image != null) {
                  await _storage.write(key: 'imagePath', value: image.path);
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form values stored securely.')),
                );

                print('${selectedButton}');
                print('${varicarController.text}');
                print('${selectedCity}');

                print('${locationController.text}');
                print('${carNameController.text}');
                print('${carDescriptionController.text}');
                print('${pricectrl.text}');
                print('${showYear}');
                print('${tyrefieldController.text}');
                print('${accidentalController.text}');
                print('${selectedColor}');
                print('${image.path}');

                print('personal clciked');
              } else if (selectedPropertyType == 'Transport') {
                await _storage.write(
                    key: 'selectedButton', value: selectedButton);
                await _storage.write(
                    key: 'varicar', value: varicarController1.text);
                await _storage.write(
                    key: 'selectedCity', value: selectedCity1 ?? "");
                await _storage.write(
                    key: 'location', value: locationController1.text);
                await _storage.write(
                    key: 'carName', value: carNameController1.text);
                await _storage.write(
                    key: 'carDescription',
                    value: carDescriptionController1.text);
                await _storage.write(
                    key: 'carDescription', value: pricectrl1.text);

                await _storage.write(key: 'selectedYear', value: showYear1);
                await _storage.write(
                    key: 'tyre', value: tyrefieldController1.text);

                await _storage.write(
                    key: 'Accidental', value: accidentalController1.text);
                await _storage.write(
                    key: 'selectedCity', value: selectedColor1 ?? "");
                if (image != null) {
                  await _storage.write(key: 'imagePath', value: image1.path);
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form values stored securely.')),
                );

                print('${selectedButton}');
                print('${varicarController1.text}');
                print('${selectedCity1}');

                print('${locationController1.text}');
                print('${carNameController1.text}');
                print('${carDescriptionController1.text}');
                print('${pricectrl1.text}');
                print('${showYear1}');
                print('${tyrefieldController1.text}');
                print('${accidentalController1.text}');
                print('${selectedColor1}');
                print('${image1.path}');

                print('transport clicked');
              }
              //      moveToNext();
            }
          },
          child: Text('Publish'),
        ),
      ),
    );
  }

  void moveToNext() {
    Navigator.pushNamed(context, '/home_screen');
  }
}
