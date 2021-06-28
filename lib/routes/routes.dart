
import 'package:app_tarjeta/pages/full_record/external/register_external_page.dart';
import 'package:app_tarjeta/pages/full_record/person/register_person_page.dart';
import 'package:app_tarjeta/pages/menu_principal/botones_page.dart';
import 'package:app_tarjeta/pages/noticia/agregar_noticia_page.dart';
import 'package:app_tarjeta/pages/noticia/detalle_noticia.dart';
import 'package:app_tarjeta/pages/noticia/noticias_page.dart';
import 'package:app_tarjeta/pages/roles_page.dart';
import 'package:app_tarjeta/pages/scroll_home.dart';
import 'package:flutter/material.dart';

import 'package:app_tarjeta/pages/loading_page.dart';
import 'package:app_tarjeta/pages/login_page.dart';
import 'package:app_tarjeta/pages/register_page.dart';


final Map<String, Widget Function(BuildContext)>appRoutes={
  'loading':( _ ) => LoadingPage(),
  'login':( _ ) => LoginPage(),
  'register':( _ ) => RegisterPage(),
  'scroll':( _ ) => ScrollHomePage(),
  'botones':( _ ) => BotonesPage(),
  'roles':( _ ) =>RolePage(),
  'registerExternal':( _ ) =>RegisterExternalPage(),
  'registerPerson':( _ ) =>RegisterPersonPage(),
  'noticia':( _ ) =>AgregarNoticiaPage(),
  'noticias':( _ ) =>NoticiasPage(),
  'detalleNoticia':( _ ) =>DetalleNoticia(),

};
