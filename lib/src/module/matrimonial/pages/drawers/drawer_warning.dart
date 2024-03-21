import 'package:strava_clone/src/boot.dart';

class warning extends StatefulWidget {
  @override
  State<warning> createState() => _warningState();
}

class _warningState extends State<warning> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double inputWidth = constraints.maxWidth - 50;
        return SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                    const SizedBox(
              height: 80,
            ),
            Center(
              child: CircleAvatar(
                radius: 56, //radius of avatar
              
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(53),
                    child: 
                        Image.asset(
                           
                               
                              'assets/images/persontab.jpg',
                            fit: BoxFit.cover,
                          )
                   
                  ),
                ),
              ),
            ),
                  SizedBox(
              height: 20,
            ),
            Text(
              'You have more than one',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 240, 135, 170)),
            ),
            Text(
              'Profile linked to the same',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 240, 135, 170)),
            ),
         
            Text(
              'Phone no.',
              style: TextStyle(color: Color.fromARGB(255, 240, 135, 170), fontSize: 20,),
            ),
            SizedBox(
              height: 50,
            ),
                      Container(
                width: inputWidth,
                 child: Text(
                        'Let us know why?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 240, 135, 170)),
                      ),
                           ),
                             const SizedBox(
                    height: 20,
                  ),
                   Container(
                    width: inputWidth,
                    height: 100,
                     child: TextFormField(
                                 // controller: _textController,
                                 // onChanged: _updateRemainingCharacters,
                                 cursorColor: Colors.pink,
                                 maxLines: 5,
                                 maxLength: 4000,
                                 decoration: InputDecoration(
                              
                                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.pink,
                                      width: 2)),
                   
                                 ),
                               
                               ),
                   ),

                   
                        const SizedBox(
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
               

                  print('selected');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                child: Text('Submit',style: TextStyle(color: Colors.pink),),
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
