import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RatingExampleState();
}

class _RatingExampleState extends State<RatingExample> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    double _size = 50;

    return Scaffold(
      appBar: AppBar(
        title: Text('Rating Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: IconButton(
                  icon: (_rating >= 1
                      ? Icon(Icons.star, size: _size)
                      : Icon(Icons.star_border, size: _size)),
                  color: Colors.indigo[500],
                  iconSize: _size,
                  onPressed: () {
                    setState(() {
                      _rating = 1;
                    });
                  }),
            ),
            Container(
              child: IconButton(
                  icon: (_rating >= 2
                      ? Icon(Icons.star, size: _size)
                      : Icon(Icons.star_border, size: _size)),
                  color: Colors.indigo[500],
                  iconSize: _size,
                  onPressed: () {
                    setState(() {
                      _rating = 2;
                    });
                  }),
            ),
            Container(
              child: IconButton(
                  icon: (_rating >= 3
                      ? Icon(Icons.star, size: _size)
                      : Icon(Icons.star_border, size: _size)),
                  color: Colors.indigo[500],
                  iconSize: _size,
                  onPressed: () {
                    setState(() {
                      _rating = 3;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
