import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpExample extends StatefulWidget {
  @override
  _HttpExampleState createState() => _HttpExampleState();
}

class _HttpExampleState extends State<HttpExample> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Data will be appeared in debug console in VS CODE',
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

Future<http.Response> getData() async {
  const url = 'https://about.google/static/data/locations.json';
  return await http.get(
    Uri.parse(url),
  );
}

void loadData() {
  getData().then((response) {
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}
