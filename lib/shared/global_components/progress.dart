import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';




class Progress extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: CircularProgressIndicator(

        color:AppColor.black,
      ),
    );
  }

}