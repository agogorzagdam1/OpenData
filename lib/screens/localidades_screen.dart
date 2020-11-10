import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:museos/provider/museos_provider.dart';
import 'package:museos/screens/museosLocalidades_screen.dart';
import 'package:museos/screens/paina_principal_screen.dart';
import 'package:museos/widget/menu_widget.dart';

class ListaLocalidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    box.write('localidad', null);
    box.write('museo', null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Localidades'),
      ),
      body: _lista(context),
      drawer: MenuPaginaPrincipal(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(PaginaPrincipalScreen());
        },
        child: Icon(Icons.arrow_back),
      ),
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
          box.write('localidad', element);
          args['localidad'] = element;
          Get.offAll(ListaMuseosLocalidadesScreen(), arguments: args);
        },
      );
      lst.add(w);
    });
    return lst;
  }
}
