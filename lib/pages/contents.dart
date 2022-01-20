import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/autoJsonSerializationExample/auto_show_data.dart';
import 'package:flutter_application_1/handJsonSerializationExample/show_data.dart';
import 'package:flutter_application_1/pages/counter_example.dart';
import 'package:flutter_application_1/pages/form_example.dart';
import 'package:flutter_application_1/pages/http_example.dart';
import 'package:flutter_application_1/pages/important_lessons.dart';
import 'package:flutter_application_1/pages/rating_example.dart';
import 'package:flutter_application_1/pages/screen_example.dart';

class Contents extends StatefulWidget {
  @override
  _ContentsState createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contents'),
        centerTitle: true,
      ),
      body: ListOfContents(),
    );
  }
}

class ListOfContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    padding: EdgeInsets.all(8.0),
    children: <Widget>[
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => ImportantLessons());
          Navigator.push(context, route);
        },
        child: Text(
          '     Important Lessons     ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => CounterExample());
          Navigator.push(context, route);
        },
        child: Text(
          '     Counter Example     ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => ScreenExample());
          Navigator.push(context, route);
        },
        child: Text(
          '     Screen Example     ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => FormExample());
          Navigator.push(context, route);
        },
        child: Text(
          '     Form Example     ',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => HttpExample());
          Navigator.push(context, route);
        },
        child: Text(
          'Http Response Example',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => ShowData());
          Navigator.push(context, route);
        },
        child: Text(
          'Hand Json Serialization',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AutoShowData());
          Navigator.push(context, route);
        },
        child: Text(
          'Auto Json Serialization',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[600], // background
          onPrimary: Colors.white, // foreground
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => RatingExample());
          Navigator.push(context, route);
        },
        child: Text(
          'Rating Example',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    ],
  );
}
