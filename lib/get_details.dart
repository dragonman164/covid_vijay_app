import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Details> getDetails() async {
  var url = 'https://covid19-vaccine.herokuapp.com/api/';
  
    final response = await http.get(
      url,
    );
    if(response.statusCode==200){
      
      return Details.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed');
    }

  }


class Details {
  final String name;
  final int aadhar;
  final String area;
  final String zone;
  final int age;
  final String occupation;
  bool isAtRisk;
  bool isVaccinated;
  DateTime dateofVaccination;
  Details({
    this.name,
    this.aadhar,
    this.area,
    this.zone,
    this.age,
    this.occupation,
    this.isAtRisk,
    this.isVaccinated,
    this.dateofVaccination,
  });
  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      name: json['name'].toString(),
      aadhar: json['aadhar'],
      area: json['area'],
      zone: json['zone'],
      age: json['occupation'],
      isAtRisk: json['isAtRisk'],
      isVaccinated: json['isVaccinated'],
      dateofVaccination: json['dateofVaccination'],
    );
  }
}
