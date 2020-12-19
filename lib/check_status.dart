import 'package:flutter/material.dart';

class DisplayVaccinationStatus extends StatelessWidget {


  static String routeName = '/displayStatus';




  @override
  Widget build(BuildContext context) {
    final Map data  = ModalRoute.of(context).settings.arguments as Map;
    final Map dataFetched = data['maindata'];
    return Scaffold(
      appBar: AppBar(title: Text('Display Vaccination Status'),),
      body: Column(
        children: [
          Text('Name: ${dataFetched['aadhar_number']}'),
          Text('Name: ${dataFetched['name']}' ),
          Text('Name: ${dataFetched['area']}' ),
          Text('Name: ${dataFetched['zone']}' ),
          Text('Name: ${dataFetched['age']}' ),
          Text('Name: ${dataFetched['isatRisk']}' ),
          Text('Name: ${dataFetched['dateofvaccination']}' ),
          Text('Name: ${dataFetched['isVaccinated']}' ),






        ],

      ),
    );
  }
}
