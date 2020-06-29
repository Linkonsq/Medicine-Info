import 'package:flutter/material.dart';
import 'package:medicine/providers/medicines.dart';
import 'package:medicine/screens/info_screen.dart';
import 'package:medicine/screens/user_medicines_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Medicines(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medicines',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InfoScreen(),
        routes: {
          UserMedicinesScreen.routeName: (ctx) => UserMedicinesScreen(),
        },
      ),
    );
  }
}
