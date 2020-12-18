import 'package:covid_vijay_app/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        //  brightness: Brightness.dark,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboarding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
