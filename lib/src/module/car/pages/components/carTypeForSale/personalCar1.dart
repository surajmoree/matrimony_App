import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strava_clone/src/boot.dart';

import '../../../dropDown/cityList.dart';
import '../../../dropDown/colorList.dart';

class ResidentialForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  
   final Function(String) onButtonSelected;
   final Function(String?) onSelectedCity;
   final Function(String) onSelectedYear;
   final Function(String?) onSelectedColor;
   final Function(File) onSelectedImage;
  final TextEditingController verifyCarController;
  
  
  final TextEditingController locationController;
  final TextEditingController carNameController;
  final TextEditingController carDescriptionController;
  final TextEditingController pricectrl;
  final TextEditingController tyreController;
  
  final TextEditingController accidentalController;
 
  
 
  String selectedPropertyType = 'Personal';
  ResidentialForm(
      {super.key,
      required this.formKey,
  
      required this.locationController,
      required this.carNameController,
      required this.carDescriptionController,
      required this.pricectrl,
      required this.verifyCarController,

      required this.tyreController,
      required this.accidentalController,
   required this.onButtonSelected, required this.onSelectedCity, required this.onSelectedYear, required this.onSelectedColor, required this.onSelectedImage});
  @override
  State<ResidentialForm> createState() => _ResidentialFormState();
}

