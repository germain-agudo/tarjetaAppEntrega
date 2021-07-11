


// To parse this JSON data, do
//
//     final red = redFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/Usuario.dart';

Red redFromJson(String str) => Red.fromJson(json.decode(str));

String redToJson(Red data) => json.encode(data.toJson());

class Red {
    Red({
        this.estado,
        this.id,
        this.red,
        // this.usuarioId,
        this.fechaRegistro,
        this.fechaEliminacion,
        this.img,
    });

    bool estado;
    String id;
    String red;
    // Usuario usuarioId;
    DateTime fechaRegistro;
    DateTime fechaEliminacion;
    String img;

    factory Red.fromJson(Map<String, dynamic> json) => Red(
        estado: json["estado"],
        id: json["_id"],
        red: json["red"],
        // usuarioId: Usuario.fromJson(json["usuario_id"]),
        fechaRegistro: (json["fecha_registro"]== null)?null:DateTime.parse(json["fecha_registro"]),
        fechaEliminacion:(json["fecha_eliminacion"]==null)?null: DateTime.parse(json["fecha_eliminacion"]),
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "red": red,
        // "usuario_id": usuarioId.toJson(),
        "fecha_registro": fechaRegistro.toIso8601String(),
        "fecha_eliminacion": fechaEliminacion.toIso8601String(),
        "img": img,
    };
}



