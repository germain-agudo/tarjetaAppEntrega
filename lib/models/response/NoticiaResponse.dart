// To parse this JSON data, do
//
//     final noticiaResponse = noticiaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/Noticia.dart';
// import 'package:app_tarjeta/models/Usuario.dart';

NoticiaResponse noticiaResponseFromJson(String str) => NoticiaResponse.fromJson(json.decode(str));

String noticiaResponseToJson(NoticiaResponse data) => json.encode(data.toJson());

class NoticiaResponse {
    NoticiaResponse({
        this.total,
        this.noticias,
    });

    int total;
    List<Noticia> noticias;

    factory NoticiaResponse.fromJson(Map<String, dynamic> json) => NoticiaResponse(
        total: json["total"],
        noticias: List<Noticia>.from(json["noticias"].map((x) => Noticia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "noticias": List<dynamic>.from(noticias.map((x) => x.toJson())),
    };
}





// class NoticiaResponseList {
//     NoticiaResponseList({
//         this.id,
//         this.titulo,
//         this.subtitulo,
//         this.descripcion,
//         this.usuario,
//         this.fechaRegistro,
//         this.img,
//     });

//     String id;
//     String titulo;
//     String subtitulo;
//     String descripcion;
//     Usuario usuario;
//     DateTime fechaRegistro;
//     String img;

//     factory NoticiaResponseList.fromJson(Map<String, dynamic> json) => NoticiaResponseList(
//         id: json["_id"],
//         titulo: json["titulo"],
//         subtitulo: json["subtitulo"],
//         descripcion: json["descripcion"],
//         usuario: Usuario.fromJson(json["usuario"]),
//         fechaRegistro: DateTime.parse(json["fecha_registro"]),
//         img: json["img"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "titulo": titulo,
//         "subtitulo": subtitulo,
//         "descripcion": descripcion,
//         "usuario": usuario.toJson(),
//         "fecha_registro": fechaRegistro.toIso8601String(),
//         "img": img,
//     };
// }
