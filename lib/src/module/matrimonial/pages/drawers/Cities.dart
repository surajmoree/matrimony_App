import 'dart:convert';

import 'package:flutter/material.dart';

class cities extends StatefulWidget
{
    final String selectedState;
  final String jsonText;
    final Function(String) onSelectState;

 cities({required this.selectedState, required this.jsonText, required this.onSelectState,});

  @override
  State<cities> createState() => _citiesState();
}

class _citiesState extends State<cities> {
   late List<String> cities;
  late List<String> filteredCities;
  

    @override
  void initState() {
    super.initState();
    cities = extractCities(widget.selectedState, widget.jsonText);
    filteredCities = List.from(cities);
  }
  @override
  Widget build(BuildContext context) {
    List<String> cities = extractCities(widget.selectedState, widget.jsonText);

    return Scaffold(
  
      body:
       Column(
        children: [
                 Container(
            padding: EdgeInsets.all(20),
            height: 180,
            width: MediaQuery.of(context).size.width * 1.0,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    'Select state you live in',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 135, 170)),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    filterCities(value);
                  },
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 240, 135, 170),
                          fontSize: 18),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 240, 135, 170),
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredCities[index]),
                  onTap: () {
  widget.onSelectState(filteredCities[index]);
  Navigator.of(context).pop();
},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

    void filterCities(String query) {
    setState(() {
      filteredCities = cities
          .where((city) =>
              city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


  List<String> extractCities(String selectedState, String jsonText) {
    List<String> cityList = [];
    final jsonMap = json.decode(jsonText);
    final states = jsonMap['states'];

    for (var state in states) {
      if (state['state'] == selectedState) {
        cityList.addAll(state['districts'].cast<String>());
        break;
      }
    }
    return cityList;
  }
}
  
