// To parse this JSON data, do
//
//     final persona = personaFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/Usuario.dart';

Persona personaFromJson(String str) => Persona.fromJson(json.decode(str));

String personaToJson(Persona data) => json.encode(data.toJson());

class Persona {
    Persona({
        this.estado,
        this.id,
        this.nombre,
        this.apellidoPaterno,
        this.apellidoMaterno,
        this.edad,
        this.sexo,
        this.curp,
        this.fechaNacimiento,
        this.municipio,
        this.region,
        this.usuarioId,
        this.fechaRegistro,
    });

    bool estado;
    String id;
    String nombre;
    String apellidoPaterno;
    String apellidoMaterno;
    String edad;
    String sexo;
    String curp;
    String fechaNacimiento;
    String municipio;
    String region;
    String usuarioId;
    DateTime fechaRegistro;

    factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        estado: json["estado"],
        id: json["_id"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellido_paterno"],
        apellidoMaterno: json["apellido_materno"],
        edad: json["edad"],
        sexo: json["sexo"],
        curp: json["curp"],
        fechaNacimiento: json["fecha_nacimiento"],
        municipio: json["municipio"],
        region: json["region"],
        usuarioId:json["usuario_id"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "_id": id,
        "nombre": nombre,
        "apellido_paterno": apellidoPaterno,
        "apellido_materno": apellidoMaterno,
        "edad": edad,
        "sexo": sexo,
        "curp": curp,
        "fecha_nacimiento": fechaNacimiento,
        "municipio": municipio,
        "region": region,
        "usuario_id": usuarioId,
        "fecha_registro": fechaRegistro.toIso8601String(),
    };
}
