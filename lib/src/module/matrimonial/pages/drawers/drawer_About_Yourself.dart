import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strava_clone/src/boot.dart';

import '../list/aboutyourself.dart';
import 'drawer_add_Photo.dart';

class about_Yourself extends StatefulWidget
{
  @override
  State<about_Yourself> createState() => _about_YourselfState();
}

class _about_YourselfState extends State<about_Yourself> {

//   bool isEditingText = false;
//  TextEditingController editingController = TextEditingController() ;
//  //String initialText = 'swswh';
// @override
//   void initState()
// {
//   super.initState();
//   editingController = TextEditingController(text: initialText);

// }

// @override
// void dispose() {
//   editingController.dispose();
//   super.dispose();
// }
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints)
      {
        double inputWidth = constraints.maxWidth - 50;
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                      const SizedBox(
                height: 60,
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 233, 200, 162),
                      // border: Border.all(color: Colors.pink),
      
                      shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.filePen,
                      //  size: 45,
                      size: 40,
                      color: Color.fromARGB(255, 209, 119, 15),
                    ),
                  ),
                ),
              ),
                   Padding(
                padding: const EdgeInsets.only(left: 10, top: 35),
                child: Text(
                  'We have added a short description',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 240, 135, 170)),
                ),
              ),
                      Padding(
                padding: const EdgeInsets.only(left: 18, top: 5),
                child: Text(
                  'about you',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 240, 135, 170)),
                ),
              ),

                   const SizedBox(
                height: 50,
              ),
             Container(
              width: inputWidth,
               child: Text(
                    'About yourself',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 240, 135, 170)),
                  ),
             ),
             
              const SizedBox(
                height: 5,
              ),
           Container(
            width: inputWidth,
            height: 160,
            child: EditableContainer()),
               const SizedBox(
                height: 20,
              ),

                      Container(
               width: inputWidth,
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 233, 233),
                borderRadius: BorderRadius.circular(5),
               
              ),
              child: CheckboxListTile(
                
        
                activeColor: Color.fromARGB(255, 240, 135, 170),
                //    tileColor: Color.fromARGB(255, 240, 135, 170),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Do not add my Profile to Shaadi.com affiliated Matchmaking services'),
              
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 10.0 : 1.0;
                  });
                },
              ),
            ),
              
                const SizedBox(
                height: 50,
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
                          body: your_Photo(),
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

               const SizedBox(
                height: 20,
              ),


            
   
         
              

              ],
            ),
          ),
        );
      }),
    );
  }
}