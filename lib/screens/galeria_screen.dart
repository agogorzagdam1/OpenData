import 'package:flutter/material.dart';
import 'package:museos/provider/museos_provider.dart';
import 'package:museos/widget/menu_widget.dart';
import 'package:museos/widget/swiper_widget.dart';

class PaginaGaleriaScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Galería de imágenes \n(pulse para más información)'),
        ),
        body: _swiper(context),
        drawer: MenuPaginaPrincipal());
  }

  Widget _swiper(BuildContext context) {
    return FutureBuilder(
      future: museosProvider.cargarGaleria(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SwiperWidget(lista: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
