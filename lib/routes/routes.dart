
import 'package:app_tarjeta/pages/full_record/register_external_page.dart';
import 'package:app_tarjeta/pages/full_record/register_person_page.dart';
import 'package:app_tarjeta/pages/menu_principal/botones_page.dart';
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

};
