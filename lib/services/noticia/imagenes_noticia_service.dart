
import 'dart:convert';

import 'package:app_tarjeta/global/environments.dart';
import 'package:app_tarjeta/models/images/Imagen.dart';
import 'package:app_tarjeta/models/images/ImagenNoticiaResponse.dart';
import 'package:app_tarjeta/services/auth_service.dart';

import 'package:http/http.dart' as http;

class ImagenNoticiaService{





Future <List<Imagen>> cargarImagenesNoticia( String id)async{
   final uri = Uri.parse('${Environment.apiUrl}/noticias-imgs/noticias/$id');//Para registrar un nuevo usuario

  

    final resp = await http.get(uri,headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});


print(resp.body);
// final decodedData = json.decode(resp.body);
// final imagenes = new ImagenNoticiaResult.fromJson(decodedData['results']);
// print(imagenes);




  final imagenesNoticiaResponse= imagenNoticiaResponseFromJson(resp.body);
final response = imagenesNoticiaResponse.results;

 List<Imagen> imagenes=[];
response.forEach((element) {
  // print(  element.id);
  imagenes.add(element.imagenId);
  // 
  });




return imagenes;





}
}