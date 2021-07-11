// To parse this JSON data, do
//
//     final imagen = imagenFromJson(jsonString);

import 'dart:convert';

Imagen imagenFromJson(String str) => Imagen.fromJson(json.decode(str));

String imagenToJson(Imagen data) => json.encode(data.toJson());

class Imagen {
    Imagen({
        this.id,
        this.img,
        this.fechaRegistro,
        // this.usuarioId,
    });

    String id;
    String img;
    DateTime fechaRegistro;
    // UsuarioId usuarioId;

    factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        id: json["_id"],
        img: json["img"],
        fechaRegistro: (json["fecha_registro"]==null) ? null :DateTime.parse(json["fecha_registro"]),
        // usuarioId: UsuarioId.fromJson(json["usuario_id"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
        "fecha_registro": fechaRegistro.toIso8601String(),
        // "usuario_id": usuarioId.toJson(),
    };
}
