import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';
import 'package:note_prpject/constants/key_words.dart';
import 'package:note_prpject/models/note_model.dart';
import 'package:note_prpject/models/user_model.dart';
import 'package:note_prpject/provider/provider_note.dart';
import 'package:note_prpject/provider/provider_user.dart';
import 'package:note_prpject/shared/global_components/app_bar.dart';
import 'package:note_prpject/shared/global_components/custom_text_filed.dart';

import 'package:note_prpject/shared/global_components/progress.dart';
import 'package:note_prpject/shared/global_components/text_global.dart';
import 'package:provider/provider.dart';
final TextEditingController controller = TextEditingController(text: "Your initial value");
class EditNoteScreen extends StatefulWidget {
  static const route = "EditNoteScreen";
  NoteModel noteModel;
  bool add;

  EditNoteScreen({required this.noteModel,required this.add});
  @override
  EditNoteScreenState createState() => EditNoteScreenState();
}

class EditNoteScreenState extends State<EditNoteScreen> {


  @override
  void initState() {
    // TODO: implement initState
   init();


    super.initState();
  }

  init() async {
    final validationServiceUser = Provider.of<ProviderUser>(context,listen: false);
  await  validationServiceUser.getAllUser();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

 return  SafeArea(
   child: Scaffold(
       appBar: appBar(context,widget.add==true? "Edit Note":"Add Note",true),
       body:  Container(
         height: MediaQuery.of(context).size.height,
         color: AppColor.white,
         padding: const EdgeInsets.all(10),
         child: SingleChildScrollView(
           child: Column(
               children: [
                CustomTextForm(label: widget.noteModel.text.toString(),maxLines: 5, controller: controller,),
SizedBox(height: 10,),

                 Consumer<ProviderUser>(
                     builder: (context, provider, child) {
                       if (provider.listUserState.hasData) {
                         if(provider.listUserState.data!.isNotEmpty) {
                           return DropDownButton(noteModel: widget.noteModel,add: widget.add,);
                         }else{
                           return     Txt("title",bold: FontWeight.bold,textAlign: TextAlign.left,size: 10.0,weight:
                           FontWeight.w800,color: AppColor.black,);
                         }
                       }else{
                         return Progress();
                       }})







               ]),
         ),


       ),


   ),

 );
  }

}
class DropDownButton extends StatelessWidget {
NoteModel noteModel;
bool add;
 DropDownButton({required this.noteModel,required this.add});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationServiceUser = Provider.of<ProviderUser>(context,listen: false);
    final validationServiceNote = Provider.of<ProviderNote>(context,listen: false);
    return  Container(
      height: 60.0,
      child: InputDecorator(

        decoration: const InputDecoration(labelText: "Assign to User",border: OutlineInputBorder(),),
        child: DropdownButtonHideUnderline(

          child: DropdownButton<UserModel>(

            items: validationServiceUser.listUserState.data!.map((value) => DropdownMenuItem(

              child: Text(value.userName),
              value: value,
            ))
                .toList(),
            onChanged: (s ) {
              if(add==true) {
                if (KeyWords.apiOrNot == true) {
                  validationServiceNote.addNoteApi(NoteModel(id: noteModel.id,
                      text: controller.text,
                      placeDateTime: DateTime.now().toString(),
                      userId: s!.id.toString()));
                } else {
                  validationServiceNote.addNoteLocalDateBase(
                      NoteModel(id: noteModel.id,
                          text: controller.text,
                          placeDateTime: DateTime.now().toString(),
                          userId: s!.id.toString()));
                }
              }
               else{
    if(KeyWords.apiOrNot==true) {
    validationServiceNote.updateNoteApi(NoteModel(id: noteModel.id,
    text: controller.text,
    placeDateTime: DateTime.now().toString(),
    userId: s!.id.toString()));
    }else{
    validationServiceNote.updateNoteLocalDateBase(NoteModel(id: noteModel.id,
    text: controller.text,
    placeDateTime: DateTime.now().toString(),
    userId: s!.id.toString()));
              }
              }
},
            isExpanded: false,
            value: validationServiceUser.listUserState.data!.first,
          ),
        ),
      ),
    );
  }


}