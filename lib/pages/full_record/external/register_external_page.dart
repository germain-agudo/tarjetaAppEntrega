import 'package:app_tarjeta/global/components.dart';

import 'package:app_tarjeta/pages/full_record/s.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/components/role_service.dart';
import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';

import 'package:app_tarjeta/widgets/login-register/custom_input.dart';

import 'package:app_tarjeta/widgets/logo_general.dart';
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
              minHeight:  MediaQuery.of(context).size.height * 0.9,
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


  @override
  Widget build(BuildContext context) {
    final RoleService roleService = Provider.of<RoleService>(context, listen: true); //que este pendiente de todos los cambios que emita provider
    final authService = Provider.of<AuthService>(context, listen: true);

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
            isPassword: true,
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
            color: Colors.red[400],
            onPressed: (){

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