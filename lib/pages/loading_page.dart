
// import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/pages/menu_principal/botones_page.dart';
import 'package:app_tarjeta/pages/scroll_home.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  // const LoadingPage({ Key? key }) : super(key: key);
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


   
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //  key: _scaffoldKey,
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
                
              
        
                return Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Text('Espere...'),
              SizedBox(height: 10.0,),
                 CircularProgressIndicator(),
                                Image.asset('assets/gif/loading-inicio.gif')


            ],
          ),



        );
          },
      
      ),
    );
  }

//ESte future va a hacer la validacion
Future checkLoginState(BuildContext context)async{
try {
  
final authService = Provider.of<AuthService>(context, listen: false);

final autenticado = await authService.isLoggedIn();

if (autenticado) {
  // Navigator.pushReplacementNamed(context, 'botones'); 

  final usuario = authService.usuario;

  if (!usuario.datosCompletos) {

// print('datos invalidos');
      switch (usuario.rol) {
        case 'USER_ROLE':
      // mostrarAlerta(context, 'user', 'Para mejorar su experiencia es necesario que ');          
  Navigator.pushReplacementNamed(context, 'registerPerson'); 
  // Navigator.pushReplacementNamed(context, 'registerExternal'); 

          
          break;
        case 'ADMIN_ROLE':
  Navigator.pushReplacementNamed(context, 'registerPerson'); 

      // mostrarAlerta(context, 'admin', 'Para mejorar su experiencia es necesario que ');          
          
          break;
        case 'EXTERNO_ROLE':

      // mostrarAlerta(context, 'externo', 'Para mejorar su experiencia es necesario que ');          
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
      // pageBuilder:( _,__,___)=>SegundoPage(),
      // pageBuilder:( _,__,___)=>NoticiasPage(),
      transitionDuration: Duration(milliseconds: 0)
    )
  );

//  Navigator.pushReplacement(
//       context, 
//       PageRouteBuilder(
//         pageBuilder: (context, __,___) => SegundoPage(),
//         transitionDuration: Duration(seconds: 0),
//     ),
// );

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


} catch (e) {
}


}

}
