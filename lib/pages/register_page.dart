// import 'dart:ui';
import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/components/role_service.dart';
import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';
import 'package:app_tarjeta/widgets/login-register/custom_input.dart';
import 'package:app_tarjeta/widgets/login-register/labels.dart';
// import 'package:app_tarjeta/widgets/login-register/logo.dart';
import 'package:app_tarjeta/widgets/logo_general.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class RegisterPage extends StatelessWidget {

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
                  tiutlo: 'Register',
                ),
                _Form(),
                Labels(
                  ruta: 'login',
                  titulo: '¿Ya tienes una cuenta?',
                  subTitulo: 'Ingresa ahora!',
                ),
                Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ));

/*     Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          //El safeArea es un Widget que nos va a ayudar para daber si tiene un notch que nos estorve, y asi bajarlo un poco
          child: SingleChildScrollView(
            // Para que podamos hacer scroll
            physics:
                BouncingScrollPhysics(), //Para que se vea el efecto como si revotara al hacer scroll
            child: Container(
              // este container es para que mi contenido no quede apretado
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, //Para que mi contenido se disperse por toda la pantalla
                children: <Widget>[
                  Logo(),
                  _Form(),
                  Labels(),
                  Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        )); */
  }
}

// LOGO

// FORMULARIO
class _Form extends StatefulWidget {
  // _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

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
            icon: Icons.local_phone_outlined,
            placeholder: 'Numero Telefonico',
            keyboardType: TextInputType.phone,
            textController: phoneCtrl,
          ),
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

          // Todo: Crear boton
          BotonOk(
            //
            text: 'crear cuenta',
            color: Colors.red[400],
            onPressed: 
              
            


            (authService.autenticando)
                ? null
                : () async {
                    print(phoneCtrl.text);
                    print(emailCtrl.text);
                    print(passCtrl.text);
                    final registroOk = await authService.register(   phoneCtrl.text.trim(),  emailCtrl.text.trim(),  passCtrl.text.trim(), roleService.role);
                    if (registroOk == true) {
                     
                      Navigator.pushReplacementNamed(context, 'botones');
                    } else {
                      mostrarAlerta(context, 'registro incorrecto', registroOk);
                    }
                  },


          )
        ],
      ),
    );
  }
}

// LABELS
