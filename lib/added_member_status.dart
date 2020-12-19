import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddedMemberStatus extends StatefulWidget {
  @override
  _AddedMemberStatusState createState() => _AddedMemberStatusState();
}

class _AddedMemberStatusState extends State<AddedMemberStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added Members'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff02AE8B),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.add),
          backgroundColor: Color(0xff02AE8B),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Container(
                              height: 100,
                              width: 100,
                              child: CircleAvatar(
                                child:
                                    Image.asset('assets/images/addmember.png'),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'add your family members',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'protect your family from corona now',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff02AE8B),
                                borderRadius: BorderRadius.circular(15)),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        height:
                                            MediaQuery.of(context).size.height -
                                                200,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                20,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Add a person',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: 200,
                                                width: 200,
                                                child: CircleAvatar(
                                                  child: Image.asset(
                                                      'assets/images/aadhar.png'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    20, 5, 20, 0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 2.0,
                                                        color: Colors.orange),
                                                    color: Colors.orange[50],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Enter the 10 digit Aadhar No.',
                                                    labelStyle:
                                                        GoogleFonts.varelaRound(
                                                      color: Colors.orange,
                                                    ),
                                                  ),
                                                  cursorColor: Colors.orange,
                                                  cursorWidth: 2.0,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.purple),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 75,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    color: Colors.white,
                                                    minWidth: 125,
                                                    height: 55,
                                                    splashColor:
                                                        Colors.greenAccent,
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff02AE8B),
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                  MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    color: Color(0xff02AE8B),
                                                    minWidth: 125,
                                                    height: 55,
                                                    splashColor:
                                                        Colors.greenAccent,
                                                    child: Text(
                                                      'Add',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 25),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.add),
                              iconSize: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30))
                    ),
                  );
                });
          },
          label: Text('Add members')),
    );
  }
}
