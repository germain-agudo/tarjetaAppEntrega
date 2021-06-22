import 'package:app_tarjeta/routes/routes.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/components/role_service.dart';
import 'package:app_tarjeta/services/users/person_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider( create: (_) => AuthService(), ),
         ChangeNotifierProvider( create: (_) => RoleService(), ),
         ChangeNotifierProvider( create: (_) => PersonService(), ),
      ],
      child: MaterialApp(
//ESto es para cambiar el idioma 
        localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    
  ],

    supportedLocales: [
    const Locale('en', 'US'), // English, no country code
    const Locale('es', 'MX'), // Spanish, no country code
  ],

  
  
///
 theme: ThemeData(
    primarySwatch: Colors.red,
  ),
        title: 'Tarjeta Joven',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}