import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:strava_clone/src/boot.dart';

import '../list/qualification.dart';
import 'drawer_Income.dart';
import 'drawer_Marital_Status.dart';

class your_Qualification extends StatefulWidget {
  @override
  State<your_Qualification> createState() => _your_QualificationState();
}

class _your_QualificationState extends State<your_Qualification>with TickerProviderStateMixin {
   late AnimationController _controller;
  late Animation<double> _animation;

    @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Reduced animation speed
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 0.4, // 40% of the screen width
    ).animate(_controller);

    // Start the animation when the page is opened
    _controller.forward();
  }


  void showQualificationOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.fromLTRB(28, 330, 28, 0),
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: qualification.map((option) {
                    return ListTile(
                      title: Text(option),
                      onTap: () {
                        setState(() {
                          selectedQuali = option;
                        });
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
         leading: IconButton(
    icon: Icon(Icons.arrow_back_sharp,color: Colors.pink,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  maritalStatus()));
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:Column(children: [
                  SizedBox(
            height: 4, // Height of the line
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Row(
                  children: [
                    Expanded(
                      flex: (_animation.value * 100).toInt(), // Convert to percentage and use as flex value
                      child: Container(
                        color: Color.fromARGB(255, 74, 154, 211),  // Change this to your desired color
                      ),
                    ),
                    Expanded(
                     flex: ((1 - _animation.value) * 100).toInt(),
// Remaining percentage as flex value
                      child: Container(),
                    ),
                  ],
                );
              },
            ),
          ),
            Expanded(
              child: LayoutBuilder(
                    builder: (BuildContext content, BoxConstraints constraints) {
                  double inputWidth = constraints.maxWidth - 50;
                  return SingleChildScrollView(
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
                        color: Color.fromARGB(255, 186, 212, 230),
                        // border: Border.all(color: Colors.pink),
                  
                        shape: BoxShape.circle),
                    child: Icon(
                      FontAwesomeIcons.graduationCap,
                      //  size: 45,
                      size: 43,
                      color: Color.fromARGB(255, 74, 154, 211),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 35),
                  child: Text(
                    'Great! Few more details',
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
                      'Highest qualification',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 240, 135, 170)),
                    ),
              ),
              
                const SizedBox(
                  height: 20,
                ),
                                     InkWell(
             onTap: showQualificationOption,
                 child: Container(
              width: inputWidth,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: selectedQuali.isNotEmpty ? Colors.pink : Colors.grey, width: 2)),
                              child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                                 child: Text(selectedQuali.isNotEmpty
                              ? selectedQuali
                              : 'Your highest qualification'),
                          ),
                        )
               
                    ),
               ),
            
               
                  const SizedBox(
                  height: 20,
                ),
                if (selectedQuali.isNotEmpty)
                  Column(
                    children: [
                       Container(
              width: inputWidth,
               child: Text(
                            'College',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color.fromARGB(255, 240, 135, 170)),
                          ),
                       ),
               
                  const SizedBox(
                  height: 20,
                ),
                 
                      Container(
                        width: inputWidth,
                        child: TextFormField(
                          //    controller: emailController,
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
                              labelText: "College you attended",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.pink,
                                      width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return Scaffold(
                                    // Wrapping with Scaffold for app bar and other functionalities
                                    body: your_Income(),
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
              ],
                      ),
                    ),
                  );
                }),
            ),
      ],)

     

    );
  }
}




