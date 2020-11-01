import 'dart:convert';

import '../models/Museos_model.dart';
import '../models/museosnavarra_model.dart';


class MuseosProvider {
  final listaLocalidad = [
    "Pamplona"
    "Estella-Lizarra"
    "Alzuza"
    "Tudela"
    "Tulebras"
    "Roncal"
    "Zubieta"
    "Berbinzana"
  ];

  List<ListaMuseos> listamuseos = [];

  List<String> listaLocalidades = [];


  Future<List<ListaMuseos>> cargarMuseos() async {
    var rootBundle;
        final data =
          await rootBundle.loadString("assets/data/museos_es.json");
    final decodeData = json.decode(data);
    final museosNavarra = decodeData["MUSEOSNAVRRA"]; 
    final museoNavarra = museosNavarra["MUSEONAVARRA"];
    Museos museos = Museos.fromJsonList(museoNavarra);
    listamuseos = museos.lista;
    return listamuseos;
  }

  Future<List<String>> cargarLocalidades() async {
    if(listamuseos.length==0){
      await cargarMuseos();
    }
    listaLocalidades = [];
    listamuseos.forEach((m){
      if(listaLocalidades.indexOf(m.localidad)<0){
        listaLocalidades.add(m.localidad);
      }
    });
    return listaLocalidades;
  }

}
final museosProvider = new MuseosProvider();