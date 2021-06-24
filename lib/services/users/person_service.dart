import 'dart:convert';
import 'package:app_tarjeta/models/Person.dart';

import 'package:app_tarjeta/models/response/PersonaResponse.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_tarjeta/global/environments.dart';


// import 'package:app_tarjeta/models/Usuario.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class PersonService with ChangeNotifier {
  // 




  Persona persona;
  bool _autenticando = false; //esta es para bloquear el boton de login ciando se este haicendo una petiion

// Create storage
  // final _storage = new FlutterSecureStorage();

bool get autenticando => this._autenticando;

set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners(); // Notifica a todos los que esten escuhando la propiedad _autemticando para que se redibuje
  }






// Para El registro

  Future register(
    String nombre, 
    String apellidoPaterno, 
    String apellidoMaterno, 
    String sexo, 
    String curp, 
    String fechaNacimiento ,
    String municipio,
    String region,
    String usuarioId,
    
    ) async {
    this.autenticando = true; // verificar los listeners

    final data = {
      'nombre': nombre,
      'apellido_paterno':apellidoPaterno,
      'apellido_materno':apellidoMaterno,
      'sexo':sexo,
      'curp':curp,
      'fecha_nacimiento':fechaNacimiento,
      'municipio':municipio,
      'region':region,
      'usuario_id':usuarioId,
      
      
    };

    final uri = Uri.parse('${Environment.apiUrl}/personas');//Para registrar un nuevo usuario

//haremos la peticion
    final resp = await http.post(uri, body: jsonEncode(data), //datos
        headers: {
          //tipo a enviar
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });

//Validar el status
    // print(resp.body);

    this.autenticando = false; //notifica listeners

    if (resp.statusCode == 200) {
      final personaResponse =personaResponseFromJson(resp.body);
      this.persona = personaResponse.persona;
      //Guardar Token en lugar seguro
      // await this._guardarToken(loginResponse.token);
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      if (respBody['msg']!= null) {
          // print(respBody['msg']);
          return respBody['msg'];

      } else {
      // print(respBody['errors'][0]['msg']);
        return respBody['errors'][0]['msg'];
      }
  // print(respBody['errors']);

      // return resp
      // Body['errors'][0]['msg'];
    }

}

    
  }






