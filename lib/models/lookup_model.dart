class LookUpModel {
late String intrestText;
late int id;

LookUpModel({required this.id,required this.intrestText});

factory LookUpModel.fromJson(Map<String, dynamic> json){
return LookUpModel(id: json["id"], intrestText: json["intrestText"]);
}
}