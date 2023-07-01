import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved});

  final String hint;
  final int maxLines;

  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLines: maxLines,
      validator: (value) {
        //if the value null then true then return 'Field is required (becuse isEmpty return null if true and if cond. ask bool value)
        if (value?.isEmpty ?? true) {
          return 'Field is requried';
        } else {
          //there's no problem
          return null;
        }
      },
      //change the cursor color
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: kPrimaryColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        //i want the color be the primary color
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      //if color == null use the white if not use the color
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
