import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/widgets/drawer/listaOpciones.dart';
import 'package:flutter/material.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:provider/provider.dart';

class DrawerWidger extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
  
 
    Color _color = Color.fromRGBO(250, 31, 38, 1.0);
    TextStyle _style = TextStyle(
      // color: Colors.red[400],
      fontSize: 50.0,
    );

return Drawer(
  // elevation: 5,
  child: Container(
    // color: Components.generalBackgroundColor,
    child: Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 200,
            child: CircleAvatar(
              child:  ( usuario.img == null)
                        ?Text(usuario.userName.substring(0,2),style: _style,)
                        :AspectRatio(
                          aspectRatio: 1/1,
                          child: ClipOval(
                            child: FadeInImage(
                                // placeholder: AssetImage('assets/gif/loading-inicio.gif'), 
        placeholder: AssetImage('assets/gif/loading-inicio.gif'),

                                image: NetworkImage(usuario.img),
                                // height: double.infinity,
                                // width: double.infinity,
                                fit:BoxFit.cover,
                                alignment: Alignment.center,
                                ),
                          ),
                        ),
              
            ),
          ),

          
        ),
        Expanded(child: SafeArea(child: ListaOpcionesDrawer())),

        ListTile(
          leading: Icon(Icons.exit_to_app, color:Colors.blue),
          title: Text('Salir'),
          trailing:  Icon(Icons.chevron_right, color: Colors.blue,),
          onTap: (){
                       Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();
          },
        )
      ],
    ),
    ),

);





    // return Drawer(
    //   child: SafeArea(
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: <Widget>[
            
    //         Container(
    //           // padding: EdgeInsets.only(left: 10.0, top: 10.0),
    //           child: UserAccountsDrawerHeader(
    //             accountName: Text(
    //             (authService.usuario.userName)==null?'':authService.usuario.userName
    //               ,
    //               style: TextStyle(color: Colors.black, fontSize: 15.0),
    //               textAlign: TextAlign.left,
    //             ),
    //             accountEmail: Text(
    //             (authService.usuario.correo)==null?'':authService.usuario.correo,
      
    //               style: TextStyle(color: Colors.black, fontSize: 15.0),
    //               textAlign: TextAlign.center,
    //             ),
    //             currentAccountPicture: 
    //               ( usuario.img == null)
    //             ? Image(image: AssetImage('assets/no-image.png'))
    //             :Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(100)
                      
    //               ),
                  
    //               child: FadeInImage(
    //                 placeholder: AssetImage('assets/jar-loading.gif'), 
    //                 image: NetworkImage(usuario.img),
    //                 height: double.infinity,
    //                 width: double.infinity,
    //                 fit:BoxFit.cover,
    //                 alignment: Alignment.center,
    //                 ),
    //             ),
                
    //             // ,
    //             // currentAccountPicture:
                
                
                
    //             //  CircleAvatar(
               
      
    //             //   // backgroundImage:
    //             // ),
    //             // decoration: BoxDecoration(color: Colors.white),
    //           ),
    //         ),
          
      
    //         ListTile(
    //           leading: Icon(Icons.card_giftcard, color: _color),
    //           title: Text(
    //             'Noticias',
    //             style: _style,
    //           ),
    //           onTap: () {
    //             Navigator.pushReplacementNamed(context, 'noticias');
    //           },
    //         ),
    //           Divider(),
      
    //           ListTile(
    //           leading: Icon(Icons.exit_to_app, color: _color,),
    //           title: Text(
    //             'Salir',
    //             style: _style,
    //           ),
    //           onTap: () {
    //             Navigator.pushReplacementNamed(context, 'noticias');
    //           },
    //         ),
    //         //   IconButton(
    //         // icon: Icon(Icons.exit_to_app, color: Colors.black87,),           
    //         // onPressed: (){
    //         //   //Desconectarnos
    //         //   Navigator.pushReplacementNamed(context, 'login');
    //         //   AuthService.deleteToken();
    //         // }), 
    //       ],
    //     ),
    //   ),
    // );
  }
}
