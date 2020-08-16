import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huyndcovidflutterchallenge/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: GoogleFonts.roboto(
            textStyle:  TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              height: 2
            )
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  MainScreen(),
    );
  }
}
