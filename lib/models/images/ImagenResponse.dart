// To parse this JSON data, do
//
//     final imagenResponse = imagenResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/images/Imagen.dart';

ImagenResponse imagenResponseFromJson(String str) => ImagenResponse.fromJson(json.decode(str));

String imagenResponseToJson(ImagenResponse data) => json.encode(data.toJson());

class ImagenResponse {
    ImagenResponse({
        this.total,
        this.images,
    });

    int total;
    List<Imagen> images;

    factory ImagenResponse.fromJson(Map<String, dynamic> json) => ImagenResponse(
        total: json["total"],
        images: List<Imagen>.from(json["images"].map((x) => Imagen.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
    };
}
