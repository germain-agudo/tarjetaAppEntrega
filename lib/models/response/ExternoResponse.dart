// To parse this JSON data, do
//
//     final externoResponse = externoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/Externo.dart';

ExternoResponse externoResponseFromJson(String str) => ExternoResponse.fromJson(json.decode(str));

String externoResponseToJson(ExternoResponse data) => json.encode(data.toJson());

class ExternoResponse {
    ExternoResponse({
        this.externo,
    });

    Externo externo;

    factory ExternoResponse.fromJson(Map<String, dynamic> json) => ExternoResponse(
        externo: Externo.fromJson(json["externo"]),
    );

    Map<String, dynamic> toJson() => {
        "externo": externo.toJson(),
    };
}
