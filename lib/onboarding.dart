import 'package:covid_vijay_app/admin_login.dart';
import 'package:covid_vijay_app/user_home.dart';
import 'package:covid_vijay_app/user_login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070413),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                  color: Color(0xff070413),
                  child: Image.asset(
                    'assets/images/vaccine.gif',
                    height: 290,
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2 - 250,
            ),
            Center(
                child: Text(
              'the vaccination for',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
            Center(
                child: Text(
              'COVID 19 is here',
              style: TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 5,
            ),
            Center(
                child: Text(
              'we will help you to get vaccinated safely',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w800),
            )),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              splashColor: Colors.greenAccent,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => UserLogin(),
                ));
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              color: Color(0xff02AE8B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              height: 64,
              minWidth: 200,
            ),
            SizedBox(
              height: 10,
            ),
          
          ],
        ),
      ),
    );
  }
}
