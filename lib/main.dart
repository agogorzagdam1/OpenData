import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:museos/screens/galeria_screen.dart';
import 'package:museos/screens/localidades_screen.dart';
import 'package:museos/screens/museosLocalidades_screen.dart';
import 'package:museos/screens/paina_principal_screen.dart';

//void main() => runApp(MyApp());
main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String localidad = box.read('localidad');
    String museo = box.read('museo');

    return GetMaterialApp(
      title: 'Material App',
      home: (museo != null)
          ? ListaLocalidadesScreen()
          : (localidad != null)
              ? PaginaPrincipalScreen()
              : PaginaPrincipalScreen(),

      //home: PaginaPrincipalScreen(),
    );
  }
}
