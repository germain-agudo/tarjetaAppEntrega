import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/helpers/mostrar_alerta.dart';

import 'package:app_tarjeta/pages/full_record/s.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/users/external_service.dart';
import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';

import 'package:app_tarjeta/widgets/login-register/custom_input.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class RegisterExternalPage extends StatefulWidget {
  // const RegisterExternalPage({ Key? key }) : super(key: key);

  @override
  _RegisterExternalPageState createState() => _RegisterExternalPageState();
}

class _RegisterExternalPageState extends State<RegisterExternalPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Externo'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return LinearProgressPageIndicatorDemo();
                    //  Scaffold(
                    //   appBar: AppBar(
                    //     title: const Text('Next page'),
                    //   ),
                    //   body: const Center(
                    //     child: Text(
                    //       'This is the next page',
                    //       style: TextStyle(fontSize: 24),
                    //     ),
                    //   ),
                    // );
                  },
                ));
              },
            ),
          ],
        ),
        // backgroundColor: Color(0xffF2F2F2),
        backgroundColor: Components.generalBackgroundColor,
        body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // minHeight: 400,
              minHeight:  MediaQuery.of(context).size.height * 0.8,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               Container(
                 
                 child: Image( 
                   
                      image: AssetImage('assets/logoINJEO.png'),
                      height: 100,
                    ),

               ),
                SizedBox(height: 50,),

                _Form(),
            
              ],
            ),
          ),
        ));
  }

  
}



// FORMULARIO
class _Form extends StatefulWidget {
  // _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
final     nombreCtrl = TextEditingController();
  final   rfcCtrl = TextEditingController();
  final direccionCtrl = TextEditingController();

ExternalService externalService;
AuthService authService;


@override

  void initState() {
    
    super.initState();
  this.authService= Provider.of<AuthService>(context, listen: false);
  this.externalService = Provider.of<ExternalService>(context, listen: false);

 
 
  }







  @override
  Widget build(BuildContext context) {

    // final authService = Provider.of<AuthService>(context);
    // final socketService = Provider.of<SocketService>(context);
// print(roleService.role);
//Todo: acuerdate de regresarlo a su valor original
    return Container(
      margin: EdgeInsets.only(top: 40), //Margen o espacio hacia abajo
      padding: EdgeInsets.symmetric(
          horizontal:
              50), // el espacio de los lados del contenedor de mis inputs
      child: Column(
        children: <Widget>[
          ///Aqui llamammos a nuestro widget que creamos en custom inout

          CustomInput(
            // Correo
            icon: Icons.person,
            placeholder: 'Nombre',
            keyboardType: TextInputType.name,
            textController: nombreCtrl,
          ),
          CustomInput(
            // Correo
            icon: Icons.card_travel_outlined,
            placeholder: 'Rfc',
            keyboardType: TextInputType.text,
            textController: rfcCtrl,
          ),
          CustomInput(
            // Password
            icon: Icons.maps_home_work,
            placeholder: 'direccion',
            keyboardType: TextInputType.text,
            textController: direccionCtrl,
            // isPassword: true,
          ),
    Container(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
          // Todo: Crear boton
          BotonOk(
            //
            text: 'Enviar',
            color: (this.externalService.autenticando)? Colors.blue:Colors.red,
            onPressed:
            (this.externalService.autenticando)
                                ? null 
                                : () async{
                                  final registroOk = await externalService.register(
                                    nombreCtrl.text, 
                                    rfcCtrl.text, 
                                    direccionCtrl.text,
                                    authService.usuario.id
                                    );
                                  if (registroOk==true) {
                                      // Navigator.pushReplacementNamed(context, 'botones');
                                      Navigator.pushReplacementNamed(context, 'loading');
                                  } else {
                                    mostrarAlerta(context, 'Registro incorrecto', registroOk);
                                  }

                                }

            
              
            


            // (authService.autenticando)
            //     ? null
            //     : () async {
            //         print(phoneCtrl.text);
            //         print(emailCtrl.text);
            //         print(passCtrl.text);
            //         final registroOk = await authService.register(   phoneCtrl.text.trim(),  emailCtrl.text.trim(),  passCtrl.text.trim(), roleService.role);
            //         if (registroOk == true) {
                     
            //           Navigator.pushReplacementNamed(context, 'botones');
            //         } else {
            //           mostrarAlerta(context, 'registro incorrecto', registroOk);
            //         }
            //       },


          )
        ],
      ),
    );
  }
}