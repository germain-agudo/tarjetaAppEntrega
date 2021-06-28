import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';



import 'package:app_tarjeta/pages/noticia/noticias_page.dart';
// import 'package:flutter/cupertino.dart';

final pageRoutes=<_RouteDrawer>[
  _RouteDrawer( FontAwesomeIcons.slideshare, 'Noticias', NoticiasPage()),

];






class _RouteDrawer{

  final IconData icon;
  final String titulo;
  final Widget page;

  _RouteDrawer(this.icon, this.titulo, this.page);

}