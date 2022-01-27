import 'package:flutter/cupertino.dart';
import 'package:note_prpject/data/note_data.dart';
import 'package:note_prpject/models/note_model.dart';
import 'package:note_prpject/models/provider_general_state.dart';
import 'package:note_prpject/services/services_sqlite.dart';
class ProviderNote extends ChangeNotifier {
  late ProviderGeneralState<
      List <NoteModel>> listNoteState = ProviderGeneralState(
      waiting: true);
bool showSearch=false;
bool showFilter=false;
late String key="text";
late List <NoteModel> history;
restoreData(){
  listNoteState.data=history;
  notifyListeners();
}

  filterList(key,value){
    print(value);
    List<NoteModel> chosen = [];
    switch(key){
      case "text":
      listNoteState.data= listNoteState.data!.where((element) =>
            element.text.toLowerCase().contains(value.toLowerCase()))
            .toList();
         notifyListeners();
        break;
      case "name":
    listNoteState.data =  listNoteState.data!.where((element) => element.userId==value).toList();
        break;
    }
    notifyListeners();

  }

List <String> listFilter=["text","user"];
  getAllNoteApi() async {
    List <NoteModel> getNote = [];
    getNote = await NoteData().getAllNotes();
    print("////////////");
    print(getNote);
    history=getNote;
    listNoteState =
        ProviderGeneralState(data: getNote, hasData: true);
notifyListeners();
  }

showingSearch(){
    if(showSearch==false){
      showSearch=true;
      notifyListeners();
    }else{
      showSearch=false;
      notifyListeners();
    }

}

showingFilter(){

  if(showFilter==false){
    showFilter=true;
    notifyListeners();
  }else{
    showFilter=false;
    notifyListeners();
  }
}


  getAllNoteLocalDatabase() async {
    List <NoteModel> getNote = [];
    getNote = await NoteData().getAllNotesLocalDateBase();
    print("////////////");
    print(getNote);
    history=getNote;
    listNoteState =
        ProviderGeneralState(data: getNote, hasData: true);
    notifyListeners();
  }

updateNoteApi (NoteModel noteModel) async {
try {
  await NoteData().updateNote(noteModel);
}catch(ex){
  rethrow;
}
}

addNoteApi(NoteModel noteModel) async {
  try {
    await NoteData().insertNote(noteModel);
  }catch(ex){
    rethrow;
  }
}
updateNoteLocalDateBase(NoteModel noteModel) async {
  try {
    await NoteData().updateToNoteLocalDataBase(noteModel);
  }catch(ex){
    rethrow;
  }
  }
  addNoteLocalDateBase(NoteModel noteModel) async {
    try {
      await NoteData().addToNoteLocalDataBase(noteModel);
    }catch(ex){
      rethrow;
    }
  }



}