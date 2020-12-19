import 'package:covid_vijay_app/admin_dashboard.dart';
import 'package:covid_vijay_app/onboarding.dart';
import 'package:covid_vijay_app/services/auth.dart';
import 'package:covid_vijay_app/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _key = GlobalKey<FormState>();
  TextEditingController _textEditingController;
  String email;
  String password;
  bool credentialTrue = true;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [g1, g2])),
        ),
        ListView(children: [
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(30.0)),
            child: Image(
              image: AssetImage('assets/images/admin.png'),
            ),
          ),
          Form(
            key: _key,
            child: Column(children: [
              Center(
                child: Chip(
                  padding: EdgeInsets.all(8.0),
                  backgroundColor: Colors.transparent,
                  label: Text('Admin Login'),
                  labelStyle: GoogleFonts.varelaRound(
                      color: Colors.purple,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                  avatar: Image.asset('assets/img/key.png'),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white24),
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: _textEditingController,
                  onChanged: (val) {
                    email = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/img/user.png'),
                    labelText: 'Email',
                    labelStyle: GoogleFonts.varelaRound(
                      color: Colors.white,
                    ),
                  ),
                  cursorColor: Colors.white,
                  cursorWidth: 2.0,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.white24),
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextFormField(
                  controller: _textEditingController,
                  onChanged: (val) {
                    password = val;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/img/lock.png'),
                    labelText: 'Password',
                    labelStyle: GoogleFonts.varelaRound(
                      color: Colors.white,
                    ),
                  ),
                  obscureText: true,
                  cursorColor: Colors.white,
                  cursorWidth: 2.0,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  _key.currentState.save();
                  _key.currentState.validate();
                  dynamic user = await Authentication()
                      .signIn(email: email, password: password);

                  if (user == null)
                    setState(() {
                      credentialTrue = false;
                    });
                  if (credentialTrue == false)
                    Text(
                      "Wrong username or password",
                      style: TextStyle(color: Colors.red),
                    );
                  if (_key.currentState.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminDashboard(),
                        ));
                  }
                },
                child: Container(
                    width: 350,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: Colors.greenAccent),
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Login',
                              style: GoogleFonts.varelaRound(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        height: 80,
                      ),

                      onPressed: () async {
                        _key.currentState.save();
                        _key.currentState.validate();
                        dynamic user = await Authentication()
                            .signIn(email: email, password: password);

                        if (user == null)
                          setState(() {
                            credentialTrue = false;
                          });
                        if (credentialTrue == false)
                          Text(
                            "Wrong username or password",
                            style: TextStyle(color: Colors.red),
                          );
                        if (_key.currentState.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminDashboard(),
                              ));
                        }
                      }),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              width: double.maxFinite,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign in as User?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Hero(
                    tag: "back_next",
                    child: IconButton(
                        padding: EdgeInsets.all(5),
                        color: Colors.white,
                        splashColor: Color(0xff02AE8B),
                        iconSize: 30,
                        icon: Icon(FontAwesomeIcons.backspace),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => UserLogin(),
                          ));
                        }),
                  ),
                ],

              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: double.maxFinite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "back_next",
                      child: IconButton(
                          padding: EdgeInsets.all(5),
                          color: Colors.white,
                          splashColor: Color(0xff02AE8B),
                          iconSize: 30,
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Onboarding(),
                                ));
                          }),
                    ),
                    Text(
                      "Not Admin?",
                      style: GoogleFonts.varelaRound(
                          fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ]),
    );
  }
}
