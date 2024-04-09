import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../car.dart';
import 'carTypeForRent/personalcar.dart';
import 'carTypeForRent/transportCar.dart';

class carRent extends StatefulWidget {
  @override
  State<carRent> createState() => _carRentState();
}

class _carRentState extends State<carRent> {
    final GlobalKey<FormState> residentialFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> commercialFormKey = GlobalKey<FormState>();
  // for residential
  String residentialSelectedButton = "";
  final TextEditingController residentialrentFrequencyCtrl =
      TextEditingController();
  String residentialselectValue1 = '';
  String? residentialselectedCity;
  String residentialshowYear = 'Year';
  final TextEditingController residentialtyreController =
      TextEditingController();
  String residentialselectValue2 = '';
  final TextEditingController residentialaccidentalController =
      TextEditingController();
  String residentialselectValue3 = '';
  String? residentialselectedColor;
  late File residentialonImageSelected;

  final TextEditingController residentialLocationController =
      TextEditingController();
  final TextEditingController residentialCarNameController =
      TextEditingController();
  final TextEditingController residentialCarDescController =
      TextEditingController();
  final TextEditingController residentialPriceController =
      TextEditingController();

  // for commercial

  String commercialSelectedButton = "";
  final TextEditingController commercialrentFrequencyCtrl =
      TextEditingController();
  String commercialselectValue1 = '';
  String? commercialselectedCity;
  String commercialshowYear = 'Year';
  final TextEditingController commercialtyreController =
      TextEditingController();
  String commercialselectValue2 = '';
  final TextEditingController commercialaccidentalController =
      TextEditingController();
  String commercialselectValue3 = '';
  String? commercialselectedColor;
  late File commercialonImageSelected;
  final TextEditingController commercialLocationController =
      TextEditingController();
  final TextEditingController commercialCarNameController =
      TextEditingController();
  final TextEditingController commercialCarDescController =
      TextEditingController();
  final TextEditingController commercialPriceController =
      TextEditingController();

