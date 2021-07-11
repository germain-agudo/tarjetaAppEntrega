

// import 'dart:io';

import 'package:app_tarjeta/models/Participante.dart';
import 'package:app_tarjeta/models/redes/Red.dart';
import 'package:app_tarjeta/services/noticia/participante_service.dart';
import 'package:app_tarjeta/services/redes/redes_service.dart';
import 'package:rxdart/rxdart.dart';

class ParticipantesBloc {

final _participanteController = new BehaviorSubject<List<Participante>>();
final _cargandoController = new BehaviorSubject<bool>();
final _participanteService = new ParticipanteService();
final _redesService = new RedesService();

Stream<List<Participante>> get participantesStream => _participanteController.stream;
Stream<bool> get cargando => _cargandoController.stream;


Future <List<Participante>>cargar(String id)async{
  final participante = await _participanteService.cargarParticipantesNoticia(id);
_participanteController.sink.add(participante);
return participante;
}

Future detalleParticipante(String id)async{
final detalleParticipante = await _participanteService.detalleParticipante(id);   
return detalleParticipante;
} 


Future <List<Red>> cargarRedParticipante(String id)async {
final redParticipante = await _redesService.cargarRedParticipante(id);
return redParticipante;

} 
// //  Agregar un nuevo producto
// Future crear(String titulo,  String subtitulo,  String descripcion, ){
// _cargandoController.sink.add(true);
// final id =  _participanteService.crearNoticia(titulo, subtitulo, descripcion);
// _cargandoController.sink.add(false);
// return id; 
// }

// // subir fotografia
// Future<String> subirImagen(File imagen, String id )async{
// _cargandoController.sink.add(true);
// final imgUrl= await _participanteService.subirImagen(imagen, id.toString());
// _cargandoController.sink.add(false); 

// // print(imgUrl);
// return imgUrl;
// }


// //  Editar un nuevo producto
// void editarNoticia(String titulo,  String subtitulo,  String descripcion, String id)async{
// _cargandoController.sink.add(true);
// await _participanteService.editarNoticia(titulo, subtitulo, descripcion, id);
// _cargandoController.sink.add(false); 
// }


// //  Eliminar un nuevo producto
// Future borrarNoticia( String id)async{
// await _participanteService.borrarNoticia(id);
// }





dispose(){
  _participanteController?.close();
  _cargandoController?.close();

}

}

