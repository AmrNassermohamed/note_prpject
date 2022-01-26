import 'package:flutter/cupertino.dart';
import 'package:note_prpject/constants/key_words.dart';
import 'package:note_prpject/data/user_data.dart';
import 'package:note_prpject/models/provider_general_state.dart';
import 'package:note_prpject/models/user_model.dart';

class ProviderUser extends ChangeNotifier {
  bool apiOrNot=false;
  late ProviderGeneralState<
      List <UserModel>> listUserState = ProviderGeneralState(
      waiting: true);

  getApiOrLocalDataBase() async {
  try {
    await UserData().getUseLocalDataBaseOrNot();
  }catch(ex){
    rethrow;
  }
}
useLocalDataBase(bool value) async {
    try {
      await UserData().useLocalDataBaseOrNot(value);
      notifyListeners();
    }catch(ex){
      rethrow;
    }
  }

  getAllUser() async {
    List <UserModel> getUser = [];
    getUser = await UserData().getAllUser();
print(getUser);
    listUserState =
        ProviderGeneralState(data: getUser, hasData: true);
    notifyListeners();
  }









  


}