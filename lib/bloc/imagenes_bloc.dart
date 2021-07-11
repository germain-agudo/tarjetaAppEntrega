


import 'package:app_tarjeta/models/images/Imagen.dart';
import 'package:app_tarjeta/services/noticia/imagenes_noticia_service.dart';
import 'package:rxdart/rxdart.dart';

class ImagenesBloc {

final _imagenesNoticiaController = new BehaviorSubject<List<Imagen>>();
final _cargandoController = new BehaviorSubject<bool>();
final _imageneNoticiaService = new ImagenNoticiaService();

Stream<List<Imagen>> get imagenesNoticiasStream => _imagenesNoticiaController.stream;
Stream<bool> get cargando => _cargandoController.stream;


Future <List<Imagen>> cargar(String id)async{
  final imagenesNoticia = await _imageneNoticiaService.cargarImagenesNoticia(id);
_imagenesNoticiaController.sink.add(imagenesNoticia);
return imagenesNoticia;
}



dispose(){
  _imagenesNoticiaController?.close();
  _cargandoController?.close();
}

}

