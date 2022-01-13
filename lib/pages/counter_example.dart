import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterExample extends StatefulWidget {
  @override
  _CounterExampleState createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int _value = 0;

  @override
  void initState() {
    _value = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Counter Example'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.indigo.shade300),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Tap '-' to decrement",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple.shade100,
                ),
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    IconButton(
                      tooltip: 'Decrease value',
                      onPressed: () {
                        setState(() {
                          _value -= 1;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(
                      '$_value',
                      style: TextStyle(fontSize: 30),
                    ),
                    IconButton(
                      tooltip: 'Increase value',
                      onPressed: () {
                        setState(() {
                          _value += 1;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Text(
                "Tap '+' to increment",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