class _ResidentialFormState extends State<ResidentialForm> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  String selectedButton = '';
  String selectValue1 = '';
  String selectValue2 = '';
   String selectValue3 = '';
     String? selectedCity; 
       DateTime _selectedYear = DateTime.now();
        String showYear = 'Year';
        String? selectedColor;
  void updateSelectedVeriCarValue(String newValue)
{

  setState(() {
    selectValue1 = newValue;
  });

}
  void varifiedCarDialog(Function(String) onSelectValueChanged) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              elevation: 16,
              child: Container(
                height: 220,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade500),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(child: Text('Status')),
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: Text('YES'),
                              value: 'YES',
                              groupValue: selectValue1,
                              onChanged: (value) {

                                  setState(() {
                                     selectValue1 = value.toString();
                                  });

                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: Text('NO'),
                              value: 'NO',
                              groupValue:  selectValue1,
                              onChanged: (value) {

                                  setState(() {
                                     selectValue1 = value.toString();
                                  });

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 55,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancle')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  onSelectValueChanged(selectValue1);
                                 widget.verifyCarController.text = selectValue1;

                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void updateSelectedTyreValue(String newValue)
{

setState(() {
 selectValue2 = newValue;
});
}
  void showTyreDialog(Function(String) onSelectValueChanged) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              elevation: 16,
              child: Container(
                height: 220,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(158, 158, 158, 1)),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(child: Text('Status')),
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: Text('NEW'),
                              value: 'NEW',
                              groupValue:selectValue2,
                              onChanged: (value) {

                                  setState(() {
                                  selectValue2 = value.toString();
                                  });

                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: Text('OLD'),
                              value: 'OLD',
                              groupValue:selectValue2,
                              onChanged: (value) {

                                  setState(() {
                                 selectValue2 = value.toString();
                                  });

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 55,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancle')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  onSelectValueChanged(selectValue2);
                                 widget.tyreController.text =selectValue2;

                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  void updateSelectedAccidentalValue(String newValue)
  {

    setState(() {
     selectValue3 = newValue;
    });

  }

  void showAccidentalDialog(Function(String) onSelectValueChanged) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              elevation: 16,
              child: Container(
                height: 220,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade500),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(child: Text('Status')),
                    ),
                    Container(
                      height: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: Text('YES'),
                              value: 'YES',
                              groupValue: selectValue3,
                              onChanged: (value) {

                                  setState(() {
                                    selectValue3 = value.toString();
                                  });

                              },
                            ),
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: Text('NO'),
                              value: 'NO',
                              groupValue:  selectValue3,
                              onChanged: (value) {

                                  setState(() {
                                     selectValue3 = value.toString();
                                  });

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 55,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancle')),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  onSelectValueChanged(selectValue3);
                                 widget.accidentalController.text =  selectValue3;

                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok')),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

 selectYear(context) async {
    print("Calling date picker");
    // Store a reference to the context when the dialog is shown
    BuildContext dialogContext;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Year"),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 10, 1),
              lastDate: DateTime(2025),
              initialDate: DateTime.now(),
              selectedDate: _selectedYear,
              onChanged: (DateTime dateTime) {
                print(dateTime.year);

                setState(() {
                  _selectedYear = dateTime;
                  showYear = "${dateTime.year}";
                });
                widget.onSelectedYear(showYear);
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
  final picker = ImagePicker();
  bool _load = false;
  late File image;
    Future getImageFromGallery(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

      setState(() {
        if (pickedFile != null) {
          image = File(pickedFile.path);
          _load = true;
        } else {
          print('No image selected.');
        }
      });
      widget.onSelectedImage(image);

  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height + 700,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double inputWidth = constraints.maxWidth - 20;
        return Form(
          key: widget.formKey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.97,
                height: 40,
                child: Row(
                  children: const [
                    Icon(Icons.directions_car_outlined),
                    SizedBox(width: 10),
                    Text('Brand',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 55,
                    width: inputWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                selectedButton = 'Hyundai';
                                  });
                                  widget.onButtonSelected( selectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                       selectedButton == 'Hyundai'
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Hyundai',
                                  style: TextStyle(
                                      color:selectedButton == 'Hyundai'
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                 selectedButton = 'Kia';
                                });
                                widget.onButtonSelected(selectedButton);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                     selectedButton == 'Kia'
                                          ? Colors.blue
                                          : Colors.white),
                              child: Text(
                                'Kia',
                                style: TextStyle(
                                    color: selectedButton == 'Kia'
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: inputWidth,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButton = 'Daewoo';
                                  });
                                  widget.onButtonSelected(selectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == 'Daewoo'
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Daewoo',
                                  style: TextStyle(
                                      color: selectedButton == 'Daewoo'
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                 selectedButton = 'Renault';
                                });
                                widget.onButtonSelected(selectedButton);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      selectedButton == 'Renault'
                                          ? Colors.blue
                                          : Colors.white),
                              child: Text(
                                'Renault',
                                style: TextStyle(
                                    color: selectedButton == 'Renault'
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: inputWidth,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                   selectedButton = 'SsangYong';
                                  });
                                  widget.onButtonSelected(selectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == 'SsangYong'
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'SsangYong',
                                  style: TextStyle(
                                      color:
                                          selectedButton == 'SsangYong'
                                              ? Colors.white
                                              : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButton = 'Alpheon';
                                });
                                widget.onButtonSelected(selectedButton);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      selectedButton == 'Alpheon'
                                          ? Colors.blue
                                          : Colors.white),
                              child: Text(
                                'Alpheon ',
                                style: TextStyle(
                                    color: selectedButton == 'Alpheon'
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: inputWidth,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButton = 'Proto';
                                  });
                                  widget.onButtonSelected(selectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == 'Proto'
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Proto',
                                  style: TextStyle(
                                      color: selectedButton == 'Proto'
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                 selectedButton = 'Asia Motors';
                                });
                                widget.onButtonSelected(selectedButton);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      selectedButton == 'Asia Motors'
                                          ? Colors.blue
                                          : Colors.white),
                              child: Text(
                                'Asia Motors',
                                style: TextStyle(
                                    color:
                                        selectedButton == 'Asia Motors'
                                            ? Colors.white
                                            : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: inputWidth,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButton = 'volvo';
                                  });
                                  widget.onButtonSelected(selectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        selectedButton == 'volvo'
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'volvo',
                                  style: TextStyle(
                                      color: selectedButton == 'volvo'
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                        Container(
                          width: inputWidth / 2 - 10,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 216, 214, 214)),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                 selectedButton = 'Genesis';
                                });
                                widget.onButtonSelected(selectedButton);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      selectedButton == 'Genesis'
                                          ? Colors.blue
                                          : Colors.white),
                              child: Text(
                                'Genesis',
                                style: TextStyle(
                                    color: selectedButton == 'Genesis'
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                    InkWell(
                      onTap: () {
                        varifiedCarDialog(updateSelectedVeriCarValue);
                      },
                      child: Container(
                        height: 60,
                        width: inputWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.black)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.directions_car_filled),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Text('Varified Car')),
                            SizedBox(width: 110),
                            // Text();
                            Text('${selectValue1}'),

                            IconButton(
                                onPressed: () {
                                   varifiedCarDialog(updateSelectedVeriCarValue);
                                },
                                icon: Icon(Icons.arrow_drop_down)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                   SizedBox(
                      width: inputWidth,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        validator: (String? name) {
                          if (name!.isEmpty) {
                            return "Please Enter city";
                          }
                          return null;
                        },
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Icon(
                              Icons.location_city,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Select city',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        items: items
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
                        value:selectedCity,
                        onChanged: (String? value) {
                          setState(() {
                          selectedCity = value;
                          });
                          widget.onSelectedCity(selectedCity);
                   
                     
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                   SizedBox(
                      width: inputWidth,
                      child: TextFormField(
                        controller: widget.locationController,
                        validator: (String? name) {
                          if (name!.isEmpty) {
                            return "Please Enter location";
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            labelText: "Enter location",
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(Icons.directions_car_outlined),
                          SizedBox(width: 10),
                          Text('Car Details',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                   SizedBox(
                      width: inputWidth,
                      child: TextFormField(
                        controller:widget.carNameController,
                        validator: (String? name) {
                          if (name!.isEmpty) {
                            return "Please Enter Car name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            labelText: "Car Name",
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: inputWidth,
                      child: TextFormField(
                        controller:widget.carDescriptionController,
                        validator: (String? name) {
                          if (name!.isEmpty) {
                            return "Please Enter car description";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            labelText: "Car description",
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: inputWidth,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (String? name) {
                          if (name!.isEmpty) {
                            return "Please Enter car price";
                          }
                          return null;
                        },
                        controller:widget.pricectrl,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.label_off_outlined),
                            suffix: Text(
                              'INR',
                              style: TextStyle(color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            labelText: "Price*",
                            hintStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 65,
                      width: inputWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              selectYear(context);
                            },
                            child: Container(
                              width: inputWidth / 2 - 10,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 15),
                                  Text(showYear),
                                  SizedBox(
                                    width: inputWidth / 2 - 100,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      selectYear(context);
                                    },
                                    child: const Icon(
                                      Icons.calendar_month,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // tyre

                          InkWell(
                            onTap: () {
                              showTyreDialog(updateSelectedTyreValue);
                            },
                            child: Container(
                              width: inputWidth / 2 - 10,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(child: Text('Tyre')),
                                  Text('${selectValue2}'),
                                  IconButton(
                                      onPressed: () {
                                        showTyreDialog(updateSelectedTyreValue);
                                      },
                                      icon: Icon(Icons.arrow_drop_down)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 60,
                      width: inputWidth,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // accidental
                          InkWell(
                            onTap: () {
                              showAccidentalDialog(updateSelectedAccidentalValue);
                            },
                            child: Container(
                              width: inputWidth / 2 - 10,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 15),
                                  Expanded(child: Text('Accidental')),
                                  Text('${selectValue3}'),
                                  InkWell(
                                      onTap: () {
                                        showAccidentalDialog(updateSelectedAccidentalValue);
                                      },
                                      child: Icon(Icons.arrow_drop_down)),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            height: 60,
                            width: inputWidth / 2 - 10,
                            decoration: BoxDecoration(
                                //  border: Border.all(),
                                //   borderRadius: BorderRadius.circular(2),
                                ),
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1))),
                              validator: (String? name) {
                                if (name!.isEmpty) {
                                  return "Please Enter city";
                                }
                                return null;
                              },
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Icon(
                                    Icons.car_repair,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Select color',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              items: colors
                                  .map((String item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color:
                                                Color.fromARGB(255, 51, 50, 50),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ))
                                  .toList(),
                              value: selectedColor,
                              onChanged: (String? value) {

                                setState(() {
                                  selectedColor = value;
                                });
                                widget.onSelectedColor(selectedColor);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.97,
                      child: Row(
                        children: [
                          Icon(Icons.image),
                          SizedBox(width: 10),
                          Text('Car Images',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    _load
                        ? Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(15.0),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                height: 200,
                                width: 200,
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'No Image Selected',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ElevatedButton(
                      onPressed: () {
                        getImageFromGallery(ImageSource.gallery);
                      },
                      child: Text('Upload Picture'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 20,
                      width: 320,
                      child: Center(
                          child: Text(
                        'Please select car images',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                ],
              ),


            ],
          ),
        );
      }),
    );
  }
}

