// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.estado,
        this.datosCompletos,
        this.id,
        this.correo,
        this.rol,
        this.numeroTelefonico,
        this.fechaRegistro,
        this.fechaEliminacion, 
        this.userName,
        this.img,
    });

    bool estado;
    bool datosCompletos;
    String id;
    String correo;
    String rol;
    String numeroTelefonico;
    DateTime fechaRegistro;
    DateTime fechaEliminacion;
    String userName;
    String img;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        estado: json["estado"],
        datosCompletos: json["datos_completos"],
        id: json["_id"],
        correo: json["correo"],
        rol: json["rol"],
        numeroTelefonico: json["numero_telefonico"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
        fechaEliminacion:  DateTime.parse(json["fecha_registro"]),
        userName: json["user_name"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado,
        "datos_completos": datosCompletos,
        "_id": id,
        "correo": correo,
        "rol": rol,
        "numero_telefonico": numeroTelefonico,
        "fecha_registro": fechaRegistro.toIso8601String(),
        "fecha_eliminacion": fechaEliminacion.toIso8601String(),
        "user_name": userName,
        "img": img,
    };
}
