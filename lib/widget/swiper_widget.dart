import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:museos/models/museosnavarra_model.dart';
import 'package:museos/screens/webview_screen.dart';

class SwiperWidget extends StatelessWidget {
  final List<Museo> lista;

  SwiperWidget({@required this.lista});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _swiper(context),
    );
  }

  Widget _swiper(context) {
    final screenSize = MediaQuery.of(context).size;
    return new Swiper(
      itemWidth: screenSize.width,
      itemHeight: screenSize.height,
      layout: SwiperLayout.TINDER,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //print("url: " + lista[index].getWebUrl());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebViewScreen(museo: lista[index])));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/placeholder.jpg'),
                image: AssetImage(lista[index].getPath()),
                fit: BoxFit.cover,
              )),
        );
      },
      itemCount: lista.length,
      control: new SwiperControl(),
    );
  }
}
