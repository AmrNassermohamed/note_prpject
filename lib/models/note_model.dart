class NoteModel {
late String text;
late String placeDateTime;
late String userId;
late String id;
static final columns = ["id","text","placeDateTime","userId"];
NoteModel({required this.id,required this.text,required this.placeDateTime,required this.userId});
factory NoteModel.fromJson(Map<String, dynamic> json){
  return NoteModel(id: json["id"], text:json["text"],
      placeDateTime: json["placeDateTime"], userId: json["userId"].toString());
}

factory NoteModel.fromMap(data){
return NoteModel(id:data["id"].toString() , text: data["text"], placeDateTime: data["placeDateTime"], userId: data["userId"]);

}
Map<String, dynamic> toMap() => {
  "id": id,
  "text":text,
  "placeDateTime": placeDateTime,
   "userId":userId,
};
}