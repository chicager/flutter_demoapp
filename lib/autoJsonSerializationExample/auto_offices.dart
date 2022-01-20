//Все данные ниже построены под данные с этого api 'https://about.google/static/data/locations.json';

import 'dart:convert';
import 'package:http/http.dart' as http;


//This code is fully generated

class OfficesList {
  List<Offices>? offices;

  OfficesList({this.offices});

  OfficesList.fromJson(Map<String, dynamic> json) {
    if (json['offices'] != null) {
      offices = <Offices>[];
      json['offices'].forEach((v) {
        offices!.add(new Offices.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offices != null) {
      data['offices'] = this.offices!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Offices {
  String? address;
  String? image;
  String? name;

  Offices(
      {this.address,
      this.image,
      this.name});

  Offices.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['image'] = this.image;
    data['name'] = this.name;

    return data;
  }
}

///////////////////////


//This code is wtitten by us

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
