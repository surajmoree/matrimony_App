import 'package:flutter/material.dart';

import 'components/addCarRent.dart';
import 'components/addCarSale.dart';
import 'components/newRequest/newRequest.dart';

class CarPage extends StatefulWidget {
  const CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        title: Text(
          'Add Car',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Card(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Free'),
                        ),
                      ],
                    ),
                    Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PropertySale()));
                            },
                            child: Text('For Sale'))),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Card(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Free'),
                        ),
                      ],
                    ),
                    Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                            onPressed: () {
                              //carRent
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => carRent()));
                            },
                            child: Text('For Rent')))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Card(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Free'),
                        ),
                      ],
                    ),
                    Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => newRequest()));
                            },
                            child: Text('New Request')))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
