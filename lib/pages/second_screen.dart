import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
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
              String textToSendBack = textFieldController.text;
              Navigator.pop(context, textToSendBack);
            },
            child: Text(
              'Send Text Back',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
