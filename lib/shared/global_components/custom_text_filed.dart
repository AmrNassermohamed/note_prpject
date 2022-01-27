import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';






class CustomTextForm extends StatelessWidget {

  CustomTextForm(
      {
        Key? key,
       required this.label,
        required this.controller,
        required this.maxLines})
      : super(key: key);
  final TextEditingController controller;
  final int maxLines;
  final String label;
  int type = 0;

  late FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      controller: controller,
      maxLines: maxLines,
     
      decoration: InputDecoration(
        labelText: label,

        border: OutlineInputBorder(),

      ),
    );
  }
}