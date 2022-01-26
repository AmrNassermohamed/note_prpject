import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Txt extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight weight;
  final FontWeight bold;
  final TextAlign textAlign;
  final double size;
  Txt(this.text,
      { this.color = Colors.black,
        this.weight = FontWeight.normal,
        this.size = 16,
        this.textAlign = TextAlign.left, this.bold=FontWeight.bold});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(0),
      child:  AutoSizeText(text

        ,textAlign: textAlign ,style: GoogleFonts.outfit
          (
          color: color,
          fontWeight:bold,
          fontSize:size,


        ),maxLines: 2,),
    );
  }
}