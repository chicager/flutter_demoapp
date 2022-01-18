//Все данные ниже построены под данные с этого api 'https://about.google/static/data/locations.json';

import 'dart:convert';

import 'package:http/http.dart' as http;

class OfficesList {
  List<Office>? offices;

  OfficesList({this.offices});

  //фабричный конструктор
  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officesJson = json['offices'] as List;
    List<Office> officesList =
        officesJson.map((i) => Office.fromJson(i)).toList();

    return OfficesList(offices: officesList);
  }
}

class Office {
  final String? name;
  final String? address;
  final String? image;

  Office({this.name, this.address, this.image});

  //фабричный конструктор
  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
        name: json['name'] as String,
        address: json['address'] as String,
        image: json['image'] as String);
  }
}

Future<OfficesList> getOfficesList() async {
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(
    Uri.parse(url),
  );

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
