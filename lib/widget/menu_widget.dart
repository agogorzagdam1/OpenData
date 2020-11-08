import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:museos/screens/localidades_screen.dart';

class MenuPaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/imagen_menu.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance, color: Colors.black),
            title: Text("Buscar Museos"),
            onTap: () {
              Get.offAll(ListaLocalidadesScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.image, color: Colors.black),
            title: Text("Galería de imágenes"),
            onTap: () {
              Get.offAll(ListaLocalidadesScreen());
            },
          ),
        ],
      ),
    );
  }
}
