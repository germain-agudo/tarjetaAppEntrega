// To parse this JSON data, do
//
//     final noticia = noticiaFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/Usuario.dart';

Noticia noticiaFromJson(String str) => Noticia.fromJson(json.decode(str));

String noticiaToJson(Noticia data) => json.encode(data.toJson());

class Noticia {
    String id;
    String titulo;
    String subtitulo;
    String descripcion;
    // String usuario;
    Usuario usuario;

    DateTime fechaRegistro;
    DateTime fechaEliminacion;
    String img;




    Noticia({
        this.id,
        this.titulo,
        this.subtitulo,
        this.descripcion,
        this.usuario,
        this.fechaRegistro,
        this.fechaEliminacion,
        this.img,
    });


    factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
        id: json["_id"],
        titulo: json["titulo"],
        subtitulo: json["subtitulo"],
        descripcion: json["descripcion"],
        // usuario: json["usuario"],
        usuario: Usuario.fromJson(json["usuario"])  ,

        fechaRegistro: DateTime.parse(json["fecha_registro"]),
        fechaEliminacion: json["fecha_eliminacion"]==null  ?null:DateTime.parse(json["fecha_eliminacion"]) ,
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        // "_id": id,
        "_id": id,
        "titulo": titulo,
        "subtitulo": subtitulo,
        "descripcion": descripcion,
        // "usuario": usuario,
        "usuario": usuario.toJson(),

        "fecha_registro": fechaRegistro.toIso8601String(),
        "fecha_eliminacion": fechaEliminacion.toIso8601String(),
        "img": img,
    };
}
