import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenExample extends StatefulWidget {
  @override
  _ScreenExampleState createState() => _ScreenExampleState();
}

class _ScreenExampleState extends State<ScreenExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        iconTheme: IconThemeData(
          color: Colors.black54,
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecast(),
                Divider(),
                _footerRarings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage("https://wallpaperaccess.com/full/1614308.jpg"),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const <Widget>[
      Text(
        "Tuesday - May 22",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, porro quisquam est qui dolorem ipsum quia dolor sit amet.",
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 16.0,
      ), //just empty space between icon and text
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Text(
                "15˚ Clear",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Text(
                "Moscowskaya obl, Moscow",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}˚C',
          style: TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRarings() {
  var _stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.black,
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.black,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        "Info with openweathermap.org",
        style: TextStyle(fontSize: 15.0),
      ),
      _stars,
    ],
  );
}
