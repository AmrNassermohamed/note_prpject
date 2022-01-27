import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';
import 'package:note_prpject/provider/provider_note.dart';


import 'package:provider/provider.dart';



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


class CustomTextFormSearch extends StatelessWidget {

  CustomTextFormSearch (
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
    return Container(
    height: 40,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
autofocus: true,
        decoration: InputDecoration(

          suffix: InkWell(
            child: Icon(Icons.clear,color: AppColor.grey,),
          onTap: (){
print("'gg");
final validationServiceNote = Provider.of<ProviderNote>(context,listen: false);
validationServiceNote.restoreData();
validationServiceNote.showingSearch();

            },
          ),labelText: label,

          border: OutlineInputBorder(),

        ),
      ),
    );
  }
}