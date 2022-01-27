import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';
import 'package:note_prpject/shared/global_components/app_bar.dart';
import 'package:note_prpject/shared/global_components/custom_button.dart';
import 'package:note_prpject/shared/global_components/custom_text_filed.dart';

import 'package:note_prpject/shared/global_components/text_global.dart';

class AddUserScreen extends StatefulWidget {
  static const route = "CartScreen";
  @override
  AddUserScreenState createState() => AddUserScreenState();
}

class AddUserScreenState extends State<AddUserScreen> {
  @override

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SafeArea(
      child: Scaffold(
        appBar: appBar(context, "Add User",false),
        body:  Container(
          height: MediaQuery.of(context).size.height,
          color: AppColor.white,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
                children: [

                  CircleAvatar(
                    backgroundColor: Colors.greenAccent[400],
                    radius: 100,
                    child: Text(
                      'GeeksForGeeks',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ), //Text
                  ),
                  Txt("Edit Note",bold: FontWeight.bold,textAlign: TextAlign.left,size: 10.0,weight:
                  FontWeight.w800,color: AppColor.black,),
                  CustomTextForm(label: "UserName",controller: controllerName ,maxLines: 1,),
                  CustomTextForm(label: "Password", controller: controllerPassword,maxLines: 1,),
               CustomTextForm(label:  "Email", controller: controllerEmail,maxLines: 1,),
              //    customElevatedButtonWithIcon(title :Txt("Save",color: AppColor.white,bold: FontWeight.normal,),function: (){})



                ]),
          ),


        ),


      ),

    );
  }

}