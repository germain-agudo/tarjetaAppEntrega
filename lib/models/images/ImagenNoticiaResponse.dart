// To parse this JSON data, do
//
//     final imagenNoticiaResponse = imagenNoticiaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/images/Imagen.dart';

ImagenNoticiaResponse imagenNoticiaResponseFromJson(String str) => ImagenNoticiaResponse.fromJson(json.decode(str));

String imagenNoticiaResponseToJson(ImagenNoticiaResponse data) => json.encode(data.toJson());

class ImagenNoticiaResponse {
    ImagenNoticiaResponse({
        this.noticia,
        this.total,
        this.results,
    });

    String noticia;
    int total;
    List<ImagenNoticiaResult> results;

    factory ImagenNoticiaResponse.fromJson(Map<String, dynamic> json) => ImagenNoticiaResponse(
        noticia: json["Noticia"],
        total: json["total"],
        results: List<ImagenNoticiaResult>.from(json["results"].map((x) => ImagenNoticiaResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Noticia": noticia,
        "total": total,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class ImagenNoticiaResult {
    ImagenNoticiaResult({
        this.id,
        this.imagenId,
    });

    String id;
    Imagen imagenId;

    factory ImagenNoticiaResult.fromJson(Map<String, dynamic> json) => ImagenNoticiaResult(
        id: json["_id"],
        imagenId: Imagen.fromJson(json["imagen_id"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "imagen_id": imagenId.toJson(),
    };
}

