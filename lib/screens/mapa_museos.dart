import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong/latlong.dart';
import 'package:museos/models/museosnavarra_model.dart';
import 'package:museos/screens/museosLocalidades_screen.dart';

class MapaMuseosScreen extends StatefulWidget {
  MapaMuseosScreen({Key key}) : super(key: key);
   
  @override
  _MapaMuseosScreen createState() => _MapaMuseosScreen();
}

class _MapaMuseosScreen extends State<MapaMuseosScreen> {
 Museo element = null;
  Map<String, Object> args = new Map<String, Object>();
 
  @override
 Widget build(BuildContext context) {
  element = Get.arguments;
  return Scaffold(
    appBar: AppBar(
    title: Text("Mapa"),),
    body: _flutterMap(),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(ListaMuseosLocalidadesScreen(), arguments: args);
        },
        child: Icon(Icons.arrow_back),
      ),

  );
  
}
_flutterMap(){
  return new FlutterMap(
    options: new MapOptions(
      center: new LatLng(double.parse(element.x),double.parse(element.y)),
      zoom: 18.0,
    ),
    layers: [
       TileLayerOptions(
        urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
        additionalOptions: {
          'accessToken': 
            'pk.eyJ1IjoiaGFtYWxhc2FiYSIsImEiOiJja2dqNXdhMXEwdjE3MnN0ZTdvZTVheDdyIn0.fSTTljpXC2GUY4TsSF0_qw',
          'id': 'mapbox.satellite',
        },
      ),
      new MarkerLayerOptions(
        markers: [
          new Marker(
            width: 50.0,
            height: 50.0,
            point: new LatLng(double.parse(element.x),double.parse(element.y)),
            builder: (ctx) =>
            new Container(
              child: Icon(
                Icons.location_pin,
                color: Colors.yellow[200],
                size: 50,

              ),
            ),
          ),
        ],
      ),
    ],
  );
}
}