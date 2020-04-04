import 'package:flutter/material.dart';
import 'package:medicine/screens/info_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      theme: ThemeData.dark().copyWith(
//        textTheme: TextTheme(
//          body1: TextStyle(color: Colors.black54),
//        ),
//      ),
      initialRoute: InfoScreen.id,
      routes: {
        InfoScreen.id: (context) => InfoScreen(),
      },
    );
  }
}
