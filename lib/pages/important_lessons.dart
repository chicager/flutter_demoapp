import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImportantLessons extends StatefulWidget {
  @override
  _ImportantLessonsState createState() => _ImportantLessonsState();
}

class _ImportantLessonsState extends State<ImportantLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Important Lessons'),
        centerTitle: true,
      ),
      body: ListOfLessons(),
    );
  }
}

class ListOfLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  return ListView(
    padding: EdgeInsets.all(8.0),
    children: <Widget>[
      ListTile(
        leading: Text('24'),
        title: Text('Практика. Компоновка интерфейса'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('25'),
        title: Text('ListView'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('29'),
        title: Text('Простая компоновка'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('30'),
        title: Text('Навигация по имени'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('31'),
        title: Text('Простая передача данных между экранами'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('32'),
        title: Text('Передача данных при навигации по имени'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('33'),
        title: Text('Передача данных с onGenerateRoute'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('34'),
        title: Text('Передача данных на предыдущий экран'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('40'),
        title: Text('Валидация формы'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('51'),
        title: Text('Пример http response'),
        subtitle: Text('Kokorin'),
      ),
      ListTile(
        leading: Text('54'),
        title: Text('Пример ручной сериализации json'),
        subtitle: Text('Kokorin'),
      ),
    ],
  );
}
