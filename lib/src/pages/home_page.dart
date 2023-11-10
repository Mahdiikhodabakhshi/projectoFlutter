import 'package:flutter/material.dart';
import 'package:mahdi_khodabakhshi/src/pages/dataProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
        future: dataProvider.cargarDatos(),
        initialData: [],
        builder: (context, AsyncSnapshot<List> snapshot) {
          return ListView(
            children: _listItems(snapshot.data ?? []),
          );
        });
  }

  List<Widget> _listItems(List<dynamic> data) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final widgetTemp = Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: EdgeInsets.all(15),
        elevation: 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            children: <Widget>[
              Image(
                image: NetworkImage(element['image']),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(element['text']),
              ),
            ],
          ),
        ),
      );
      opciones.add(widgetTemp);
    });

    return opciones;
  }
}
