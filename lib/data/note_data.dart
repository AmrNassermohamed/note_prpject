
import 'dart:convert';

import 'package:note_prpject/models/note_model.dart';
import 'package:note_prpject/services/services_handler.dart';
import 'package:note_prpject/services/services_sqlite.dart';

class NoteData {

  clearNote() async {
    try {
      var response = await ServicesHandler().
      postService(
          urlSuffix: "notes/clear",
          returnBody: true).then((value) => value);
      return response;
    } catch (ex) {
      rethrow;
    }
  }



  getAllNotesLocalDateBase() async {
    try {
      List <NoteModel> allNote=[];
      allNote= await SQLiteDbProvider().getAllProducts();
      return allNote;
    }catch(ex){
      rethrow;
    }
  }
  updateNote(NoteModel noteModel) async {
    try {

      var response = await ServicesHandler().
      postService(
          urlSuffix: "notes/update",
          requestBody:  jsonEncode({
            "Id": noteModel.id,
            "Text":noteModel.text,
            "UserId": noteModel.userId,


          }),
          returnBody:false).then((value) => value);
      return response;
    } catch (ex) {
      rethrow;
    }

  }


  insertNote(NoteModel noteModel) async {
    try {
      var response = await ServicesHandler().
      postService(
          urlSuffix: "notes/insert",
          requestBody:  jsonEncode({
            "Text":noteModel.text,
            "UserId": noteModel.userId,

          }),
          returnBody: true).then((value) => value);
      return response;
    } catch (ex) {
      rethrow;
    }

  }

getAllNotes() async {
  List<NoteModel> listNotes=[];
     var response = await ServicesHandler().
  getService(urlSuffix: "notes/getall", ex: true);
     print(response);
  response.forEach((v) {
   NoteModel noteModel = NoteModel.fromJson(v);
    listNotes.add(noteModel);
  });
  return listNotes;

}
  addToNoteLocalDataBase(NoteModel note) async {
    try{
      await SQLiteDbProvider().insert(note);
    }catch(ex){
      rethrow;
    }
  }

  updateToNoteLocalDataBase(NoteModel note) async {
    try{
      await SQLiteDbProvider().update(note);
    }catch(ex){
      rethrow;
    }

  }

  dropToNoteLocalDataBase() async {
    try{
      await SQLiteDbProvider().deleteAll();
    }catch(ex){
      rethrow;
    }
  }



  deleteToNoteLocalDataBase(int id) async {
    try{
      await SQLiteDbProvider().delete(id);
    }catch(ex){
      rethrow;
    }
  }
}

