import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../dropDown/cityList.dart';
import '../../../dropDown/colorList.dart';

class transportCar extends StatefulWidget
{
  final GlobalKey<FormState> formkey;
  final Function(String) onButtonSelected;
    final Function(String?) onselectedCity;
  final Function(String) onSelectedYear;
  final Function(String?) onSelectedColor;
  final Function(File) onSelectedImage;
  final TextEditingController rentFrequencyCtrl;
  final TextEditingController locationController;
  final TextEditingController carNameController;
  final TextEditingController carDescriptionController;
    final TextEditingController pricectrl;
   final  TextEditingController tyrefieldController ;
  final TextEditingController accidentalController ;

  const transportCar({super.key, required this.formkey, required this.onButtonSelected, required this.onselectedCity, required this.onSelectedYear, required this.onSelectedColor, required this.onSelectedImage, required this.rentFrequencyCtrl, required this.locationController, required this.carNameController, required this.carDescriptionController, required this.pricectrl, required this.tyrefieldController, required this.accidentalController});
  @override
  State<transportCar> createState() => _transportCarState();
}

class _transportCarState extends State<transportCar> {
    String SelectedButton ="";
      String selectFrequencyValue = '';
    String? selectedCity; 
    DateTime _selectedYear = DateTime.now();
    String showYear = 'Year';
     String selectTyreValue = '';
      String selectAccidentalValue = '';
       String? selectedColor;
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final picker = ImagePicker();
  bool _load = false;
    void updateSelectedValue(String newValue) {
    setState(() {
      selectFrequencyValue = newValue;
    });
  }
 @override
  void initState() {
    super.initState();

  }
  void RentFreqShowDialog(Function(String) onSelectValueChanged) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Dialog(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 16,
              insetPadding: EdgeInsets.fromLTRB(28, 150, 28, 350),
              child: Container(
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
                      height: 240,
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade500),
                              ),
                              color: Colors.white,
                            ),
                            child: RadioListTile(
                              title: Text('Yearly'),
                              value: 'Yearly',
                              groupValue: selectFrequencyValue,
                              onChanged: (value) {
                                setState(() {
                                  selectFrequencyValue = value.toString();
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
                              title: Text('Monthly'),
                              value: 'Monthly',
                              groupValue: selectFrequencyValue,
                              onChanged: (value) {
                                setState(() {
                                  selectFrequencyValue = value.toString();
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
                              title: Text('Weekly'),
                              value: 'Weekly',
                              groupValue: selectFrequencyValue,
                              onChanged: (value) {
                                setState(() {
                                  selectFrequencyValue = value.toString();
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
                              title: Text('Daily'),
                              value: 'Daily',
                              groupValue: selectFrequencyValue,
                              onChanged: (value) {
                                setState(() {
                                  selectFrequencyValue = value.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancle')),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 80,
                            child: ElevatedButton(
                                onPressed: () {
                                  onSelectValueChanged(selectFrequencyValue);
                                 widget.rentFrequencyCtrl.text = selectFrequencyValue;

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
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

    void updateSelectedTyreValue(String newValue) {
    setState(() {
      selectTyreValue = newValue;
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
                              groupValue:selectTyreValue,
                              onChanged: (value) {

                                  setState(() {
                                 selectTyreValue = value.toString();
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
                              groupValue:selectTyreValue,
                              onChanged: (value) {

                                  setState(() {
                                selectTyreValue = value.toString();
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
                                  onSelectValueChanged(selectTyreValue);
                                 widget.tyrefieldController.text =selectTyreValue;

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
            selectAccidentalValue = newValue;
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
                              groupValue:  selectAccidentalValue,
                              onChanged: (value) {

                                  setState(() {
                                    selectAccidentalValue = value.toString();
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
                              groupValue:  selectAccidentalValue,
                              onChanged: (value) {

                                  setState(() {
                                     selectAccidentalValue = value.toString();
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
                                  onSelectValueChanged( selectAccidentalValue);
                                 widget.accidentalController.text =  selectAccidentalValue;

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
void dispose() {
  // Cancel any timers or animations here
  // For example:
 
  super.dispose();
}
  Widget build(BuildContext context)
  {
    return    SizedBox(
      height: MediaQuery.of(context).size.height + 700,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double inputWidth = constraints.maxWidth - 20;
        return Form(
          key:  widget.formkey,
          child: Container(
              child: Column(
            children: <Widget>[
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
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
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
                                      color: const Color.fromARGB(
                                          255, 216, 214, 214)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                       SelectedButton = "Force Motors";
                                    });
                                    widget.onButtonSelected( SelectedButton);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                           SelectedButton == "Force Motors"
                                              ? Colors.blue
                                              : Colors.white),
                                  child: Text(
                                    'Force Motors',
                                    style: TextStyle(
                                        color:  SelectedButton == "Force Motors"
                                            ? Colors.white
                                            : Colors.black),
                                  ))),
                          Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                     SelectedButton = "Mahindra";
                                  });
                                  widget.onButtonSelected( SelectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:  SelectedButton == "Mahindra"
                                        ? Colors.blue
                                        : Colors.white),
                                child: Text(
                                  'Mahindra',
                                  style: TextStyle(
                                      color: SelectedButton == "Mahindra"
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
                    Container(
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
                                      color: const Color.fromARGB(
                                          255, 216, 214, 214)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                       SelectedButton = "Asia MotorWorks";
                                    });
                                    widget.onButtonSelected( SelectedButton);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                           SelectedButton == "Asia MotorWorks"
                                              ? Colors.blue
                                              : Colors.white),
                                  child: Text(
                                    'Asia MotorWorks',
                                    style: TextStyle(
                                        color:  SelectedButton == "Asia MotorWorks"
                                            ? Colors.white
                                            : Colors.black),
                                  ))),
                          Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                   SelectedButton = "BharatBenz";
                                });
                                widget.onButtonSelected( SelectedButton);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:  SelectedButton == "BharatBenz"
                                      ? Colors.blue
                                      : Colors.white),
                              child: Text(
                                'BharatBenz',
                                style: TextStyle(
                                    color:  SelectedButton == "BharatBenz"
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
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
                                      color: const Color.fromARGB(
                                          255, 216, 214, 214)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                       SelectedButton = "Tata Motors";
                                    });
                                    widget.onButtonSelected( SelectedButton);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                           SelectedButton == "Tata Motors"
                                              ? Colors.blue
                                              : Colors.white),
                                  child: Text(
                                    'Tata Motors',
                                    style: TextStyle(
                                        color:  SelectedButton == "Tata Motors"
                                            ? Colors.white
                                            : Colors.black),
                                  ))),
                          Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                     SelectedButton = "SML Isuzu";
                                  });
                                  widget.onButtonSelected( SelectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:  SelectedButton == "SML Isuzu"
                                        ? Colors.blue
                                        : Colors.white),
                                child: Text(
                                  'SML Isuzu',
                                  style: TextStyle(
                                      color: SelectedButton == "SML Isuzu"
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
                    Container(
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
                                      color: const Color.fromARGB(
                                          255, 216, 214, 214)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      SelectedButton = "Hindustan Motors";
                                    });
                                    widget.onButtonSelected( SelectedButton);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                           SelectedButton == "Hindustan Motors"
                                              ? Colors.blue
                                              : Colors.white),
                                  child: Text(
                                    'Hindustan Motors',
                                    style: TextStyle(
                                        color:
                                             SelectedButton == "Hindustan Motors"
                                                ? Colors.white
                                                : Colors.black),
                                  ))),
                          Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                     SelectedButton = "Asia Motors";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                         SelectedButton == "Asia Motors"
                                            ? Colors.blue
                                            : Colors.white),
                                child: Text(
                                  'Asia Motors',
                                  style: TextStyle(
                                      color:  SelectedButton == "Asia Motors"
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: inputWidth / 2 - 10,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 216, 214, 214)),
                                borderRadius: BorderRadius.circular(5)),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                     SelectedButton = "volvo";
                                  });
                                  widget.onButtonSelected( SelectedButton);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:  SelectedButton == "volvo"
                                        ? Colors.blue
                                        : Colors.white),
                                child: Text(
                                  'volvo',
                                  style: TextStyle(
                                      color:  SelectedButton == "volvo"
                                          ? Colors.white
                                          : Colors.black),
                                ))),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth - 20;
                      return InkWell(
                        onTap: () {
                           RentFreqShowDialog(updateSelectedValue);
                        },
                        child: Container(
                          height: 60,
                          width: inputWidth,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.black)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 18,
                              ),
                            
                      
                               Expanded(child: Text('Rent Frequency')),
                              SizedBox(width: 110),
                              // Text();
                              Text('${selectFrequencyValue}'),
    
                              IconButton(
                                  onPressed: () {
                                     RentFreqShowDialog(updateSelectedValue);
                                  },
                                  icon: const Icon(Icons.arrow_drop_down)),
                            ],
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth - 20;
                      return Container(
                        width: inputWidth,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
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
                              const Icon(
                                Icons.location_city,
                                color: Colors.black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Expanded(
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
                          value: selectedCity,
                          onChanged: (String? value) {
                            setState(() {
                              selectedCity = value;
                            });
                            widget.onselectedCity(selectedCity);
                      
                          },
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 16,
                    ),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double inputWidth = constraints.maxWidth -
                            20; // Adjust padding and margins
    
                        return Container(
                          width: inputWidth,
                          child: TextFormField(
                            controller:widget.locationController,
                            validator: (String? name) {
                              if (name!.isEmpty) {
                                return "Please Enter location";
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
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
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.directions_car_outlined),
                          const SizedBox(width: 10),
                          const Text('Car Details',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double inputWidth = constraints.maxWidth -
                            20; // Adjust padding and margins
    
                        return Container(
                          width: inputWidth,
                          child: TextFormField(
                            controller:widget.carNameController,
                            validator: (String? name) {
                              if (name!.isEmpty) {
                                return "Please Enter car name";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
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
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double inputWidth = constraints.maxWidth -
                            20; // Adjust padding and margins
    
                        return Container(
                          width: inputWidth,
                          child: TextFormField(
                            controller:widget.carDescriptionController,
                            validator: (String? name) {
                              if (name!.isEmpty) {
                                return "Please Enter car description";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
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
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double inputWidth = constraints.maxWidth -
                            20; // Adjust padding and margins
    
                        return Container(
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
                            decoration: const InputDecoration(
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
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth - 20;
                      return Container(
                        height: 60,
                        width: inputWidth,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                selectYear(context);
                              },
                              child: Container(
                                height: 60,
                                width: inputWidth / 2 - 10,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 15,
                                    ),
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
                            InkWell(
                              onTap: () {
                                showTyreDialog(updateSelectedTyreValue);
                              },
                              child: Container(
                                height: 60,
                                width: inputWidth / 2 - 10,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 15),
                                      Expanded(child: Text('Tyre')),
                                    Text('${selectTyreValue}'),
                                    InkWell(
                                        onTap: () {
                                          showTyreDialog(updateSelectedTyreValue);
                                        },
                                        child: const Icon(Icons.arrow_drop_down)),
                                    const SizedBox(width: 8),
    
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 8,
                    ),
                    LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double inputWidth = constraints.maxWidth - 20;
                      return Container(
                        height: 60,
                        width: inputWidth,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                              showAccidentalDialog(updateSelectedAccidentalValue);
                              },
                              child: Container(
                                height: 60,
                                width: inputWidth / 2 - 10,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 15),
                                    const Expanded(child: Text('Accidental')),
                                    Text('${selectAccidentalValue}'),
                                    InkWell(
                                        onTap: () {
                                          showAccidentalDialog(updateSelectedAccidentalValue);
                                        },
                                        child: const Icon(Icons.arrow_drop_down)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: inputWidth / 2 - 10,
                              decoration: const BoxDecoration(
                                  //  border: Border.all(),
                                  //   borderRadius: BorderRadius.circular(2),
                                  ),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle:
                                        const TextStyle(color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1))),
                                validator: (String? name) {
                                  if (name!.isEmpty) {
                                    return "Please enter color";
                                  }
                                  return null;
                                },
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    const Icon(
                                      Icons.car_repair,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Expanded(
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
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
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
                            )
                          ],
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.image),
                          const SizedBox(width: 10),
                          const Text('Car Images',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    const SizedBox(
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
                                child: const Center(
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
                      child: const Text('Upload Picture'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 20,
                      width: 320,
                      child: const Center(
                          child: Text(
                        'Please select car images',
                        style: TextStyle(color: Colors.black),
                      )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          )),
        );
      }),
    );
  }
}