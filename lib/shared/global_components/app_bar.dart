import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';
import 'package:note_prpject/screen/options/index.dart';
import 'package:note_prpject/shared/global_components/text_global.dart';

import '../navgaitor.dart';


appBarHome(BuildContext context,title){
  return AppBar(
   // leading: const Icon(Icons.menu,color: AppColor.white,),
    //centerTitle: true,
    backgroundColor: AppColor.blue,
    title:    Txt("Notes",bold: FontWeight.bold,textAlign: TextAlign.left,size: 20.0,weight:
    FontWeight.w800,color: Colors.white,),
    actions:  [
      GestureDetector(
        onTap:(){
          print("////////////////");
        //  AppNavigator.navigateTo(context, SearchScreen());
        },
        child:const Padding(padding: EdgeInsets.all(10.0),child:
        Icon(Icons.person_add,color:AppColor.white,)),
      ),
      GestureDetector(
        onTap:(){
          print("////////////////");
          //  AppNavigator.navigateTo(context, SearchScreen());
        },
        child:const Padding(padding: EdgeInsets.all(10.0),child:
        Icon(Icons.settings_outlined,color:AppColor.white,)),
      ),
      GestureDetector(
        onTap:(){
          AppNavigator.navigateTo(context, OptionsScreen());
          //  AppNavigator.navigateTo(context, SearchScreen());
        },
        child:const Padding(padding: EdgeInsets.all(10.0),child:
        Icon(Icons.menu,color:AppColor.white,)),
      )

    ],
  ) ;


}




appBar(BuildContext context,title,bool actions){
  return AppBar(
     title:
     Container(
       child: Row(children: [

         const Icon(Icons.arrow_back,color: AppColor.white,),
         SizedBox(width: 10,),
         Txt(title,bold: FontWeight.bold,textAlign: TextAlign.left,size: 15.0,weight:
         FontWeight.w800,color: Colors.white,),
       ],),
     ),

    //centerTitle: true,

    backgroundColor: AppColor.blue,
    actions:  [
    actions==true?  GestureDetector(
        onTap:(){

          //  AppNavigator.navigateTo(context, SearchScreen());
        },
        child:const Padding(padding: EdgeInsets.all(10.0),child:
        Icon(Icons.note_add,color:AppColor.white,)),
      ):SizedBox(),


    ],
  ) ;


}

