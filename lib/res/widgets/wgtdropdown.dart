import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  MyDropDown({
    required this.subjects,
    required this.labelText,
  });
  final List<String> subjects;
  final String labelText;
  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
//  final List<String> subjects = ["Computer Science", "Biology", "Math"];

  String selectedSubject = "Math";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        value: selectedSubject,
        items: widget.subjects.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem(
            child: Text(value),
            value: value,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedSubject = value as String;
          });
        },
        icon: Icon(Icons.arrow_drop_down),
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 20),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            labelText: widget.labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
