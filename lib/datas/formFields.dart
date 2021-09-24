import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(
    String hintText, IconData icon, String labelText) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: Colors.blue[600],
    ),
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 25,
        color: Colors.green,
      ),
    ),
    hintText: hintText,
    labelText: labelText,
  );
}
