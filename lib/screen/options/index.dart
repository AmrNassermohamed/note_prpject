import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';
import 'package:note_prpject/constants/key_words.dart';
import 'package:note_prpject/screen/note_screen/index.dart';
import 'package:note_prpject/shared/global_components/app_bar.dart';
import 'package:note_prpject/provider/provider_user.dart';
import 'package:provider/provider.dart';
import 'package:note_prpject/shared/global_components/text_global.dart';

class OptionsScreen extends StatefulWidget {
  static const route = "CartScreen";
  @override
  OptionsScreenState createState() => OptionsScreenState();
}

class OptionsScreenState extends State<OptionsScreen> {


  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<ProviderUser>(context,listen: false);
    // TODO: implement build
    return  WillPopScope(
        onWillPop: () async {
          var data = await
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => NoteScreen(),), (route) => false);
          return data;
        },



      child: SafeArea(
        child: Scaffold(
          appBar: appBar(context, "options",false),
          body:  Container(
            height: MediaQuery.of(context).size.height,
            color: AppColor.white,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                  children: [
Row(children: [
  Txt("Use Local Database",bold: FontWeight.bold,textAlign: TextAlign.left,size: 20.0,weight:
  FontWeight.w800,color: AppColor.grey,),
],),



  Row(children: [
      Expanded(
        child: Txt("instead of useing http using Local DateBase,please use Sqlite for this ",bold: FontWeight.bold,textAlign: TextAlign.left,size:15.0,weight:
        FontWeight.normal,color: AppColor.grey,),
      ),

      Consumer<ProviderUser>(
      builder: (context, provider, child) {
  return    Switch(
          value: validationService.apiOrNot,
          onChanged: (value) async {
            if(validationService.apiOrNot==false){
              validationService.apiOrNot=true;
              await  validationService.useLocalDataBase(validationService.apiOrNot);
            }else{
              validationService.apiOrNot=false;
              await  validationService.useLocalDataBase(validationService.apiOrNot);
            }
          },
          activeTrackColor: AppColor.blue,
          activeColor: AppColor.grey,
        );

      }),
  ],),






],)





                  ),
            ),


          ),




      ),
    );
  }

}