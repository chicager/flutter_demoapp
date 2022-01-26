import 'package:flutter/material.dart';

class InheritedWidgetExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() => setState(() => _counter++);
  void _decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Example'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          //Оборачиваем в наш Inherited Widget
          MyInheritedWidget(
            myState: this,
            child: AppRootWidget(),
          ),
        ],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootWidgetState = MyInheritedWidget.of(context)?.myState;
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(Root Widget)', style: Theme.of(context).textTheme.headline3),
          Text('${rootWidgetState!.counterValue}', style: Theme.of(context).textTheme.headline3),
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
    final rootWidgetState = MyInheritedWidget.of(context)?.myState;
    return Card(
      margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
      color: Colors.yellowAccent,
      child: Column(
        children: <Widget>[
          Text('(Child Widget)'),
          Text('${rootWidgetState!.counterValue}', style: Theme.of(context).textTheme.headline3),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                color: Colors.red,
                onPressed: () => rootWidgetState._decrementCounter(),
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.green,
                onPressed: () => rootWidgetState._incrementCounter(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final _InheritedWidgetExampleState?
      myState; //Указываем что мы будем хранить в классе MyInheritedWidget

  MyInheritedWidget({Key? key, Widget? child, @required this.myState})
      : super(key: key, child: child!);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return this.myState?.counterValue != oldWidget.myState?.counterValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  //позволяет предоставить наши данные всем дочерним виджетам по дереву
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}
