import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScopedModelExampleState();
}

class _ScopedModelExampleState extends State<ScopedModelExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Example'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ScopedModel<MyModel>(
            model: MyModel(),
            child: _AppRootWidget(),
          ),
        ],
      ),
    );
  }
}

class _AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(Root Widget)', style: Theme.of(context).textTheme.headline3),
          Text('0', style: Theme.of(context).textTheme.headline3),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Counter(),
              Counter(),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModel>(
      rebuildOnChange: true, //true если текущий виджет нуждается в обновлении 
      builder: (context, child, model) => Card(
        margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
        color: Colors.yellowAccent,
        child: Column(
          children: <Widget>[
            Text('(Child Widget)'),
            Text('${model.counterValue}', style: Theme.of(context).textTheme.headline3),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                  onPressed: () => model._decrementCounter(),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.green,
                  onPressed: () => model._incrementCounter(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyModel extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
