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

  List<Museo> listamuseos = [];

  List<String> listaLocalidades = [];
  List<Museo> listaMuseosLocalidades = [];
  List<Museo> listaGaleria = [];

  Future<List<Museo>> cargarMuseos() async {
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

  Future<List<Museo>> cargarMuseosLocalidades(localidad) async {
    if (listamuseos.length == 0) {
      await cargarMuseos();
    }
    listaMuseosLocalidades = [];
    listamuseos.forEach((m) {
      if (m.localidad == localidad) {
        listaMuseosLocalidades.add(m);
      }
    });
    return listaMuseosLocalidades;
  }

  Future<List<Museo>> cargarGaleria() async {
    if (listamuseos.length == 0) {
      await cargarMuseos();
    }
    listaGaleria = [];
    listamuseos.forEach((m) {
      if (m.tipo == "Museo") {
        listaGaleria.add(m);
      }
    });
    return listaGaleria;
  }
}

final museosProvider = new MuseosProvider();
