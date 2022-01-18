import 'package:flutter/material.dart';
import 'package:flutter_application_1/handJsonSerializationExample/offices.dart';

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
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
        title: Text('Hand Json Serialization Example'),
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
