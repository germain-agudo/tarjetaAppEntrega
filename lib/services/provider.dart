import 'package:app_tarjeta/bloc/imagenes_bloc.dart';
import 'package:app_tarjeta/bloc/participantes_bloc.dart';
import 'package:flutter/material.dart';

import 'package:app_tarjeta/bloc/noticias_bloc.dart';
export 'package:app_tarjeta/bloc/noticias_bloc.dart';

class Providers extends InheritedWidget{



// Bloc de las noticias
final _noticiasBloc = new NoticiasBloc(); 
final _participantesBloc = new ParticipantesBloc(); 
final _imagenesNoticiaBloc = new ImagenesBloc();



static Providers _instancia;


 factory Providers({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Providers._internal(key: key, child: child);
    }
    return _instancia;
  }





  Providers._internal({Key key, Widget child}) : super(key: key, child: child);


@override
   bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;



///

  static NoticiasBloc noticiasBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Providers>()._noticiasBloc;
  }

  static ParticipantesBloc participantesBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Providers>()._participantesBloc;
  }

  static ImagenesBloc imagenesNoticia(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Providers>()._imagenesNoticiaBloc;
  }

  


}