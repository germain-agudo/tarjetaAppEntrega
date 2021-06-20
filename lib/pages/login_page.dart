import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';
import 'package:app_tarjeta/widgets/login-register/custom_input.dart';
import 'package:app_tarjeta/widgets/login-register/labels.dart';

import 'package:app_tarjeta/widgets/logo_general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  // const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffF2F2F2),
        backgroundColor: Components.generalBackgroundColor,

  
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              // minHeight: 650,
              minHeight:  MediaQuery.of(context).size.height * 0.4,

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LogoGeneral(
                  tiutlo: 'Login',
                ),
                _Form(),
                Labels(
                  ruta: 'roles',
                  titulo: '¿No tienes cuenta?',
                  subTitulo: 'Crea una ahora!',
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

// FORMULARIO
class _Form extends StatefulWidget {
  // _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
//el listen en false para que provider no intente redibujar el widget y yo no necesito
//
    final authService = Provider.of<AuthService>(context, listen: true);
    // final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40), //Margen o espacio hacia abajo
      padding: EdgeInsets.symmetric(horizontal: 50), // el espacio de los lados del contenedor de mis inputs
      child: Column(
        children: <Widget>[
          ///Aqui llamammos a nuestro widget que creamos en custom inout
          CustomInput(
            // Correo
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            // Password
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            // keyboardType: TextInputType.emailAddress,
            textController: passCtrl,
            isPassword: true,
          ),
          SizedBox( height: 30.0,  ),

          // TODO: Crear boton
          BotonOk(
              // color: Colors.red[400],
              //
              color: (authService.autenticando) ? Colors.blueGrey : Colors.red[400],
              text: 'Ingrese',
              onPressed: (authService.autenticando)
              ? null
              //      : (){
              //        FocusScope.of(context).unfocus(); // va a quitar el focus es decir el tecado
              //   authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
              // }
              // //  (authService.autenticando)
              // //     ? null
                  : () async {

                      FocusScope.of(context)
                          .unfocus(); // va a quitar el focus es decir el tecado
                      final loginOk = await authService.login(
                          emailCtrl.text.trim(), passCtrl.text.trim());
                      if (loginOk) {
                        //TODO:Navegar a otra pantalla
                        // socketService.connect();
                        Navigator.pushReplacementNamed(context, 'botones');
                        print('Todo ok');
                      } else {
                        //Mostrar Alerta
                        mostrarAlerta(context, 'Login incorrecto',
                            'Revise sus credenciales nuevamente');
                      }
                    },
              )
        ],
      ),
    );
  }
}
