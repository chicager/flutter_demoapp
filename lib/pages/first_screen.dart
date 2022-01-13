import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/contents.dart';
import 'package:flutter_application_1/pages/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String text = 'Some Text';

  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather Forecast',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: availableHeight,
            color: Colors.deepOrange,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: <Widget>[
                      _search(),
                      _mainInfo(),
                      _weekForecast(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[600], // background
                                  onPrimary: Colors.white, // foreground
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                ),
                                onPressed: () {
                                  _returnDataFromSecondScreen(context);
                                },
                                child: Text(
                                  'Go to the Second Screen',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red[600], // background
                                  onPrimary: Colors.white, // foreground
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 20),
                                ),
                                onPressed: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => Contents());
                                  Navigator.push(context, route);
                                },
                                child: Text(
                                  '              Contents              ',
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _returnDataFromSecondScreen(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => SecondScreen());
    final result = await Navigator.push(context, route);

    setState(() {
      if (result != null)
        text = result;
      else
        return;
    });
  }
}

Container _search() {
  return Container(
    color: Colors.deepOrange,
    child: Row(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: TextField(
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: 'Enter a search term',
            ),
          ),
        ),
      ],
    ),
  );
}

Container _mainInfo() {
  return Container(
    color: Colors.deepOrange,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: const <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Text(
                                  'Moscow Oblast, RU',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),
                              Text(
                                'Friday, Mar 20, 2022',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 30.0,
                          bottom: 30.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.wb_sunny,
                                      size: 70.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      children: const <Widget>[
                                        Text(
                                          '14 °F',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 50.0,
                                          ),
                                        ),
                                        Text(
                                          'LIGHT SNOW',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.ac_unit,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70.0,
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.ac_unit,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 70.0,
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(
                          Icons.ac_unit,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          '20',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Container _weekForecast() {
  return Container(
    color: Colors.deepOrange,
    child: Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '7 DAY WEATHER FORECAST',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
