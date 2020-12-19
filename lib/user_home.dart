import 'package:covid_vijay_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  Map<String, double> dataMap = {
    "vaccinated": 8,
    "notvaccinated": 2,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Welcome_',
                style: GoogleFonts.varelaRound(
                    foreground: Paint()..shader = linearGradient,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20.0),
            //   ),
            //   padding: EdgeInsets.all(20.0),
            //   child: Text(
            //     'Looks like a lot of people are getting vaccinated.',
            //     style: GoogleFonts.varelaRound(
            //         foreground: Paint()..shader = linearGradient,
            //         fontSize: 20.0,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 20.0)
                  ]),
              child: PieChart(

        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 10),
                child: Text(
                  'Hello Nitish!',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Looks like a lot of people are getting \nvaccinated.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w200),
                ),
              ),
              PieChart(

                dataMap: dataMap,
                animationDuration: Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width + 4,
                colorList: [Colors.blueAccent, Colors.red],
                initialAngleInDegree: 0,
                ringStrokeWidth: 32,
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(

                    color: Colors.black,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                ),

              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.orange),
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Image.asset(
                    'assets/images/aadhar.png',
                    height: 30.0,
                  ),
                  labelText: 'Aadhar No.',
                  labelStyle: GoogleFonts.varelaRound(
                    color: Colors.orange,
                  ),
                ),
                cursorColor: Colors.orange,
                cursorWidth: 2.0,
                style: TextStyle(fontSize: 25, color: Colors.purple),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {},
              child: new Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.greenAccent),
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20.0)),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Check',
                      style: GoogleFonts.varelaRound(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                      size: 40.0,
                    )
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: 80,
              ),
            ),
          ],

        ),
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'protect your family from corona now',
                            style: TextStyle(
                                color: Colors.white,
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
                                        height: 200,
                                        width: 200,
                                        color: Color(0xff070413),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text('Add a person',style: TextStyle(color: Colors.white,fontSize: 25),),
                                            )
                                          ],
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
                    decoration: BoxDecoration(color: Color(0xff070413)),
                  );
                });
          },
          label: Text('Add members')),
    );
  }
}
