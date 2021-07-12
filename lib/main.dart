import 'dart:io';


import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/routes/routes.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/components/role_service.dart';
import 'package:app_tarjeta/services/provider.dart';
import 'package:app_tarjeta/services/users/external_service.dart';
import 'package:app_tarjeta/services/users/person_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    if ( Platform.isAndroid ) {
      SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      // statusBarColor: Colors.red[900],
      statusBarColor: Colors.transparent,
      // statusBarColor: Color(0xffF2F2F2)
      ));


      
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     systemNavigationBarColor: Colors.white, // navigation bar color
    //     statusBarColor: Colors.transparent, // status bar color
    //     statusBarIconBrightness: Brightness.light, // status bar icons' color
    //     systemNavigationBarIconBrightness: Brightness.light, //navigation bar icons' color
    
    // ));
    } else if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white
      ));     
    }
    
    return  MultiProvider (


providers: [
         ChangeNotifierProvider( create: (BuildContext context) => AuthService(), ),
         ChangeNotifierProvider( create: (BuildContext context) => RoleService(), ),
         ChangeNotifierProvider( create: (BuildContext context) => PersonService(), ),
         ChangeNotifierProvider( create: (BuildContext context) => ExternalService(), ),
         

      ],


      child: Providers(

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
          
          // backgroundColor: Colors.red[400]
          appBarTheme: AppBarTheme(
        backgroundColor: Components.titleFontColor
          
          )
          
        ),
          title: 'Tarjeta Joven',
          initialRoute: 'loading',
          routes: appRoutes,
        ),
      ),
    );
  }
}