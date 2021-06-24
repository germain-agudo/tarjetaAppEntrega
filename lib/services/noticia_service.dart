import 'dart:convert';

import 'package:app_tarjeta/global/environments.dart';
import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:http/http.dart' as http;


class NoticiaService {
  Noticia noticia;
  
  Future<bool> crearNoticia(
    String titulo,
    String subtitulo,
    String descripcion,
  ) async{


final data ={
  'titulo': titulo,
  'subtitulo':subtitulo,
  'descripcion':descripcion,
  
};

  
  
  final uri = Uri.parse('${Environment.apiUrl}/noticias');//Para registrar un nuevo usuario




final resp = await http.post(uri, body: jsonEncode(data), 
headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});

print(resp.body);


if (resp.statusCode==201) {
    final response = noticiaFromJson(resp.body);
    this.noticia = response;
    return true;
} else {
  return false;
}



  }





}