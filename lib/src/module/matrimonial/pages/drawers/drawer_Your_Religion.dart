// import 'package:icon_decoration/icon_decoration.dart';
// import 'package:strava_clone/src/boot.dart';
// import 'package:strava_clone/src/module/matrimonial/pages/drawers/drawer_Your_Name.dart';

// import '../list/community.dart';
// import '../list/religion.dart';
// import '../variables.dart';
// import 'drawer_Your_Email_Phone.dart';

// class your_religion extends StatefulWidget {
//   @override
//   State<your_religion> createState() => _your_religionState();
// }

// class _your_religionState extends State<your_religion> {
//   bool isDropdownOpened1 = false;
//   bool isDropdownOpened2 = false;
//   bool isDropdownOpened3 = false;
//   bool isCommunityVisible = false;
//   bool isCountryVisible = false;
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//          leading: IconButton(
//     icon: Icon(Icons.arrow_back_sharp,color: Colors.pink,),
//           onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => your_name()));
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//         body:  LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints )
//                       {
//                        double inputWidth = constraints.maxWidth-50;
//                         return   SingleChildScrollView(
//       child: Container(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 80,
//             ),
//             Center(
//               child: Container(
//                 height: 80,
//                 width: 80,
//                 decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 207, 238, 226),
//                     // border: Border.all(color: Colors.pink),

//                     shape: BoxShape.circle),
//                 child: Stack(
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.only(top: 18, left: 10),
//                       child: Icon(
//                         Icons.person,
//                         //  size: 45,
//                         size: 43,
//                         color: Color.fromARGB(255, 132, 228, 191),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 18, left: 30),
//                       child: Icon(
//                         Icons.person,
//                         //  size: 45,
//                         size: 43,
//                         color: Color.fromARGB(255, 132, 228, 191),
//                       ),
//                     ),
//                     Padding(
//                         padding: EdgeInsets.only(top: 19, left: 15),
//                         child: DecoratedIcon(
//                           icon: Icon(
//                             size: 50,
//                             Icons.person,
//                             color: Color.fromARGB(255, 57, 223, 159),
//                           ),
//                           decoration: IconDecoration(
//                               border:
//                                   IconBorder(color: Colors.white, width: 3)),
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//            Container(
//             width: inputWidth,
//              child: Text(
//                   'Your religion',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                       color: Color.fromARGB(255, 240, 135, 170)),
//                 ),
//            ),
           
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
//               child: Container(
//                 child: DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(5))),
//                       hintStyle: TextStyle(color: Colors.black),
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.pink,width: 2)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black))),
//                   isExpanded: true,
//                   hint: Row(
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Text(
//                           'Religion',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   icon: Icon(isDropdownOpened1
//                       ? Icons.arrow_drop_up
//                       : Icons.arrow_drop_down),
//                   items: religion
//                       .map((String item) => DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ))
//                       .toList(),
//                   value: selectedReligion,
//                   onChanged: (String? value) {
//                     setState(() {
//                       selectedReligion = value;
//                       isDropdownOpened1 = false;
//                       isCommunityVisible = true;
//                     });
//                   },
//                   onTap: () {
//                     setState(() {
//                       isDropdownOpened1 = !isDropdownOpened1;
//                     });
//                   },
//                   onSaved: (value) {
//                     setState(() {
//                       isDropdownOpened1 =
//                           false; // Set dropdown to closed state when saved
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Visibility(
//                 visible: isCommunityVisible,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: inputWidth,
//                       child: Text(
//                           'Community',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30,
//                               color: Color.fromARGB(255, 240, 135, 170)),
//                         ),
//                     ),
                  
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
//                       child: DropdownButtonFormField<String>(
//                         decoration: const InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5))),
//                             hintStyle: TextStyle(color: Colors.black),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.pink,width: 2)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black))),
//                         isExpanded: true,
//                         hint: Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'Community',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         icon: Icon(isDropdownOpened2
//                             ? Icons.arrow_drop_up
//                             : Icons.arrow_drop_down),
//                         items: community
//                             .map((String item) => DropdownMenuItem<String>(
//                                   value: item,
//                                   child: Text(
//                                     item,
//                                     style: (item ==
//                                                 'Frequently used Communities' ||
//                                             item == 'All Communities')
//                                         ? TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w900,
//                                             color: Colors.black,
//                                           )
//                                         : TextStyle(
//                                             fontSize: 14,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                           ),
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ))
//                             .toList(),
//                         value: selectedCommunity,
//                         onChanged: (String? value) {
//                           setState(() {
//                             if (value != 'Frequently used Communities') {
//                               selectedCommunity = value;
//                               isCountryVisible = true;
//                               isDropdownOpened2 = false;
//                             }
//                           });
//                         },
//                         onTap: () {
//                           setState(() {
//                             isDropdownOpened2 = !isDropdownOpened2;
//                           });
//                         },
//                         onSaved: (value) {
//                           setState(() {
//                             isDropdownOpened2 =
//                                 false; // Set dropdown to closed state when saved
//                           });
//                         },
//                         selectedItemBuilder: (BuildContext context) {
//                           return community.map<Widget>((String item) {
//                             return Text(
//                               item,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             );
//                           }).toList();
//                         },
//                       ),
//                     ),
//                   ],
//                 )),
//             SizedBox(
//               height: 20,
//             ),
//             Visibility(
//                 visible: isCountryVisible,
//                 child: Column(
//                   children: [
//                   Container(
//                     width: inputWidth,
//                     child: Text(
//                           'Living in',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30,
//                               color: Color.fromARGB(255, 240, 135, 170)),
//                         ),
//                   ),
                  
