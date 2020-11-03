import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museos/provider/museos_provider.dart';
import 'package:museos/screens/localidades_screens.dart';

class ListaMuseosLocalidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Museos por localidad'),
      ),
      body: _lista(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(ListaLocalidadesScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: museosProvider.cargarMuseosLocalidades(args['localidad']),
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
        onTap: () {},
      );
      lst.add(w);
    });
    return lst;
  }
}
