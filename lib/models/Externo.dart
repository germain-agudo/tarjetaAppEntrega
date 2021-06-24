// To parse this JSON data, do
//
//     final externo = externoFromJson(jsonString);

import 'dart:convert';

Externo externoFromJson(String str) => Externo.fromJson(json.decode(str));

String externoToJson(Externo data) => json.encode(data.toJson());

class Externo {
    Externo({
        this.estado,
        this.id,
        this.nombre,
        this.rfc,
        this.direccion,
        this.fechaRegistro,
        this.usuarioId,
    });

    bool estado;
    String id;
    String nombre;
    String rfc;
    String direccion;
    DateTime fechaRegistro;
    String usuarioId;

    factory Externo.fromJson(Map<String, dynamic> json) => Externo(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        rfc: json["rfc"],
        direccion: json["direccion"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
        usuarioId: json["usuario_id"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "rfc": rfc,
        "direccion": direccion,
        "fecha_registro": fechaRegistro.toIso8601String(),
        "usuario_id": usuarioId,
    };
}
