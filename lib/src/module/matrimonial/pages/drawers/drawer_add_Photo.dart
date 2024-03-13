
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:strava_clone/src/boot.dart';

class your_Photo extends StatefulWidget
{
  @override
  State<your_Photo> createState() => _your_PhotoState();
}

class _your_PhotoState extends State<your_Photo> {
  ImagePicker imagePicker = ImagePicker();
  File? selectedImage;


  Future<void> getImageFromGallery () async
  {
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null)
    {
      setState(() {
        selectedImage = File(pickedImage.path);
      });

    }
  }

  
  // Future<void> _requestGalleryPermission() async {
  //   if (Platform.isAndroid) {
  //     final status = await imagePicker.requestPermission();
  //     if (status == Permission.camera || status == Permission.microphone) {
  //       await getImageFromGallery();
  //     } else {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text('Permission Required'),
  //             content: Text('This app needs access to your gallery to upload photos.'),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: Text('OK'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     }
  //   } else {
  //     // For iOS, you don't need to request permission explicitly.
  //     await getImageFromGallery();
  //   }
  // }



  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            CircleAvatar(
             
              child:  Image.asset('assets/images/female.png',),
            ),

            SizedBox(height: 20,),
            Text('Add your Photos', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 240, 135, 170)),),
            Text('to complete your Profile', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 240, 135, 170)),),
                      SizedBox(height: 4,),

                      Text('Photo privacy Controls available in Settings',style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 50,),

                                              Container(
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: ElevatedButton(
                // onPressed: requestGalleryPermission,
               onPressed:(){},
                // requestGallaryPermisson,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.white,
                ),
                child: Row(
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 5),
                      child: Icon(Icons.image,color: Colors.pink,),
                    ),
                    Text('Add from Gallary',style: TextStyle(color: Colors.pink),)
                  ],
                ),
              ),
            ),

            SizedBox(height: 20,),

            
                                              Container(
              width: 120,
              height: 35,
     
              child:Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5,right: 3),
                  child: Icon(Icons.camera_enhance,color: Colors.pink),
                ),
                Text('Use Camera',style: TextStyle(color: Colors.pink))
              ],)
            ),
           

            



            
            
          ],

        ),
      ),
    );
  }

  
}