import 'package:something/constants.dart';
import 'package:something/controllers/MenuAppController.dart';
import 'package:something/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{



    await Firebase.initializeApp(
      options: FirebaseOptions(

          apiKey: "AIzaSyDiWd_XFf2F1m2B8DZ6kcVwR7x2XdNNF3Q",
          authDomain: "something-99da7.firebaseapp.com",
          projectId: "something-99da7",
          storageBucket: "something-99da7.appspot.com",
          messagingSenderId: "545076816443",
          appId: "1:545076816443:web:15fe58c5664074a45c4a1e"

      ),
    );


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter something Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
