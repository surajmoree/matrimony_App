
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strava_clone/src/boot.dart';
import 'package:strava_clone/src/module/matrimonial/pages/drawers/State.dart';
import 'package:strava_clone/src/module/matrimonial/pages/drawers/Sub_Cast.dart';

import '../list/state.dart';
import 'Cities.dart';
import 'drawer_Marital_Status.dart';
import 'drawer_Your_Email_Phone.dart';

class your_profile extends StatefulWidget {
  @override
  State<your_profile> createState() => _your_profileState();
}

class _your_profileState extends State<your_profile>
    with TickerProviderStateMixin {
  String? selectedState;
  String? selectedCity;
  String? selectedCast;
  late final bool value;
  late final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
         leading: IconButton(
    icon: Icon(Icons.arrow_back_sharp,color: Colors.pink,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  your_Email_Phone()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        body: 
             LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints )
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
                    color: Color.fromARGB(197, 230, 173, 192),
                    // border: Border.all(color: Colors.pink),

                    shape: BoxShape.circle),
                child: Icon(FontAwesomeIcons.locationDot,
                    //  size: 45,
                    size: 43,
                    color: Color.fromARGB(200, 218, 89, 132)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          Container(
            width: inputWidth,
            child: Text(
                  'State',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 240, 135, 170)),
                ),
          ),
          
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                print('print');
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Indian_state(
                        onSelectState: (state) {
                          setState(() {
                            this.selectedState = state;
                          });
                        },
                      );
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
                width: inputWidth,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    selectedState != null
                        ? Text(selectedState!)
                        : Text(
                            'State you live in'), // Render selected state if available, otherwise render default text
                    //  Text(selectedState),
                    //  SizedBox(width: 140,),
                    // Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
             
            SizedBox(
              height: 20,
            ),
      Container(
        width: inputWidth,
        child: Text(
                  'City',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 240, 135, 170)),
                ),
      ),
        
    
           
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (selectedState != null) {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return cities(
                          selectedState: selectedState!,
                          jsonText: jsonText,
                          onSelectState: (city) {
                            setState(() {
                              selectedCity = city;
                            });
                          },
                        );
                      },
                    ),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
                width: inputWidth,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    selectedCity != null
                        ? Text(selectedCity!)
                        : Text('City you live in'),
                  ],
                ),
              ),
            ),
              
            SizedBox(
              height: 20,
            ),
         Container(
          width: inputWidth,
           child: Text(
                  'Sub-community',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 240, 135, 170)),
                ),
         ),
             
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return sub_cast(onSelectCast: (cast) {
                        setState(() {
                          this.selectedCast = cast;
                        });
                      });
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all()),
                width: inputWidth,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    selectedCast != null
                        ? Text(selectedCast!)
                        : Text('Your Sub-community'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
        
            SizedBox(
              height: 30,
            ),
            Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Scaffold(
                          // Wrapping with Scaffold for app bar and other functionalities
                         body: maritalStatus(),
                  //     body:your_Qualification (),
                        );
                      },
                      transitionDuration: Duration(milliseconds: 1500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(0.0, 1.0);
                        var end = Offset.zero;
                        var curve = Curves.easeOutQuart;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: animation.drive(Tween(
                                  begin: Offset(0.0, 1.0), end: Offset.zero)
                              .chain(CurveTween(curve: Curves.easeOutQuart))),
                          child: child,
                          // position: offsetAnimation,
                          // child: child,
                        );
                      },
                    ),
                  );

                  print('selected');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                child: Icon(Icons.forward, size: 30, color: Colors.pink),
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
