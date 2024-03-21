import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strava_clone/src/module/matrimonial/pages/drawers/drawer_Your_Name.dart';
import 'package:strava_clone/src/module/matrimonial/pages/drawers/drawer_Your_Profile.dart';

import '../variables.dart';
import 'drawer_Country_Code.dart';
import 'drawer_Your_Religion.dart';

class your_Email_Phone extends StatefulWidget {
  @override
  State<your_Email_Phone> createState() => _your_Email_PhoneState();
}

class _your_Email_PhoneState extends State<your_Email_Phone> {
  var MyFormkey = GlobalKey<FormState>();

  bool allFieldsFilled = false;

  void checkFields() {
    if (emailController.text.isNotEmpty && phoneController.text.isNotEmpty) {
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
         leading: IconButton(
    icon: Icon(Icons.arrow_back_sharp,color: Colors.pink,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  your_religion()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:   LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints )
                      {
                        double inputWidth = constraints.maxWidth - 50;
                        return  SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
                 const SizedBox(
              height: 80,
            ),
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 211, 185),
                      // border: Border.all(color: Colors.pink),

                      shape: BoxShape.circle),
                  child: Icon(
                    FontAwesomeIcons.userShield,
                    //  size: 45,
                    size: 43,
                    color: Color.fromARGB(255, 221, 144, 29),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: MyFormkey,
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          'An active email ID & phone no.',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 240, 135, 170)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 3),
                        child: Text(
                          'are required to secure your profile',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 240, 135, 170)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
             Container(
              width:  inputWidth,
               child: Text(
                    'Email ID',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 240, 135, 170)),
                  ),
             ),
           
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: TextFormField(
                  controller: emailController,
                  onChanged: (value) => checkFields(),
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return "Please enter a first name";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      labelText: "Email ID",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            Container(
              width: inputWidth,
              child: Text(
                    'Mobile no',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 240, 135, 170)),
                  ),
            ),
            
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  // Show the country code picker when tapped.

                  final picked =
                      await countryPicker.showPicker(context: context);
                  // Null check
                  if (picked != null) {
                    setState(() {
                      selectedCountryCode = picked.dialCode;
                    });
                  }
                },
                child: Container(
                    width: inputWidth,
                  height: 62,
           
                  decoration:
                      BoxDecoration(
                           
                        borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Container(
                        
                        width: 80,
                        height: 62,
                        decoration: BoxDecoration(
                        
                            border: Border.all(color:selectedCountryCode.isNotEmpty ? Colors.pink : Colors.grey,width: 2 ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              selectedCountryCode,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, right: 3),
                          child: TextFormField(
                              controller: phoneController,
                           
                              
                             
                              onChanged: (value) => checkFields(),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                  labelText: "Mobile no",
                                  hintText: "Mobile no",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.pink,
                                        width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          
              SizedBox(
                height: 50,
              ),
              Container(
                width: 140,
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: ElevatedButton(
                  onPressed: allFieldsFilled
                      ? () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return Scaffold(
                                  // Wrapping with Scaffold for app bar and other functionalities
                                  body: your_profile(),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 1500),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = Offset(0.0, 1.0);
                                var end = Offset.zero;
                                var curve = Curves.easeOutQuart;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: animation.drive(Tween(
                                          begin: Offset(0.0, 1.0),
                                          end: Offset.zero)
                                      .chain(CurveTween(
                                          curve: Curves.easeOutQuart))),
                                  child: child,
                                  // position: offsetAnimation,
                                  // child: child,
                                );
                              },
                            ),
                          );

                          print('selected');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    backgroundColor: Colors.white,
                  ),
                  child: Icon(Icons.forward,
                      size: 30,
                      color: allFieldsFilled
                          ? Colors.pink
                          : Color.fromARGB(223, 0, 0, 0)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 200,
                height: 35,
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text:
                        'By creating account, you agree to our                ',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  TextSpan(text: 'd '),
                  TextSpan(
                      text: '          Privacy Policy ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 180, 231),
                          fontSize: 12),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => your_name()));
                        }),
                  TextSpan(
                      text: 'and ',
                      style: TextStyle(color: Colors.black, fontSize: 12)),
                  TextSpan(
                      text: 'T&C',
                      style: TextStyle(
                          color: Color.fromARGB(255, 9, 180, 231),
                          fontSize: 12),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => your_name()));
                        }),
                ])),
              ),
            ],
          ),
        ),
      );
                      }),
      
      
     

      
    );
  }
}
