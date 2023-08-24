import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
  {super.key,
  required this.hint,
  this.onChanged,});
  final String hint;

  final Function(String)? onChanged;
  //final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: onChanged,
        // onSaved: onSaved,
        // validator: (value) {
        //   if (value?.isEmpty ?? true) {
        //     return 'Field is required ';
        //   } else {
        //     return null;
        //   }
        // },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hint,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide:  BorderSide(
          color: color ?? Colors.black,
        ));
  }
}