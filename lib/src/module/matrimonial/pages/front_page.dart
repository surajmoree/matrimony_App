import 'package:flutter/material.dart';
import 'package:strava_clone/src/module/matrimonial/pages/animation/textAnimation.dart';
import 'package:strava_clone/src/module/matrimonial/pages/drawers/drawer_Your_Name.dart';

// ignore: camel_case_types
class frontPage extends StatefulWidget {
  const frontPage({super.key});
  @override
  State<frontPage> createState() => _frontPageState();
}

// ignore: camel_case_types
class _frontPageState extends State<frontPage> {
  int selectedContainerIndex = -1;
  int selectedContainerIndex1 = -1;

  void your_name_drawer(BuildContext context)
  {
       Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return _buildDrawer(context);
      },
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(10.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child:child,
        );
      },
    ));

  }

    Widget _buildDrawer(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // 80% width of the screen
      child: Drawer(
        // child: Text('hekkii',style: TextStyle(color: Colors.amber),),
        child: your_name(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
      
          child: Column(
            children: [
               const SizedBox(
                height: 130,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                    color: selectedContainerIndex == 0 ||
                            selectedContainerIndex == 1 ||
                            selectedContainerIndex == 2 ||
                            selectedContainerIndex == 3 ||
                            selectedContainerIndex == 4 ||
                            selectedContainerIndex == 5 ||
                            selectedContainerIndex == 6
                        ? Color.fromARGB(223, 0, 0, 0)
                        : Color.fromARGB(255, 240, 134, 169),
                    shape: BoxShape.circle),
                child: Icon(
                  Icons.person,
                  size: 45,
                  //  color: Color.fromARGB(255, 238, 16, 90),
                  color: selectedContainerIndex == 0 ||
                          selectedContainerIndex == 1 ||
                          selectedContainerIndex == 2 ||
                          selectedContainerIndex == 3 ||
                          selectedContainerIndex == 4 ||
                          selectedContainerIndex == 5 ||
                          selectedContainerIndex == 6
                      ? Color.fromARGB(255, 245, 21, 5)
                      : Colors.pink,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 1.00,
                  child: buildMarquee(),
                ),
              ),
              Container(
             
          
                width: MediaQuery.of(context).size.width * 1.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          buildCheckboxContainer(0, 'Myself'),
                          SizedBox(
                             width: 60,
                          ),
                          buildCheckboxContainer(1, 'My Son'),
                          SizedBox(
                            width: 5,
                          ),
                     
                        ],
                      ),
                    ),
      
                    Padding(
                          padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                            SizedBox(
                            width: 10,
                          ),
      
                               buildCheckboxContainer(2, 'My Daughter'),
                          SizedBox(
                            width: 60,
                          ),
                          buildCheckboxContainer(3, 'My Brother'),
                       
                        ],
                      ),
                    ),
      
                         Padding(
                         padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
      
                              buildCheckboxContainer(4, 'My Sister'),
                          SizedBox(
                            width: 60,
                          ),
                          buildCheckboxContainer(5, 'My Friend'),
                 
              
                        ],
                      ),
                    ),
                    Padding(
                         padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                            SizedBox(
                            width: 10,
                          ),
                           buildCheckboxContainer(6, 'My Relative'),          
                        ],
                      ),
                    ),
      
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (selectedContainerIndex == 0 ||
                  selectedContainerIndex == 5 ||
                  selectedContainerIndex == 6)
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Column(
                    children: [
                      Text(
                        'Your Gender',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 240, 135, 170)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 100,
                        width: 300,
                        child: Row(
                          children: [
                            buildCheckboxContainer1(0, 'Male'),
                            SizedBox(
                              width: 10,
                            ),
                            buildCheckboxContainer1(1, 'Female'),
                          ],
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: ElevatedButton(
                          onPressed: selectedContainerIndex1 == 0 ||
                                  selectedContainerIndex1 == 1
                              ? () {
                                your_name_drawer(context);
                           
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: Colors.white,
                          ),
                          child: Icon(Icons.forward,
                              size: 30,
                              color: selectedContainerIndex1 == 0 ||
                                      selectedContainerIndex1 == 1
                                  ? Colors.pink
                                  : Color.fromARGB(223, 0, 0, 0)),
                        ),
                      )
                    ],
                  ),
                ),
              if (selectedContainerIndex == 1 ||
                  selectedContainerIndex == 2 ||
                  selectedContainerIndex == 3 ||
                  selectedContainerIndex == 4)
                   Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: ElevatedButton(
                          onPressed: () {
                                  print('selected');
                                },
      
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            backgroundColor: Colors.white,
                          ),
                          child: Icon(Icons.forward,
                              size: 30,
                              color:  Colors.pink
                                ),
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCheckboxContainer(int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedContainerIndex = index;
        });
      },
      child: Container(
        width: 140,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: [
            if (selectedContainerIndex == index)
              Checkbox(
                activeColor: Colors.red,
                checkColor: Colors.white,
                shape: const CircleBorder(),
                value: true,
                onChanged: (bool? value) {},
              ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCheckboxContainer1(int index1, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedContainerIndex1 = index1;
        });
      },
      child: Container(
        width: 140,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: Row(
          children: [
            if (selectedContainerIndex1 == index1)
              Checkbox(
                activeColor: Colors.red,
                checkColor: Colors.white,
                shape: const CircleBorder(),
                value: true,
                onChanged: (bool? value) {},
              ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
