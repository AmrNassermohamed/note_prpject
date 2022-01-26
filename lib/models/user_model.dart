class UserModel {
  late String userName;
  late String password;
  late String email;
  //late String imageAsBase64 ;
  late String intrestId;
  late   String id;

 UserModel({required this.password,required this.userName,required this.email ,required this.id,required this.intrestId});
  factory UserModel.fromJson(Map<String, dynamic> json){

    return UserModel(userName: json["username"].toString(),password: json["password"],email: json["email"],id: json["id"].toString(),intrestId: json["intrestId"]);
  }
}
