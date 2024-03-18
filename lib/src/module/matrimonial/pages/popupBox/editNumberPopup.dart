import 'package:strava_clone/src/boot.dart';

import '../variables.dart';

class editNumberBox extends StatefulWidget {
  @override
  State<editNumberBox> createState() => _editNumberBoxState();
}

class _editNumberBoxState extends State<editNumberBox> {
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 125, top: 10),
            child: Text(
              'Edit Mobile No.',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double inputWidth = constraints.maxWidth - 20;
            return Container(
              width: inputWidth,
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text('Select a country'),
                value: selectedCountry,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue;
                  });
                },
                items: countryList.map<DropdownMenuItem<String>>(
                    (Map<String, String> country) {
                  return DropdownMenuItem<String>(
                    value: getCombinedValue(country),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: getCombinedValue(country),
                          groupValue: selectedCountry,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCountry = newValue;
                            });
                          },
                        ),
                        Text(getCombinedValue(country)),
                      ],
                    ),
                  );
                }).toList(),
                icon: Visibility(
                    visible: false, child: Icon(Icons.arrow_downward)),
              ),
            );
          }),
        ],
      ),
    );
  }
}