//                     SizedBox(
//                       height: 20,
//                     ),

// /*
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
//                       child: DropdownButtonFormField<String>(
//                         decoration: const InputDecoration(
//                             border: OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(5))),
//                             hintStyle: TextStyle(color: Colors.black),
//                             focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.pink,width: 2)),
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black))),
//                         isExpanded: true,
//                         hint: Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'Country',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         icon: Icon(isDropdownOpened3
//                             ? Icons.arrow_drop_up
//                             : Icons.arrow_drop_down),
//                         items: country1
//                             .map((String item) => DropdownMenuItem<String>(
//                                   value: item,
//                                   child: Text(
//                                     item,
//                                     style:
//                                         (item == 'Frequently used Countries' ||
//                                                 item == 'All Countries')
//                                             ? TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w900,
//                                                 color: Colors.black,
//                                               )
//                                             : TextStyle(
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black,
//                                               ),
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ))
//                             .toList(),
//                         value: selectedCountry,
//                         onChanged: (String? value) {
//                           setState(() {
//                             if (value != 'Frequently used Countries') {
//                               selectedCountry = value;

//                               isDropdownOpened3 = false;
//                             }
//                           });
//                         },
//                         onTap: () {
//                           setState(() {
//                             isDropdownOpened3 = !isDropdownOpened3;
//                           });
//                         },
//                         onSaved: (value) {
//                           setState(() {
//                             isDropdownOpened3 = false;
//                           });
//                         },
//                         selectedItemBuilder: (BuildContext context) {
//                           return country1.map<Widget>((String item) {
//                             return Text(
//                               item,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             );
//                           }).toList();
//                         },
//                       ),
//                     ),

//                     */
//                   ],
//                 )),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: 140,
//               height: 45,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: const BorderRadius.all(Radius.circular(50))),
//               child: ElevatedButton(
//                 onPressed: (isCommunityVisible && isCountryVisible)
//                     ? () {
//                         Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                             pageBuilder:
//                                 (context, animation, secondaryAnimation) {
//                               return Scaffold(
//                                 // Wrapping with Scaffold for app bar and other functionalities
//                                 body: your_Email_Phone(),
//                               );
//                             },
//                             transitionDuration: Duration(milliseconds: 1500),
//                             transitionsBuilder: (context, animation,
//                                 secondaryAnimation, child) {
//                               var begin = Offset(0.0, 1.0);
//                               var end = Offset.zero;
//                               var curve = Curves.easeOutQuart;

//                               var tween = Tween(begin: begin, end: end)
//                                   .chain(CurveTween(curve: curve));
//                               var offsetAnimation = animation.drive(tween);

//                               return SlideTransition(
//                                 position: offsetAnimation,
//                                 child: child,
//                               );
//                             },
//                           ),
//                         );
//                         print('selected');
//                       }
//                     : null,
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(50)),
//                   backgroundColor: Colors.white,
//                 ),
//                 child: Icon(Icons.forward,
//                     size: 30,
//                     color: (isCommunityVisible && isCountryVisible)
//                         ? Colors.pink
//                         : Color.fromARGB(223, 0, 0, 0)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//                       }),
     
//     );
//   }
// }



import 'package:icon_decoration/icon_decoration.dart';
import 'package:strava_clone/src/boot.dart';
import 'package:strava_clone/src/module/matrimonial/pages/drawers/drawer_Your_Name.dart';

import '../list/community.dart';
import '../list/country.dart';
import '../list/religion.dart';
import '../variables.dart';
import 'drawer_Your_Email_Phone.dart';

class your_religion extends StatefulWidget {
  @override
  State<your_religion> createState() => _your_religionState();
}

