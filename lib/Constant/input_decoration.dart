import 'package:flutter/material.dart';

InputDecoration getInputDecoration(String hintText, IconData iconData) {
  return InputDecoration(
    counter: const Offstage(),

    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Colors.white, width: 2),
    ),
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Color(0xFFF65054)),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      borderSide: BorderSide(color: Color(0xFFF65054)),
    ),
    filled: true,
    prefixIcon: Icon(
      iconData,
    ),
    hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
  );
}