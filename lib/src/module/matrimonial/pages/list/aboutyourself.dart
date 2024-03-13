//String initialText = 'I am a Masters in Engineering. I have been an active student throughout my academic years. At present, I work as an andropid app developer. In my personal life, I believe in simple living and high thinking. Someone who belives in building a relationship with a strong foundation of respect, trust and friendship would be perfect for me. I am glad my profile caught your eye.';


import 'package:flutter/material.dart';

class EditableContainer extends StatefulWidget {
  @override
  _EditableContainerState createState() => _EditableContainerState();
}

class _EditableContainerState extends State<EditableContainer> {
  TextEditingController _textController = TextEditingController();
  int _remainingCharacters = 4000;
  String initialText =
      'I am a Masters in Engineering. I have been an active student throughout my academic years. At present, I work as an andropid app developer. In my personal life, I believe in simple living and high thinking. Someone who belives in building a relationship with a strong foundation of respect, trust and friendship would be perfect for me. I am glad my profile caught your eye.';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: initialText);
    _updateRemainingCharacters(initialText);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _updateRemainingCharacters(String newText) {
    setState(() {
      _remainingCharacters = 4000 - newText.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: 
 
     
    
         
          TextFormField(
              controller: _textController,
              onChanged: _updateRemainingCharacters,
              maxLines: 6,
              maxLength: 4000,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide(color: Colors.blue))

              ),
            
            ),
     
 
   

       
    );
  }
}

