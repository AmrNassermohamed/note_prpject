import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_prpject/constants/colors.dart';
import 'package:note_prpject/constants/key_words.dart';
import 'package:note_prpject/models/note_model.dart';
import 'package:note_prpject/provider/provider_note.dart';
import 'package:note_prpject/screen/edit_note/index.dart';
import 'package:note_prpject/shared/global_components/app_bar.dart';
import 'package:note_prpject/shared/global_components/custom_text_filed.dart';
import 'package:note_prpject/shared/global_components/progress.dart';
import 'package:note_prpject/shared/global_components/text_global.dart';
import 'package:note_prpject/provider/provider_user.dart';
import 'package:note_prpject/shared/navgaitor.dart';
import 'package:provider/provider.dart';
class NoteScreen extends StatefulWidget {
  static const route = "NoteScreen";
  @override
  NoteScreenState createState() => NoteScreenState();
}

class NoteScreenState extends State< NoteScreen> {


@override
  void initState() {
    // TODO: implement initState
  init();
  super.initState();

  }
final TextEditingController controller = TextEditingController();
  init() async {
    final validationServiceNote = Provider.of<ProviderNote>(context,listen: false);
    final validationServiceUser = Provider.of<ProviderUser>(context,listen: false);
    validationServiceUser.apiOrNot=KeyWords.apiOrNot;
    await  validationServiceUser.getAllUser();
    if(KeyWords.apiOrNot==true) {
      await validationServiceNote.getAllNoteApi();
    }else{
      await validationServiceNote.getAllNoteLocalDatabase();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationServiceNote = Provider.of<ProviderNote>(context,listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: appBarHome(context, ""),
            body:  Container(
              height: MediaQuery.of(context).size.height,
              color: AppColor.white,
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                    children: [
              Row(children: [
                InkWell(onTap: (){
validationServiceNote.showingFilter();

                }, child:Icon(Icons.menu,color: AppColor.blue)),
SizedBox(width: 10),
                InkWell(onTap: (){
if(validationServiceNote.showSearch==false){
  validationServiceNote.showingSearch();
}else{
print("ffpkfek");
validationServiceNote.filterList("text", controller.text);
}

                }, child:Icon(Icons.search,color: AppColor.blue,)),
    Consumer<ProviderNote>(
    builder: (context, provider, child) {
    if(provider.showSearch==true) {
      return Flexible(
          child: CustomTextFormSearch(
            controller: controller, maxLines: 1, label: 'search',)
      );
    }else{
      return SizedBox();
    }
    })

              ],),
    Consumer<ProviderNote>(
    builder: (context, provider, child) {
      if(provider.showFilter==true) {
        return Row(children: [
          Column(children: [
        for(int i=0;i<validationServiceNote.listFilter.length;i++)
          Txt(validationServiceNote.listFilter[i])
          ],)


        ],);
      }else{
        return SizedBox();
      }
    }),
                      Consumer<ProviderNote>(
                          builder: (context, provider, child) {
                            if (provider.listNoteState.hasData) {
                              if(provider.listNoteState.data!.isNotEmpty) {
                                return SubView();
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

            floatingActionButton:  FloatingActionButton(
                elevation: 0.0,
                child: new Icon(Icons.add,color: Colors.white,),
                backgroundColor: AppColor.blue,
                onPressed: (){
                  AppNavigator.navigateTo(context, EditNoteScreen(noteModel: NoteModel(userId: '', id: '', placeDateTime: '', text: 'ENTER YOUR NOTE'),add: true,));
                }
            )
        ),

        );
  }

}

class Item extends StatelessWidget {
  NoteModel noteModel;

  Item({Key? key, required this.noteModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(children: [
Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
 Expanded(child:  Txt(noteModel.text,bold: FontWeight.bold,textAlign: TextAlign.left,size: 10.0,weight:
  FontWeight.w800,color: AppColor.black,)),
  IconButton(onPressed: (){

AppNavigator.navigateTo(context, EditNoteScreen(noteModel: noteModel,add: false,));
  }, icon:Icon(Icons.edit,color: AppColor.grey,)),


],),
        Divider(color: AppColor.grey,thickness: 1,),
      ],),
    );
  }




}
class SubView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final validationService = Provider.of<ProviderNote>(context,listen: false);
    return  ListView.builder(

        shrinkWrap: true,
        itemCount: validationService.listNoteState.data!.length,
        itemBuilder: (BuildContext context,int index){
          return Item(noteModel:validationService.listNoteState.data![index]);
        }
    );
  }


}

