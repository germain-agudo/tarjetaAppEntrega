import 'dart:convert';
import 'dart:io';

import 'package:app_tarjeta/global/environments.dart';
// import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/models/response/NoticiaResponse.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class NoticiaService {

  
  Noticia noticia;
  


  Future<String> crearNoticia( String titulo,  String subtitulo,  String descripcion,  ) async{

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
// final Map<String, dynamic> decodedData = json.decode(resp.body);
// decodedData["usuario"]={ '_id':decodedData["usuario"]};
// final noticiaresponse = noticiaFromJson(json.encode(  decodedData) );
  
  final decodedData = json.decode( resp.body );
  print(decodedData);
    print(decodedData['_id']);
    return decodedData['_id'];
} else {
  return 'false';
}


  }




  Future<bool> editarNoticia( String titulo,  String subtitulo,  String descripcion, String producto_id ) async{

final data ={
  'titulo': titulo,
  'subtitulo':subtitulo,
  'descripcion':descripcion,  
};

  
  final uri = Uri.parse('${Environment.apiUrl}/noticias/$producto_id');//Para registrar un nuevo usuario


final resp = await http.put(uri, body: jsonEncode(data), 
headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});

print(resp.body);

if (resp.statusCode==201) {

  final decodedData = json.decode( resp.body );
  print(decodedData);
    return true;
} else {
  return false;
}


  }









// Future <List<NoticiaService>> cargarNoticias()async{
//    final uri = Uri.parse('${Environment.apiUrl}/noticias');//Para registrar un nuevo usuario

//     final resp = await http.get(uri);

//     // final decodedData = json.decode(resp.body);

    


// // print(json.decode(resp.body));


// final noticiaResponse = noticiaResponseFromJson(resp.body);
// final response = noticiaResponse.noticias;


// if (response==null)  return [];




// // print(response);
// //     final Map<String, dynamic> decodedData = json.decode(resp.body);
// // if ( decodedData == null ) return [];
// // decodedData.forEach((id, not) {
// //   print(id);
// // });

// return [];

// }




Future <List<Noticia>> cargarNoticias()async{
   final uri = Uri.parse('${Environment.apiUrl}/noticias?limite=10');//Para registrar un nuevo usuario
try {
  

    final resp = await http.get(uri,headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
});

  final noticiaResponse = noticiaResponseFromJson(resp.body);
final response = noticiaResponse.noticias;

if (noticiaResponse==null)  return [];
if (response==null)  return [];
// print(noticiaResponse.noticias);
return response;


} catch (e) {
  print(e);

//  return[];
}


}



Future<int> borrarNoticia( String id )async{

    final uri = Uri.parse('${Environment.apiUrl}/noticias/$id');//Para registrar un nuevo usuario
try {
final resp = await http.delete(uri,
headers: {
    'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
}
);

//  print( json.decode( resp.body ));

if (resp.statusCode==200) {
 print( json.decode( resp.body ));
 return 1;
}else{
 print( json.decode( resp.body ));

return 2;
}

} catch (error) {
  print(error);
}




} 









Future <String> subirImagen( File imagen, String id) async{
    final uri = Uri.parse('${Environment.apiUrl}/uploads/noticias/$id');//Para registrar un nuevo usuario

final mineType = mime(imagen.path).split('/'); //image/jpeg
final imageUploadRequest = http.MultipartRequest(
'PUT',
uri,

);
// 'x-token': await AuthService.getToken()
// Map<String, String> headers = { "Accesstoken": "access_token"};
// imageUploadRequest.headers.addAll(headers);



imageUploadRequest.headers['x-token']=await AuthService.getToken();
final file = await http.MultipartFile.fromPath(

  'archivo', 
  imagen.path,
  contentType: MediaType(mineType[0], mineType[1]), 
  
     
  );


imageUploadRequest.files.add(file);


final streamREsponse = await  imageUploadRequest.send();

final resp = await http.Response.fromStream(streamREsponse);

if (resp.statusCode != 200 && resp.statusCode != 201 ) {
  print('algo Salio mal');
  print(resp.body);
return null;
}

final respData = json.decode(resp.body);
print(respData);
return respData['img'];






}

}