  final FlutterSecureStorage _storage = FlutterSecureStorage();
  bool _isMounted = false;
  String selectedPropertyType = 'Personal';
 

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height-30,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
               
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => CarPage()));
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.blue,
                        )),
      
                    backgroundColor: Colors.white,
                    pinned: true,
                    elevation: 0,
                    title: Text(
                      'Add car For Rent',
                      style: TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.97,
                              //   color: Colors.amber,
                              height: 40,
                              child: Row(
                                //  mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.directions_car_outlined),
                                  SizedBox(width: 10),
                                  Text(
                                    'Car Type',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
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
                                          color:
                                              selectedPropertyType == 'Personal'
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
                                            selectedPropertyType == 'Transport'
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
                              personalCar(
                         
                             formkey:residentialFormKey,
                             rentFrequencyCtrl: residentialrentFrequencyCtrl,
                                locationController:
                                    residentialLocationController,
                                carNameController: residentialCarNameController,
                                carDescriptionController:
                                    residentialCarDescController,
                                pricectrl: residentialPriceController,
                                accidentalController:
                                    residentialaccidentalController,
                             
                             tyrefieldController: residentialtyreController,
                       
                               
                                onButtonSelected: (value) {
                                
                                    residentialSelectedButton = value;
                                
                                }, 
                     
                                 onselectedCity: (value) {
                                   residentialselectedCity = value; 

                                   }, 
                                   onSelectedYear: (value ) { 
                                     residentialshowYear = value;
                                   }, onSelectedColor: (value ) {
                                    residentialselectedColor = value;
                                     }, onSelectedImage: (value) { 
                                      residentialonImageSelected = value;
                                      },
                              ),
                            if (selectedPropertyType == 'Transport')
                              transportCar(
                         
                               formkey: commercialFormKey, 
                               rentFrequencyCtrl: commercialrentFrequencyCtrl,
                                locationController:
                                    commercialLocationController,
                                carNameController: commercialCarNameController,
                                carDescriptionController:
                                    commercialCarDescController,
                                pricectrl: commercialPriceController,
                                accidentalController:
                                    commercialaccidentalController,
                       
                             //   tyreController: commercialtyreController,
                                 onselectedCity: (value ) { 
                                  commercialselectedCity = value;
                                  }, 
                              
                                onButtonSelected: (value ) { 
                                //  setState(() {
                                    commercialSelectedButton = value;
                               //   });
                                 }, onSelectedColor: (value ) { 
                                 commercialselectedColor = value;
                                  }, onSelectedYear: (value ) { 
                                       commercialshowYear = value;
                                   }, 
                                  //  onSelectedCity: (value ) { 
                                  //    commercialselectedCity = value ;
                                  //   },
                                     onSelectedImage: (value ) { 
                                      commercialonImageSelected = value;
                                     }, tyrefieldController:commercialtyreController, 
                              ),
                          ],
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
      ),
      bottomNavigationBar: Container(
        height: 30,
        width: MediaQuery.of(context).size.width * 0.8,
        child:
        ElevatedButton(
          onPressed: () async {
            bool isValid = true;
            if (selectedPropertyType == 'Personal') {
              isValid = residentialFormKey.currentState!.validate();
            } else if (selectedPropertyType == 'Transport') {
              // Check if commercialFormKey is not null before accessing currentState
              if (commercialFormKey.currentState != null) {
                isValid = commercialFormKey.currentState!.validate();
              }
            }

            if (isValid) {
              // Proceed with storing data
              if (selectedPropertyType == 'Personal') {
                await _storage.write(
                    key: 'selectedButton', value: residentialSelectedButton);
                await _storage.write(
                    key: 'varicar', value:  residentialrentFrequencyCtrl.text);
                await _storage.write(
                    key: 'selectedCity', value: residentialselectedCity);
                await _storage.write(
                    key: 'location', value: residentialLocationController.text);
                await _storage.write(
                    key: 'carName', value: residentialCarNameController.text);
                await _storage.write(
                    key: 'carDescription',
                    value: residentialCarDescController.text);
                await _storage.write(
                    key: 'carDescription',
                    value: residentialPriceController.text);

                             await _storage.write(key: 'selectedYear', value:  residentialshowYear);
                 await _storage.write(
                     key: 'tyre', value: residentialtyreController.text);

                     await _storage.write(
                     key: 'Accidental', value:  residentialaccidentalController.text);
                 await _storage.write(
                     key: 'selectedCity', value:  residentialselectedColor ?? "");
                         await _storage.write(key: 'imagePath', value: residentialonImageSelected.path);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form values stored securely.')),
                );
                print('${residentialSelectedButton}');
                print('${ residentialrentFrequencyCtrl.text}');

                print('${residentialselectedCity}');
                print('${residentialLocationController.text}');
                print('${residentialCarNameController.text}');
                print('${residentialCarDescController.text}');
                print('${residentialPriceController.text}');
          
                  
                    print('${residentialshowYear}');
                  print('${residentialtyreController.text}');
                   print('${ residentialaccidentalController.text}');
                  
                    print('${ residentialselectedColor}');
                    print('${residentialonImageSelected.path}');

                print('personal clciked');
                // Store data for Personal
              } else if (selectedPropertyType == 'Transport') {
                await _storage.write(
                    key: 'selectedButton', value: commercialSelectedButton);
                await _storage.write(
                    key: 'varicar', value: commercialrentFrequencyCtrl.text);
                await _storage.write(
                    key: 'selectedCity', value: commercialselectedCity);
                await _storage.write(
                    key: 'location', value: commercialLocationController.text);
                await _storage.write(
                    key: 'carName', value: commercialCarNameController.text);
                await _storage.write(
                    key: 'carDescription',
                    value: commercialCarDescController.text);
                await _storage.write(
                    key: 'carDescription',
                    value: commercialPriceController.text);

                               await _storage.write(key: 'selectedYear', value:  commercialshowYear);
                 await _storage.write(
                     key: 'tyre', value: commercialtyreController.text);
                                          await _storage.write(
                     key: 'Accidental', value:  commercialaccidentalController.text);
                 await _storage.write(
                     key: 'selectedCity', value:  commercialselectedColor ?? "");
                       await _storage.write(key: 'imagePath', value: commercialonImageSelected.path);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Form values stored securely.')),
                );

                print('${commercialSelectedButton}');

                
                print('${commercialrentFrequencyCtrl.text}');
                print('${commercialselectedCity}');
                print('${commercialLocationController.text}');
                print('${commercialCarNameController.text}');
                print('${commercialCarDescController.text}');
                print('${commercialPriceController.text}');
                  print('${commercialshowYear}');
                  print('${commercialtyreController.text}');
                                  print('${commercialaccidentalController.text}');
                  print('${commercialselectedColor}');
                          print('${commercialonImageSelected.path}');

                print('Transport clciked');
                // Store data for Transport
              }
            }
          },
          child: Text('Publish'),
        ),

      ),
    );
  }
}
