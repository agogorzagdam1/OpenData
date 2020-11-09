import 'package:museos/screens/museosLocalidades_screen.dart';
import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';


class CargarPantallaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: ListaMuseosLocalidadesScreen(),
        title: new Text(
          'Espacios Naturales',
          style: new TextStyle(fontStyle: FontStyle.italic, fontSize: 30.0),
        ),
        image: new Image.network(
            'https://c0.klipartz.com/pngpicture/1019/39/gratis-png-museo-de-arte-alianza-americana-de-museos-el-museo-de-dibujos-animados-exposicion.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 120.0,
        onClick: () => print("Flutter Spain"),
        loadingText: Text("Cargando..."),
        loaderColor: Colors.yellow);
  }
}