import 'package:flutter/material.dart';

import 'package:app_tarjeta/bloc/noticias_bloc.dart';
export 'package:app_tarjeta/bloc/noticias_bloc.dart';

class Providers extends InheritedWidget{



// Bloc de las noticias
final _noticiasBloc = new NoticiasBloc(); 




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

  


}