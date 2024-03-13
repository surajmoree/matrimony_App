import 'dart:convert';

import 'package:strava_clone/src/boot.dart';

import '../list/sub_Community.dart';

class sub_cast extends StatefulWidget
{

  final Function(String) onSelectCast;
  sub_cast({required this.onSelectCast});
  @override
  State<sub_cast> createState() => _sub_castState();
}

class _sub_castState extends State<sub_cast> {
  List<String> subCast = [];
  List<String> filteredCast = [];

  @override
  void initState()
  {
    super.initState();
    subCast = extractCast(jsonCommunity);
    filteredCast.addAll(subCast);
   
  }
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:     Column(
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
                    'Select your sub-community',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 240, 135, 170)),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    filterdCast(value);
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
                itemCount: filteredCast.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    //    title: Text(states[index]),
                    title: Text(filteredCast[index]),
                    onTap: () {
                      widget.onSelectCast(filteredCast[index]);
                      Navigator.of(context).pop();
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  void filterdCast(String query)
  {
    setState(() {
       filteredCast = subCast.where((cast) => cast.toLowerCase().contains(query.toLowerCase())).toList();
    });

  }

  List<String> extractCast(String jsonCommunity)
  {
    List <String>castList =[];
    final jsonMap = json.decode(jsonCommunity);
    final cast = jsonMap['cast'];

    for(var castes in cast)
    {
      castList.add(castes);
    }
    return castList;
  }


}