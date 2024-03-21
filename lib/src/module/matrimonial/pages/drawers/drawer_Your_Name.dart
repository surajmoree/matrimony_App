import 'package:strava_clone/src/boot.dart';
import 'package:strava_clone/src/module/matrimonial/pages/drawers/drawer_Your_Religion.dart';
import 'package:strava_clone/src/module/matrimonial/pages/validation/dob_Validation.dart';
import 'package:strava_clone/src/module/matrimonial/pages/variables.dart';

class your_name extends StatefulWidget {
  @override
  State<your_name> createState() => _your_nameState();
}

class _your_nameState extends State<your_name> {
  var MyFormkey = GlobalKey<FormState>();

  void checkFields() {
    if (fnameController.text.isNotEmpty &&
        lnameController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        monthController.text.isNotEmpty &&
        yearController.text.isNotEmpty) {
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
      body:
           LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints )
                      {
                        double inputWidth = constraints.maxWidth-50;
                        return    SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Center(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 223, 208, 248),
                    // border: Border.all(color: Colors.pink),

                    shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  size: 45,
                  color: Color.fromARGB(255, 167, 125, 236),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
         Container(
          width: inputWidth,
      
           child: Text(
                  'Your name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 240, 135, 170)),
                ),
         ),
         
            SizedBox(
              height: 20,
            ),
            Form(
                key: MyFormkey,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                        child: TextFormField(
                          controller: fnameController,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              labelText: "first name",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.pink,width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                        child: TextFormField(
                          controller: lnameController,
                          onChanged: (value) => checkFields(),
                          validator: (String? name) {
                            if (name!.isEmpty) {
                              return "Please enter a last name";
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              labelText: "last name",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Colors.pink,width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     Container(
                      width: inputWidth,
                       child: Text(
                            'Date of birth',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color.fromARGB(255, 240, 135, 170)),
                          ),
                     ),
                  
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 0, 15, 0),
                                  child: TextFormField(
                                    controller: dateController,
                                    onChanged: (value) => checkFields(),
                                    validator: (String? name) {
                                      if (name!.isEmpty) {
                                        return "Please enter DOB in format - DD/MM/YYYY";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        labelText: "DD",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.pink,width: 2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the fields
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, right: 25),
                                  child: TextFormField(
                                    controller: monthController,
                                    onChanged: (value) => checkFields(),
                                    validator: (String? name) {
                                      if (name!.isEmpty) {
                                        return "Please enter DOB in format - DD/MM/YYYY";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        labelText: "MM",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.pink,width: 2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      10), // Add some space between the fields
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                    onChanged: (value) => checkFields(),
                                    controller: yearController,
                                    validator: (String? name) {
                                      if (name!.isEmpty) {
                                        return "Please enter DOB in format - DD/MM/YYYY";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        labelText: "YYYY",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.pink,width: 2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          if (!isDOBValid())
                            Text(' "Please enter DOB in format - DD/MM/YYYY"',
                                style: TextStyle(color: Colors.red))
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: ElevatedButton(
                          onPressed: allFieldsFilled
                              ? () {
                                  if (MyFormkey.currentState!.validate() &&
                                      isDOBValid()) {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return Scaffold(
                                            // Wrapping with Scaffold for app bar and other functionalities
                                            body: your_religion(),
                                          );
                                        },
                                        transitionDuration:
                                            Duration(milliseconds: 1500),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          var begin = Offset(0.0, 1.0);
                                          var end = Offset.zero;
                                          var curve = Curves.easeOutQuart;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));
                                          var offsetAnimation =
                                              animation.drive(tween);

                                          return SlideTransition(
                                            position: offsetAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                    // Navigator.push(
                                    //     context,
                                    //     PageRouteBuilder(
                                    //         pageBuilder: (context, animation,
                                    //             secondaryAnimation) {
                                    //           return your_religion();
                                    //         },
                                    //         transitionDuration:
                                    //             Duration(milliseconds: 1000),
                                    //         transitionsBuilder: (context,
                                    //             animation,
                                    //             secondaryAnimation,
                                    //             child) {
                                    //           var begin = Offset(5.0, 2.0);
                                    //           var end = Offset.zero;
                                    //           var curve = Curves.easeOutQuart;

                                    //           var tween = Tween(
                                    //                   begin: begin, end: end)
                                    //               .chain(
                                    //                   CurveTween(curve: curve));

                                    //           var offsetAnimation =
                                    //               animation.drive(tween);
                                    //           return SlideTransition(
                                    //             position: offsetAnimation,
                                    //             child: child,
                                    //           );
                                    //         }));
                                    print('print');
                                  }
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
                      )
                    ],
                  ),
                ))
          ],
        )),
      );
                      }),
      
    
    );
  }
}
