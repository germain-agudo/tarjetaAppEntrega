// To parse this JSON data, do
//
//     final participante = participanteFromJson(jsonString);

import 'dart:convert';

// import 'package:app_tarjeta/models/Usuario.dart';

Participante participanteFromJson(String str) => Participante.fromJson(json.decode(str));

String participanteToJson(Participante data) => json.encode(data.toJson());

class Participante {
    Participante({
        this.estado,
        this.id,
        this.nombre,
        this.descripcion,
        // this.usuarioId,
        this.fechaRegistro,
        this.fechaEliminacion,
        this.img,
        this.cargo,
    });

    bool estado;
    String id;
    String nombre;
    String descripcion;
    // Usuario usuarioId;
    DateTime fechaRegistro;
    DateTime fechaEliminacion;
    String img;
    String cargo;

    factory Participante.fromJson(Map<String, dynamic> json) => Participante(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        // usuarioId: Usuario.fromJson(json["usuario_id"]),
        fechaRegistro:   (json["fecha_registro"])==null? null:  DateTime.parse(json["fecha_registro"]),
        fechaEliminacion:(json["fecha_eliminacion"])==null? null:  DateTime.parse(json["fecha_eliminacion"]),
        img: json["img"],
        cargo: json["cargo"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        // "usuario_id": usuarioId.toJson(),
        "fecha_registro": fechaRegistro.toIso8601String(),
        "fecha_eliminacion": fechaEliminacion.toIso8601String(),
        "img": img,
        "cargo": cargo,
    };
}
