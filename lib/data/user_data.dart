
import 'package:note_prpject/constants/key_words.dart';
import 'package:note_prpject/models/user_model.dart';
import 'package:note_prpject/services/cahe_helper.dart';
import 'package:note_prpject/services/services_handler.dart';

class UserData {
  getAllUser() async {
    List <UserModel> listUser = [];
    var response = await ServicesHandler().
    getService(urlSuffix: "users/getall", ex: true);
    response.forEach((v) {
      UserModel userModel = UserModel.fromJson(v);
      listUser.add(userModel);
    });
    return listUser;
  }

  useLocalDataBaseOrNot(bool value ) async {
    try {
      await CacheHelper.saveData(
          key: "LocalDataBase", value: value);
      KeyWords.apiOrNot=   await CacheHelper.getData(
          key: "LocalDataBase");
      print("/////////////");
      print(KeyWords.apiOrNot);

    }catch(ex){
      rethrow;
    }
  }
  getUseLocalDataBaseOrNot() async {
    try {
   KeyWords.apiOrNot=   await CacheHelper.getData(
          key: "LocalDataBase");
    }catch(ex){
      rethrow;
    }
  }

  insertUser() async {
    try {
      var response = await ServicesHandler().
      postService(
          urlSuffix: "users/insert",
          returnBody: true).then((value) => value);
      return response;
    } catch (ex) {
      rethrow;
    }
  }
}