import 'package:flutter/material.dart';
import 'package:flutter_application_1/autoJsonSerializationExample/auto_offices.dart';

class AutoShowData extends StatefulWidget {
  @override
  _AutoShowDataState createState() => _AutoShowDataState();
}

class _AutoShowDataState extends State<AutoShowData> {
  Future<OfficesList>? officesList;

  @override
  void initState() {
    super.initState();
    officesList = getOfficesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Json Serialization Example'),
        centerTitle: true,
      ),
      body: FutureBuilder<OfficesList>(
        future: officesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.offices?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${snapshot.data?.offices?[index].name}'),
                      subtitle:
                          Text('${snapshot.data?.offices?[index].address}'),
                      leading: Image.network(
                          '${snapshot.data?.offices?[index].image}'),
                      isThreeLine: true,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
