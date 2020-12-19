import 'package:covid_vijay_app/added_member_status.dart';
import 'package:covid_vijay_app/constants.dart';
import 'package:covid_vijay_app/get_details.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'check_status.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  static double _vaccinated=0, _notVaccinated=0;

  TextEditingController _textEditingController;
  Future<Details> details;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    details = getDetails();
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textEditingController.dispose();
    super.dispose();
  }

  Map<String, double> dataMap = {
    "vaccinated": _vaccinated,
    "notvaccinated": _notVaccinated,
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 20.0)
                  ]),
              child: PieChart(
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
                controller: _textEditingController,
                keyboardType: TextInputType.number,
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
              onTap: () async{
              print(_textEditingController.text);
              var requireddata;
              try {
                var url = 'https://covid19-vaccine.herokuapp.com/api/';
                final response = await http.get(url);
                List Data = json.decode(response.body);
                for (int i = 0; i < Data.length; i++) {
                  if (Data[i]["isVaccinated"])
                    _vaccinated++;
                  if (Data[i]["aadhar_number"].toString() ==
                      _textEditingController.text.toString()) {
                    requireddata = Data[i];
                  }
                }
                _notVaccinated = Data.length - _vaccinated;
                print(_vaccinated);
                print(_notVaccinated);

                setState(() {
                  dataMap = {
                    "vaccinated": _vaccinated,
                    "notvaccinated": _notVaccinated,
                  };
                });
              }catch(e)
                {
                  print('Error');
                }

        Navigator.of(context).pushNamed(DisplayVaccinationStatus.routeName,arguments: {
          'maindata': requireddata
        });


              },
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
            SizedBox(
              height: 50,
            ),
//            InkWell(
//              onTap: () {
//
//
//
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => AddedMemberStatus(),
//                    ));
//              },
//              child: new Container(
//                decoration: BoxDecoration(
//                    border: Border.all(width: 2.0, color: Colors.greenAccent),
//                    color: Colors.white24,
//                    borderRadius: BorderRadius.circular(20.0)),
//                padding: EdgeInsets.all(10.0),
//                child: Center(
//                  child: Text(
//                    'Check added member\'s status',
//                    style: GoogleFonts.varelaRound(
//                        color: Colors.greenAccent,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 20.0),
//                  ),
//                ),
//                margin: EdgeInsets.symmetric(horizontal: 20.0),
//                height: 50,
//              ),
//            ),
          ],
        ),
      ),
    );
  }
}
