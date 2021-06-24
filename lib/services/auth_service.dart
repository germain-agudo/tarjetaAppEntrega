import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:app_tarjeta/global/environments.dart';

import 'package:app_tarjeta/models/login_response.dart';
import 'package:app_tarjeta/models/Usuario.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class AuthService with ChangeNotifier {
  // 




  Usuario usuario;
  bool _autenticando = false; //esta es para bloquear el boton de login ciando se este haicendo una petiion

// Create storage
  final _storage = new FlutterSecureStorage();

bool get autenticando => this._autenticando;

set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners(); // Notifica a todos los que esten escuhando la propiedad _autemticando para que se redibuje
  }






//ESto es para autenticar


//Este future va a regresar un true si todo sale bien y n false si sale mal
  Future login<bool>(String correo, String password) async {
    this.autenticando = true;

    final data = {'correo': correo, 'password': password};

    ///Convertimos la url
    final uri = Uri.parse('${Environment.apiUrl}/auth/login');

//aremos la peticion
    final resp = await http.post(uri, body: jsonEncode(data), //datos
        headers: {
          //tipo a enviar
          'Content-Type': 'application/json'
        });

//Validar el status
    print(resp.body);

    this.autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      //Guardar Token en lugar seguro
      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }



// Para El registro

  Future register(String numeroTelefonico, String correo, String password,String rol) async {
    this.autenticando = true; // verificar los listeners

    final data = {
      'numero_telefonico': numeroTelefonico,
      'correo': correo,
      'password': password,
      'rol':rol
    };

    final uri = Uri.parse('${Environment.apiUrl}/usuarios');//Para registrar un nuevo usuario

//haremos la peticion
    final resp = await http.post(uri, body: jsonEncode(data), //datos
        headers: {
          //tipo a enviar
          'Content-Type': 'application/json'
        });

//Validar el status
    // print(resp.body);

    this.autenticando = false; //notifica listeners

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      //Guardar Token en lugar seguro
      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
  // print(respBody['errors'][0]['msg']);

      return respBody['errors'][0]['msg'];
    }
  }


//////VAlidar si existe mi token almacenado
  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: 'token');

// print(token);
    final uri = Uri.parse('${Environment.apiUrl}/auth/renew');

    final resp = await http.get(uri, headers: {
      //tipo a enviar
      'Content-Type': 'application/json',
      'x-token': token
    });

//Validar el status
    print(resp.body);

    this.autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body); //el usuario nuevo
      this.usuario = loginResponse.usuario;//lo instanciamos
      //Guardar Token en lugar seguro
      await this._guardarToken(loginResponse.token);//nueva vida al token
      return true;
    } else {
      this.logout();
      return false;
    }
  }


// Guardar token
  Future _guardarToken(String token) async {
    // Write value
    return await _storage.write(key: 'token', value: token);
  }

// Eliminar el token
  Future logout() async {
    await _storage.delete(key: 'token');
  }


//Getter del token de forma estática
  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

// eliminar token de forma estática
  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }




}
