import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class your_Email_Phone extends StatefulWidget
{
  @override
  State<your_Email_Phone> createState() => _your_Email_PhoneState();
}

class _your_Email_PhoneState extends State<your_Email_Phone> {
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
             const SizedBox(
              height: 130,
            ),

                  Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 241, 211, 185),
                    // border: Border.all(color: Colors.pink),

                    shape: BoxShape.circle),
                child:
                 Icon(
                        FontAwesomeIcons.userShield,
                        //  size: 45,
                        size: 43,
                        color: Color.fromARGB(255, 221, 144, 29),
                      ),
   
              ),
            ),
            SizedBox(height: 10,),

            Container(width: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,top: 5),
                  child: Text('An active email ID & phone no.',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 240, 135, 170)),),
                ),
                  Padding(
                  padding: const EdgeInsets.only(left: 22,top: 3),
                  child: Text('are required to secure your profile',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 240, 135, 170)),),
                ),
              ],
            ),
            ),

                 const SizedBox(
              height: 30,
            ),
                  const Padding(
              padding: EdgeInsets.only(right: 195),
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
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                        child: TextFormField(
                      //    controller: fnameController,
                       //   onChanged: (value) => checkFields(),
                          validator: (String? name) {
                            if (name!.isEmpty) {
                              return "Please enter a first name";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              labelText: "Email ID",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 9, 180, 231),width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),

                       SizedBox(
              height: 60,
            ),

                  const Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text(
                'Mobile no',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 240, 135, 170)),
              ),
            ),


            
          ],
        ),
      ),
    );
  }
}
 