import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museos/provider/museos_provider.dart';
import 'package:museos/screens/museosLocalidades_screen.dart';

class ListaLocalidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localidades'),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: museosProvider.cargarLocalidades(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _listaElementos(List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          args['localidad'] = element;
          Get.offAll(ListaMuseosLocalidadesScreen(), arguments: args);
        },
      );
      lst.add(w);
    });
    return lst;
  }
}