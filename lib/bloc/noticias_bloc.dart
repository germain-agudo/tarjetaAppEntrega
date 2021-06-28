

import 'dart:io';

import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/services/noticia_service.dart';
import 'package:rxdart/rxdart.dart';

class NoticiasBloc {

final _noticiasController = new BehaviorSubject<List<Noticia>>();
final _cargandoController = new BehaviorSubject<bool>();
final _noticiaService = new NoticiaService();

Stream<List<Noticia>> get noticiasStream => _noticiasController.stream;
Stream<bool> get cargando => _cargandoController.stream;


void cargarNoticias()async{
  final noticias = await _noticiaService.cargarNoticias();
_noticiasController.sink.add(noticias);
}

//  Agregar un nuevo producto
Future crearNoticia(String titulo,  String subtitulo,  String descripcion, ){
_cargandoController.sink.add(true);
final id =  _noticiaService.crearNoticia(titulo, subtitulo, descripcion);
_cargandoController.sink.add(false);
return id; 
}

// subir fotografia
Future<String> subirImagen(File imagen, String id )async{
_cargandoController.sink.add(true);
final imgUrl= await _noticiaService.subirImagen(imagen, id.toString());
_cargandoController.sink.add(false); 

// print(imgUrl);
return imgUrl;
}


//  Editar un nuevo producto
void editarNoticia(String titulo,  String subtitulo,  String descripcion, String id)async{
_cargandoController.sink.add(true);
await _noticiaService.editarNoticia(titulo, subtitulo, descripcion, id);
_cargandoController.sink.add(false); 
}


//  Eliminar un nuevo producto
Future borrarNoticia( String id)async{
await _noticiaService.borrarNoticia(id);
}





dispose(){
  _noticiasController?.close();
  _cargandoController?.close();
}

}

