// To parse this JSON data, do
//
//     final redParticipanteResponse = redParticipanteResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/redes/Red.dart';

RedParticipanteResponse redParticipanteResponseFromJson(String str) => RedParticipanteResponse.fromJson(json.decode(str));

String redParticipanteResponseToJson(RedParticipanteResponse data) => json.encode(data.toJson());

class RedParticipanteResponse {
    RedParticipanteResponse({
        this.participante,
        this.total,
        this.results,
    });

    String participante;
    int total;
    List<Result> results;

    factory RedParticipanteResponse.fromJson(Map<String, dynamic> json) => RedParticipanteResponse(
        participante: json["participante"],
        total: json["total"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "participante": participante,
        "total": total,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.redId,
        this.url,
    });

    String id;
    Red redId;
    String url;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        redId: Red.fromJson(json["red_id"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "red_id": redId.toJson(),
        "url": url,
    };
}
