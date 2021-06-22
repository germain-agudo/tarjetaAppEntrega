// To parse this JSON data, do
//
//     final personaResponse = personaResponseFromJson(jsonString);

import 'dart:convert';

import 'package:app_tarjeta/models/Person.dart';

PersonaResponse personaResponseFromJson(String str) => PersonaResponse.fromJson(json.decode(str));

String personaResponseToJson(PersonaResponse data) => json.encode(data.toJson());

class PersonaResponse {
    PersonaResponse({
        this.persona,
    });

    Persona persona;

    factory PersonaResponse.fromJson(Map<String, dynamic> json) => PersonaResponse(
        persona: Persona.fromJson(json["persona"]),
    );

    Map<String, dynamic> toJson() => {
        "persona": persona.toJson(),
    };
}

