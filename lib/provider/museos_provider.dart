import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/museos_model.dart';
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
  List<String> listaMuseosLocalidades = [];

  Future<List<ListaMuseos>> cargarMuseos() async {
    final data = await rootBundle.loadString("assets/data/museos_es.json");
    final decodeData = json.decode(data);
    final museosNavarra = decodeData["MUSEOSNAVARRA"];
    final museosNavarraRow = museosNavarra["MUSEONAVARRA"];
    Museos museos = Museos.fromJsonList(museosNavarraRow);
    listamuseos = museos.lista;
    return listamuseos;
  }

  Future<List<String>> cargarLocalidades() async {
    if (listamuseos.length == 0) {
      await cargarMuseos();
    }
    listaLocalidades = [];
    listamuseos.forEach((m) {
      if (listaLocalidades.indexOf(m.localidad) < 0) {
        listaLocalidades.add(m.localidad);
      }
    });
    return listaLocalidades;
  }

  Future<List<String>> cargarMuseosLocalidades(localidad) async {
    if (listamuseos.length == 0) {
      await cargarMuseos();
    }
    listaMuseosLocalidades = [];
    listamuseos.forEach((m) {
      if ((m.localidad == localidad) &&
          (listaMuseosLocalidades.indexOf(m.localidad) < 0)) {
        listaMuseosLocalidades.add(m.nombre);
      }
    });
    return listaMuseosLocalidades;
  }
}

final museosProvider = new MuseosProvider();
