import 'package:covid_vijay_app/admin_login.dart';
import 'package:covid_vijay_app/user_home.dart';
import 'package:covid_vijay_app/user_login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Plasma(
          particles: 10,
          foregroundColor: Color(0x66e50ba4),
          backgroundColor: Color(0xff0a56cd),
          size: 1.00,
          speed: 6.00,
          offset: 0.00,
          blendMode: BlendMode.colorDodge,
        ),
        Center(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("assets/images/covid_vaccine.png"),
                  ),
                ),

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


              Center(
                  child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('The', style: heading),
                    SizedBox(
                      width: 10.0,
                    ),
                    Chip(
                      backgroundColor: Colors.transparent,
                      label: Text('Vaccination Programme'),
                      labelStyle: GoogleFonts.varelaRound(
                        color: Colors.green,
                        fontSize: 15.0,
                      ),
                      avatar: Image.asset('assets/img/vaccine.png'),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('for', style: heading),
                  ],
                ),
              )),
              Center(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chip(
                    backgroundColor: Colors.transparent,
                    label: Text('COVID 19'),
                    labelStyle: GoogleFonts.varelaRound(
                        color: Colors.red,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    avatar: Image.asset('assets/img/covid.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'is here',
                    style: GoogleFonts.varelaRound(
                        fontSize: 30.0, color: Colors.red),
                  ),
                ],
              )),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: Text('we will help you to get vaccinated safely',
                      style: subhead)),
              new SizedBox(
                height: 20,
              ),
              new InkWell(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                splashColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserHome(),
                    ),
                  );
                },
                child: new Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.greenAccent),
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20.0)),
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Get Started',
                        style: GoogleFonts.varelaRound(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Icon(
                        Icons.forward,
                        color: Colors.greenAccent,
                        size: 40.0,
                      )
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 80,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                'OR',
                style: GoogleFonts.varelaRound(color: Colors.greenAccent),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log in as',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminLogin(),
                        )),
                    child: Chip(
                      backgroundColor: Colors.transparent,
                      label: Text('Admin'),
                      labelStyle: GoogleFonts.varelaRound(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold),
                      avatar: Icon(Icons.vpn_key_sharp),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ]),
    );
  }
}
