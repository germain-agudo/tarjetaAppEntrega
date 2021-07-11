// To parse this JSON data, do
//
//     final redListResponse = redListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/redes/Red.dart';

RedListResponse redListResponseFromJson(String str) => RedListResponse.fromJson(json.decode(str));

String redListResponseToJson(RedListResponse data) => json.encode(data.toJson());

class RedListResponse {
    RedListResponse({
        this.total,
        this.redes,
    });

    int total;
    List<Red> redes;

    factory RedListResponse.fromJson(Map<String, dynamic> json) => RedListResponse(
        total: json["total"],
        redes: List<Red>.from(json["redes"].map((x) => Red.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "redes": List<dynamic>.from(redes.map((x) => x.toJson())),
    };
}
