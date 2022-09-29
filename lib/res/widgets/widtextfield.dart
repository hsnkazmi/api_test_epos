import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField<T> extends StatelessWidget {
  final String labelText;
  final String validatemessage;
  final T value;
  final TextInputType txt_type;
  final TextEditingController controller;

  //final ValueChanged<String?> onChanged;

  const MyTextField(
      {required this.value,
      required this.labelText,
      this.validatemessage = "can not be empty",
      required this.txt_type,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      // padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validatemessage;
          } else {
            return null;
          }
        },
        keyboardType: txt_type,

        //autofocus: true,

        // keyboardType: const TextInputType.numberWithOptions(decimal: false),
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        //   TextInputFormatter.withFunction(
        //     (oldValue, newValue) => newValue.copyWith(
        //       text: newValue.text.replaceAll('.', ','),
        //     ),
        //   ),
        // ],
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontSize: 20),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            labelText: labelText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
