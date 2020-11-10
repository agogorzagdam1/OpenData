import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:museos/screens/mapa_museos.dart';
import 'package:museos/screens/pagina_principal_screen.dart';
import 'package:museos/screens/pantallaCarga_screen.dart';

//void main() => runApp(MyApp());
main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return GetMaterialApp(
    title: 'Material App',
    home: PaginaPrincipalScreen(),
  );
  }
}
