

import 'package:note_prpject/models/lookup_model.dart';
import 'package:note_prpject/services/services_handler.dart';

class LookUpData {

  getAllInterests() async {
    List <LookUpModel> listLookUps = [];
    var response = await ServicesHandler().
    getService(urlSuffix: "intrests/getall", ex: true);
    response.forEach((v) {
      LookUpModel lookUpModel = LookUpModel.fromJson(v);
      listLookUps.add(lookUpModel);
    });
    return listLookUps;

  }

}