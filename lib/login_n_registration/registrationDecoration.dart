import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hinttext) {

  // decoration: InputDecoration(
  //                           fillColor: Colors.white,
  //                           border: InputBorder.none,
  //                           hintText: 'Enter your password',
  //                           hintStyle: TextStyle(color: Colors.grey),
  //                         ),
  return InputDecoration(
    hintText: hinttext,
    fillColor: Colors.white,
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.grey),
  );
}