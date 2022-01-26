import 'package:flutter/material.dart';
import 'package:note_prpject/constants/key_words.dart';
import 'package:note_prpject/provider/provider_note.dart';
import 'package:note_prpject/provider/provider_user.dart';
import 'package:note_prpject/screen/edit_note/index.dart';
import 'package:note_prpject/screen/note_screen/index.dart';
import 'package:note_prpject/screen/options/index.dart';
import 'package:note_prpject/services/cahe_helper.dart';
import 'package:provider/provider.dart';
import 'package:note_prpject/services/services_sqlite.dart';

import 'models/note_model.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
 KeyWords.apiOrNot= await CacheHelper.getData(key: "LocalDataBase");
  //await SQLiteDbProvider().insert(NoteModel(id: 3.toString(),userId: 5.toString(),text: "Tgg",placeDateTime: "gggg"));
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) => ProviderUser(),),
      ChangeNotifierProvider(create: (_) => ProviderNote(),)
      //create: (_) => LocalizationProvider(),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NoteScreen(),
    );
  }
}


