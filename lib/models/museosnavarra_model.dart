import 'dart:convert';

ListaMuseos listaMuseosFromJson(String str) => ListaMuseos.fromJson(json.decode(str));

String listaMuseosToJson(ListaMuseos data) => json.encode(data.toJson());

class ListaMuseos {
    ListaMuseos({
        this.id,
        this.imagen,
        this.nombre,
        this.localidad,
        this.tipo,
        this.direccion,
        this.cp,
        this.telefono,
        this.mail,
        this.web,
        this.horario,
        this.precio,
        this.descripcion,
        this.exposiciones,
        this.x,
        this.y,
    });

    String id;
    String imagen;
    String nombre;
    String localidad;
    String tipo;
    String direccion;
    String cp;
    String telefono;
    String mail;
    String web;
    String horario;
    String precio;
    String descripcion;
    String exposiciones;
    String x;
    String y;

    factory ListaMuseos.fromJson(Map<String, dynamic> json) => ListaMuseos(
        id: json["ID"],
        imagen: json["IMAGEN"],
        nombre: json["NOMBRE"],
        localidad: json["LOCALIDAD"],
        tipo: json["TIPO"],
        direccion: json["DIRECCION"],
        cp: json["CP"],
        telefono: json["TELEFONO"],
        mail: json["MAIL"],
        web: json["WEB"],
        horario: json["HORARIO"],
        precio: json["PRECIO"],
        descripcion: json["DESCRIPCION"],
        exposiciones: json["EXPOSICIONES"],
        x: json["X"],
        y: json["Y"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "IMAGEN": imagen,
        "NOMBRE": nombre,
        "LOCALIDAD": localidad,
        "TIPO": tipo,
        "DIRECCION": direccion,
        "CP": cp,
        "TELEFONO": telefono,
        "MAIL": mail,
        "WEB": web,
        "HORARIO": horario,
        "PRECIO": precio,
        "DESCRIPCION": descripcion,
        "EXPOSICIONES": exposiciones,
        "X": x,
        "Y": y,
    };
}