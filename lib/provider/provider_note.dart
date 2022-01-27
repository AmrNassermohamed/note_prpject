import 'package:flutter/cupertino.dart';
import 'package:note_prpject/data/note_data.dart';
import 'package:note_prpject/models/note_model.dart';
import 'package:note_prpject/models/provider_general_state.dart';
import 'package:note_prpject/services/services_sqlite.dart';
class ProviderNote extends ChangeNotifier {
  late ProviderGeneralState<
      List <NoteModel>> listNoteState = ProviderGeneralState(
      waiting: true);

  getAllNoteApi() async {
    List <NoteModel> getNote = [];
    getNote = await NoteData().getAllNotes();
    print("////////////");
    print(getNote);
    listNoteState =
        ProviderGeneralState(data: getNote, hasData: true);
notifyListeners();
  }



  getAllNoteLocalDatabase() async {
    List <NoteModel> getNote = [];
    getNote = await NoteData().getAllNotesLocalDateBase();
    print("////////////");
    print(getNote);
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