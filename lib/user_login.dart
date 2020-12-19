import 'package:covid_vijay_app/admin_login.dart';
import 'package:covid_vijay_app/services/auth.dart';
import 'package:covid_vijay_app/user_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
    final _key = GlobalKey<FormState>();
  TextEditingController _textEditingController;
  String email;
  String password;
  bool credentialTrue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color(0xff070413),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2 - 100,
            ),
            Center(
                child: Text(
              'User Login',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(FontAwesomeIcons.userAlt),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
              child: TextFormField(
                controller: _textEditingController,
                onChanged: (val) {
                  password = val;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(FontAwesomeIcons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                ),
                style: TextStyle(fontSize: 17, color: Colors.black),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 350,
                height: 60,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: RaisedButton(
                      color: Color(0xff02AE8B),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10),
                      splashColor: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 17),
                        ),
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
                                builder: (context) => UserHome(),
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
                    "Sign in as Admin?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                        padding: EdgeInsets.all(5),
                        color: Colors.white,
                        splashColor: Color(0xff02AE8B),
                        iconSize: 30,
                        icon: Icon(FontAwesomeIcons.signInAlt),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => AdminLogin(),
                          ));
                        }),
                  
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}