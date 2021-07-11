// To parse this JSON data, do
//
//     final participanteNoticiaResponse = participanteNoticiaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/Participante.dart';

ParticipanteNoticiaResponse participanteNoticiaResponseFromJson(String str) => ParticipanteNoticiaResponse.fromJson(json.decode(str));

String participanteNoticiaResponseToJson(ParticipanteNoticiaResponse data) => json.encode(data.toJson());

class ParticipanteNoticiaResponse {
    ParticipanteNoticiaResponse({
        this.noticia,
        this.total,
        this.results,
    });

    String noticia;
    int total;
    List<Result> results;

    factory ParticipanteNoticiaResponse.fromJson(Map<String, dynamic> json) => ParticipanteNoticiaResponse(
        noticia: json["noticia"],
        total: json["total"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "noticia": noticia,
        "total": total,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.participanteId,
    });

    String id;
    Participante participanteId;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        participanteId: Participante.fromJson(json["participante_id"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "participante_id": participanteId.toJson(),
    };
}
