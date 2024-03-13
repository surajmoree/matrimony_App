import 'dart:convert';

import 'package:strava_clone/src/boot.dart';

import '../list/state.dart';

class Indian_state extends StatefulWidget {
  final Function(String) onSelectState;
  Indian_state({required this.onSelectState});
  @override
  State<Indian_state> createState() => _Indian_stateState();
}

class _Indian_stateState extends State<Indian_state> {
  List<String> states = [];
  List<String> filteredStates = [];

  @override
  void initState() {
    super.initState();
    states = extractStates(jsonText);
    filteredStates.addAll(states);
  }

  Widget build(BuildContext context) {
    //  List<String> states = extractStates(jsonText);

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
                    filterStates(value);
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
                //    itemCount: states.length,
                itemCount: filteredStates.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    //    title: Text(states[index]),
                    title: Text(filteredStates[index]),
                    onTap: () {
                      widget.onSelectState(filteredStates[index]);
                      Navigator.of(context).pop();
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  void filterStates(String query) {
    setState(() {
      filteredStates = states
          .where((state) => state.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  List<String> extractStates(String jsonText) {
    List<String> stateList = [];
    final jsonMap = json.decode(jsonText);
    final states = jsonMap['states'];

    for (var state in states) {
      stateList.add(state['state']);
    }
    return stateList;
  }
}
