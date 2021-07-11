import 'dart:convert';
// import 'dart:io';

import 'package:app_tarjeta/global/environments.dart';
// import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
// import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/models/Participante.dart';
import 'package:app_tarjeta/models/detalles/Participante-Noticia-Response.dart';
// import 'package:app_tarjeta/models/response/ParticipanteResponse.dart';
// import 'package:app_tarjeta/models/response/NoticiaResponse.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:http/http.dart' as http;


class ParticipanteService {

  
  Participante participante;
  
  
bool _autenticando = false; //esta es para bloquear el boton de login ciando se este haicendo una petiion
bool get autenticando => this._autenticando;  
set autenticando(bool valor) {
    this._autenticando = valor;
  }

  Future<String> crear( String nombre,  String descripcion,  ) async{
final data ={
  'nombre': nombre,
  'descripcion':descripcion,
};

  final uri = Uri.parse('${Environment.apiUrl}/participantes');//Para registrar un nuevo usuario

final resp = await http.post(uri, body: jsonEncode(data), 
headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});

// print(resp.body);

this.autenticando= false;

if (resp.statusCode==201 || resp.statusCode==200) {
// final Map<String, dynamic> decodedData = json.decode(resp.body);
// decodedData["usuario"]={ '_id':decodedData["usuario"]};
// final noticiaresponse = noticiaFromJson(json.encode(  decodedData) );
  
  final decodedData = json.decode( resp.body );
  // print(decodedData);
    // print(decodedData['_id']);
    return decodedData['_id'];
} else {
      final respBody = jsonDecode(resp.body);
  // return 'false';
      return respBody['errors'][0]['msg'];
}


  }




//   Future<bool> editarNoticia( String titulo,  String subtitulo,  String descripcion, producto_id ) async{

// final data ={
//   'titulo': titulo,
//   'subtitulo':subtitulo,
//   'descripcion':descripcion,  
// };

  
//   final uri = Uri.parse('${Environment.apiUrl}/noticias/$producto_id');//Para registrar un nuevo usuario


// final resp = await http.put(uri, body: jsonEncode(data), 
// headers: {
//     'Content-Type': 'application/json',
//           'x-token': await AuthService.getToken()
// });

// print(resp.body);

// if (resp.statusCode==201) {

//   final decodedData = json.decode( resp.body );
//   print(decodedData);
//     return true;
// } else {
//   return false;
// }


//   }








Future detalleParticipante (String id) async{
   final uri = Uri.parse('${Environment.apiUrl}/participantes/$id');//Para registrar un nuevo usuario

try{

    final resp = await http.get(uri,headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});




// print(resp.body);
  final decodedData = participanteFromJson(resp.body);
  // print(decodedData);

return decodedData; 
}catch(e){

}

}




















Future <List<Participante>> cargarParticipantesNoticia( String id)async{
   final uri = Uri.parse('${Environment.apiUrl}/participantes-noticias/noticias/$id');//Para registrar un nuevo usuario

  

    final resp = await http.get(uri,headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});

// print(resp.body);
//  final respBody = jsonDecode(resp.body);


// final noticiaresponse = resultFromJson(  json.encode(respBody['results'].toString()) )  as Map<String, dynamic>;  
// final Map<String, dynamic> decodedData = json.decode(resp.body);

// final Map<String, dynamic> d = decodedData.remove('results')  ;

// d.forEach((key, value) {
//   print(key);
// });


// final noticiaresponse = resultFromJson(  json.decode(jsonEncode(d) ) ) as Map <String, dynamic>;  



//  final respBody = jsonDecode(resp.body[0]);
//  final dd = respBody['results'];

// final Map<String, dynamic> decodedData = json.decode(resp.body);
// decodedData["usuario"]={ '_id':decodedData["usuario"]};
// final noticiaresponse = noticiaFromJson(json.encode(  decodedData) );
  
// final Map<String, dynamic> decodedData = json.decode(jsonEncode(dd));


// final noticiaresponse = resultFromJson(json.encode(  decodedData['results'].toString()) );


// final resultElement = resultFromJson( jsonEncode(decodedData['results']));
// final resu = resultElement.

// print(resultElement);

  final participanteNoticiaResponse = participanteNoticiaResponseFromJson(resp.body);
final response = participanteNoticiaResponse.results;


 List<Participante> participantes=[];
response.forEach((element) {
  // print(  element.participanteId);
  participantes.add(element.participanteId);
  
  });


// final participates = response['participanteId'];
//  final respBody = jsonDecode(resp.body);
  // return 'false';
      // print( respBody['results']);
      // final i = respBody['results'];
// print(i[0]);


return participantes;


}



// Future<int> borrarNoticia( String id )async{

//     final uri = Uri.parse('${Environment.apiUrl}/noticias/$id');//Para registrar un nuevo usuario
// try {
// final resp = await http.delete(uri,
// headers: {
//     'Content-Type': 'application/json',
//           'x-token': await AuthService.getToken()
// }
// );

// //  print( json.decode( resp.body ));

// if (resp.statusCode==200) {
//  print( json.decode( resp.body ));
//  return 1;
// }else{
//  print( json.decode( resp.body ));

// return 2;
// }

// } catch (error) {
//   print(error);
// }




// } 









// Future <String> subirImagen( File imagen, String id) async{
//     final uri = Uri.parse('${Environment.apiUrl}/uploads/noticias/$id');//Para registrar un nuevo usuario

// final mineType = mime(imagen.path).split('/'); //image/jpeg
// final imageUploadRequest = http.MultipartRequest(
// 'PUT',
// uri,

// );
// // 'x-token': await AuthService.getToken()
// // Map<String, String> headers = { "Accesstoken": "access_token"};
// // imageUploadRequest.headers.addAll(headers);



// imageUploadRequest.headers['x-token']=await AuthService.getToken();
// final file = await http.MultipartFile.fromPath(

//   'archivo', 
//   imagen.path,
//   contentType: MediaType(mineType[0], mineType[1]), 
  
     
//   );


// imageUploadRequest.files.add(file);


// final streamREsponse = await  imageUploadRequest.send();

// final resp = await http.Response.fromStream(streamREsponse);

// if (resp.statusCode != 200 && resp.statusCode != 201 ) {
//   print('algo Salio mal');
//   print(resp.body);
// return null;
// }

// final respData = json.decode(resp.body);
// print(respData);
// return respData['img'];






// }

}