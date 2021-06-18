import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/widgets/logo_general.dart';
// import 'package:app_tarjeta/widgets/scroll_home/LogoScroll_home.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  // const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Components.generalBackgroundColor,
  
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // minHeight: 650,
              minHeight: MediaQuery.of(context).size.height * .9,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            
                LogoGeneral(
                  tiutlo: 'Bienvenido',
                ),
               
          
                
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ));
  }
}