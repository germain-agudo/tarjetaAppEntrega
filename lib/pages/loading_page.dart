
import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/pages/menu_principal/botones_page.dart';
import 'package:app_tarjeta/pages/scroll_home.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  // const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Center(
          child: Text('LoadingPage'),
        );
          },
      
      ),
    );
  }

//ESte future va a hacer la validacion
Future checkLoginState(BuildContext context)async{
final authService = Provider.of<AuthService>(context, listen: false);

final autenticado = await authService.isLoggedIn();

if (autenticado) {
  // Navigator.pushReplacementNamed(context, 'botones'); 

  final usuario = authService.usuario;

  if (!usuario.datosCompletos) {

print('datos invalidos');
      switch (usuario.rol) {
        case 'USER_ROLE':
      mostrarAlerta(context, 'user', 'Para mejorar su experiencia es necesario que ');          
  Navigator.pushReplacementNamed(context, 'registerPerson'); 
          
          break;
        case 'ADMIN_ROLE':
      mostrarAlerta(context, 'admin', 'Para mejorar su experiencia es necesario que ');          
          
          break;
        case 'EXTERNO_ROLE':

      mostrarAlerta(context, 'externo', 'Para mejorar su experiencia es necesario que ');          
  Navigator.pushReplacementNamed(context, 'registerExternal'); 
        
          break;

        default:
      // mostrarAlerta(context, usuario.rol, 'datos incompletos');          

Navigator.pushReplacement(
    context, 
    PageRouteBuilder(
      pageBuilder:( _,__,___)=>ScrollHomePage(),
      transitionDuration: Duration(milliseconds: 0)
    )
  );

      }


  }else{
  Navigator.pushReplacement(
    context, 
    PageRouteBuilder(
      pageBuilder:( _,__,___)=>BotonesPage(),
      transitionDuration: Duration(milliseconds: 0)
    )
  );
}





}else{
  // Navigator.pushReplacementNamed(context, 'scroll');

  Navigator.pushReplacement(
    context, 
    PageRouteBuilder(
      pageBuilder:( _,__,___)=>ScrollHomePage(),
      transitionDuration: Duration(milliseconds: 0)
    )
  );
}
}

}