class _your_religionState extends State<your_religion>    {
  bool isDropdownOpened1 = false;
  bool isDropdownOpened2 = false;
  bool isDropdownOpened3 = false;
  bool isCommunityVisible = false;
  bool isCountryVisible = false;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         leading: IconButton(
    icon: Icon(Icons.arrow_back_sharp,color: Colors.pink,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => your_name()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        body:  LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints )
                      {
                       double inputWidth = constraints.maxWidth-50;
                        return   SingleChildScrollView(
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
                    color: Color.fromARGB(255, 207, 238, 226),
                    // border: Border.all(color: Colors.pink),

                    shape: BoxShape.circle),
                child: Stack(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 18, left: 10),
                      child: Icon(
                        Icons.person,
                        //  size: 45,
                        size: 43,
                        color: Color.fromARGB(255, 132, 228, 191),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18, left: 30),
                      child: Icon(
                        Icons.person,
                        //  size: 45,
                        size: 43,
                        color: Color.fromARGB(255, 132, 228, 191),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 19, left: 15),
                        child: DecoratedIcon(
                          icon: Icon(
                            size: 50,
                            Icons.person,
                            color: Color.fromARGB(255, 57, 223, 159),
                          ),
                          decoration: IconDecoration(
                              border:
                                  IconBorder(color: Colors.white, width: 3)),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
           Container(
            width: inputWidth,
             child: Text(
                  'Your religion',
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
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
              child: Container(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink,width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  isExpanded: true,
                  hint: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Religion',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  icon: Icon(isDropdownOpened1
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                  items: religion
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
                  value: selectedReligion,
                  onChanged: (String? value) {
                    setState(() {
                      selectedReligion = value;
                      isDropdownOpened1 = false;
                      isCommunityVisible = true;
                    });
                  },
                  onTap: () {
                    setState(() {
                      isDropdownOpened1 = !isDropdownOpened1;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      isDropdownOpened1 =
                          false; // Set dropdown to closed state when saved
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
                visible: isCommunityVisible,
                child: Column(
                  children: [
                    Container(
                      width: inputWidth,
                      child: Text(
                          'Community',
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
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink,width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Community',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        icon: Icon(isDropdownOpened2
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                        items: community
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: (item ==
                                                'Frequently used Communities' ||
                                            item == 'All Communities')
                                        ? TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black,
                                          )
                                        : TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedCommunity,
                        onChanged: (String? value) {
                          setState(() {
                            if (value != 'Frequently used Communities') {
                              selectedCommunity = value;
                              isCountryVisible = true;
                              isDropdownOpened2 = false;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            isDropdownOpened2 = !isDropdownOpened2;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            isDropdownOpened2 =
                                false; // Set dropdown to closed state when saved
                          });
                        },
                        selectedItemBuilder: (BuildContext context) {
                          return community.map<Widget>((String item) {
                            return Text(
                              item,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Visibility(
                visible: isCountryVisible,
                child: Column(
                  children: [
                  Container(
                    width: inputWidth,
                    child: Text(
                          'Living in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color.fromARGB(255, 240, 135, 170)),
                        ),
                  ),
                  
                    SizedBox(
                      height: 20,
                    ),
              
                       SizedBox(height: 20),
    //                Container(
    //                 height: 60,
    //                 width: inputWidth,
    //                 child:DropdownButton<String>(
    //   hint: Text('Select a country'),
    //   value: selectedCountry,
    //   onChanged: (String? value) {
    //     setState(() {
    //       selectedCountry = value;
    //     });
    //   },
    //   items: country.map((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Text(value),
    //     );
    //   }).toList(),
    // )
    //                )


                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink,width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Country',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        icon: Icon(isDropdownOpened3
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                        items: country1
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style:
                                        (item == 'Frequently used Countries' ||
                                                item == 'All Countries')
                                            ? TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.black,
                                              )
                                            : TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedCountry,
                        onChanged: (String? value) {
                          setState(() {
                            if (value != 'Frequently used Countries') {
                              selectedCountry = value;

                              isDropdownOpened3 = false;
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            isDropdownOpened3 = !isDropdownOpened3;
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            isDropdownOpened3 = false;
                          });
                        },
                        selectedItemBuilder: (BuildContext context) {
                          return country1.map<Widget>((String item) {
                            return Text(
                              item,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),

                  
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                onPressed: (isCommunityVisible && isCountryVisible)
                    ? () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Scaffold(
                                // Wrapping with Scaffold for app bar and other functionalities
                                body: your_Email_Phone(),
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
                                position: offsetAnimation,
                                child: child,
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
                    color: (isCommunityVisible && isCountryVisible)
                        ? Colors.pink
                        : Color.fromARGB(223, 0, 0, 0)),
              ),
            ),
          ],
        ),
      ),
    );
                      }),
     
    );
  }
}

