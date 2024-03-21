import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:strava_clone/src/boot.dart';

import '../variables.dart';
import 'drawer_Varify_Contact_Detail.dart';

class your_Photo extends StatefulWidget {
  //   final String selectedGender;
  // const your_Photo({super.key, required this.selectedGender});
  @override
  State<your_Photo> createState() => _your_PhotoState();
}

class _your_PhotoState extends State<your_Photo> with SingleTickerProviderStateMixin {
 
  ImagePicker picker = ImagePicker();
  File? gallaryFile;
    late AnimationController _animationController;
  late Animation<double> _animation;
 @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
      reverseDuration: Duration(milliseconds: 2500),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startBlinkAnimation() {
    _animationController.forward(from: 0.0);
  }



  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            GestureDetector(
          onTap: () {
            // Handle gallery image selection here
            // For demonstration, let's simulate selecting an image
            setState(() {
              gallaryFile = File('path_to_selected_image');
            });
            _startBlinkAnimation();
          },
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value * 0.1 + 0.9, // Adjust the scaling as needed
                child: child,
              );
            },
            child: CircleAvatar(
              radius: 56, //radius of avatar
              backgroundColor: gallaryFile == null ? Colors.green : Colors.pink, // Default background color
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(53),
                  child: gallaryFile == null
                      ? Image.asset(
                          selectedGender == 'Male'
                              ? 'assets/images/male.jpg'
                              : 'assets/images/female.jpg',
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                         gallaryFile!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
        ),
      

     
            

            SizedBox(
              height: 20,
            ),
            Text(
              'Add your Photos',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 240, 135, 170)),
            ),
            Text(
              'to complete your Profile',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 240, 135, 170)),
            ),
            SizedBox(
              height: 4,
            ),

            Text(
              'Photo privacy Controls available in Settings',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 50,
            ),

            Container(
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                // onPressed: requestGalleryPermission,
                onPressed: () {
                  showPicker(context: context);
                },
                // requestGallaryPermisson,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 5),
                      child: Icon(
                        Icons.image,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      'Add Image',
                      style: TextStyle(color: Colors.pink),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 80,
            ),

            InkWell(
              onTap: () {
                   showModalBottomSheet(
                   
                     shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
  ),
  backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return
          SafeArea(
                child: Wrap(
              children: [
                Container(
                  height: 550,
                  decoration: BoxDecoration(
                   
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                    child: Center(
                      child: Column(
                        children: [
                              SizedBox(
              height: 50,
            ),

            CircleAvatar(
                radius: 50, //radius of avatar
                backgroundColor: Colors.red ,
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(47),
                    child: 
                        Image.asset(selectedGender == 'Male' ? 'assets/images/male.jpg' : 'assets/images/female.jpg',
                            fit: BoxFit.cover)
                    
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30,),
                child: Text('No Photos?',    style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 240, 135, 170)),),
              ),
                Padding(
                padding: const EdgeInsets.only(top: 5,),
                child: Text('''We wouldn't recommend it!  ''',    style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 240, 135, 170)),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15,),
                child: Text('We have noticed that Members do not', style: TextStyle(color: Colors.grey),),
              ),
              Text('respond to Profiles without Photos', style: TextStyle(color: Colors.grey),),

              Padding(
                padding: const EdgeInsets.only(top: 20,),
                child: Container(
                  width: 200,
                  child: Divider(color:  Colors.grey,)),
              ),
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                              Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                onPressed: () {
                   Navigator.pop(context);
       

                  print('selected');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                child: Text('Not Now',style: TextStyle(color: Colors.grey),),
              ),
            ),

                   Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                onPressed: () {
                   showPicker(context: context);
                     
       

                  print('select');
                },
            
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                child: Text('Add Photo',style: TextStyle(color: Colors.pink),),
              ),
            ),

                ],
              )
                        ],
                      ),
                    ),
                )
             
             
              ],
            ));
       
        });
              },
              child: Text('Do it later...',style: TextStyle(color: Colors.pink,fontSize: 16),)),
          
          ],
        ),
      ),
    );
  }

  void showPicker({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
        });
  }

  Future getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilepick = pickedFile;
    setState(() {
      if (xfilepick != null) {
        gallaryFile = File(pickedFile!.path);
        print('image selected');
            Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Scaffold(
                          // Wrapping with Scaffold for app bar and other functionalities
                          body: verify_contact(),
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

      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Nothing is selected')));
      }
    });
  }

  

}
