import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';



class CustomTextForm extends StatefulWidget {
  final TextInputType inputType;
  final String label;
  final int? maxLength;
  Color colorBorder;
  final Function? onTap;
  final double padding;
  final double height;
  final int maxLines;
  final ValueChanged<bool>? valid;
  final String? setInitial;
  final icon;
  final String formControlName;
  final bool obscureText;
  final Widget? suffixIcon;
  final BorderSide? borderSide;

  CustomTextForm({
    this.inputType = TextInputType.text,
    this.setInitial,
    this.maxLength,
    this.valid,
    this.obscureText = false,
    this.height = 50,
    required this.label,
    // this.svgColor = const Color(0xffBFBFBF),
    this.padding = 5,
    this.icon,
    this.colorBorder= AppColor.grey,
    required this.formControlName,
    this.onTap,
    this.maxLines = 1,
    this.suffixIcon,
    this.borderSide,
  });

  @override
  _CustomTextFormState createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {

   return TextFormField(
     maxLines: widget.maxLines,
      initialValue: 'Input text',
      decoration: InputDecoration(
        labelText: widget.label,

        border: OutlineInputBorder(),

      ),
    );
  }
}