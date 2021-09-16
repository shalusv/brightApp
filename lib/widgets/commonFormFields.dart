import 'package:bright_ui/datas/datas.dart';
import 'package:flutter/material.dart';

Widget buildTextField(TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: nameType,
    obscureText: false,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Provide a Name';
      } else if (value.length < 3 && value.length < 5) {
        return 'name must be between 3 and 5';
      }
      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: inputFieldBorderRadius,
        borderSide: BorderSide(
          width: 10,
          color: inputFieldColor,
        ),
      ),
      labelText: 'Name',
      hintText: 'Enter Name',
      // fillColor: inputFieldColorFilled,
      filled: true,
    ),
  );
}
