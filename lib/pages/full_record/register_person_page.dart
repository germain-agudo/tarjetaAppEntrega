// import 'dart:ui';
import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/components/role_service.dart';
import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';
import 'package:app_tarjeta/widgets/login-register/custom_input.dart';
// import 'package:app_tarjeta/widgets/login-register/labels.dart';
// import 'package:app_tarjeta/widgets/login-register/logo.dart';
import 'package:app_tarjeta/widgets/logo_general.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class RegisterPersonPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffF2F2F2),
        backgroundColor: Components.generalBackgroundColor,

        body: 


SingleChildScrollView(
  child: Column(
    children: [
      Container( height: 300, color: Colors.green, child: Text('dasd'), ),
      Container( height: 300, color: Colors.green, child: Text('dasd'), ),
      
    ],
  ),
)


        // SingleChildScrollView(
        //   physics: BouncingScrollPhysics(),
        //   child: ConstrainedBox(
        //     constraints: BoxConstraints(
        //       minHeight: 650,
        //     ),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children:<Widget> [                
        //         LogoGeneral(
        //           tiutlo: 'Completa tus datos person',
        //         ),
             
        //         // _Form(),              
        //         Text( 'Terminos y condiciones de uso',
        //           style: TextStyle(fontWeight: FontWeight.w200),
        //         )
        //       ],
        //                   ),
        //   ),
        // )
    
    
      //   Stack(
      // children: <Widget>[
      //   PageView(
      //   scrollDirection: Axis.horizontal,          
      //     // controller: controller,
      //     children: <Widget>[
      //     Text( "Your body widgets"),
      //     Text( "Your body widgets")
      //     ],
      //   ),
      //   Container(
      //     alignment: Alignment.bottomCenter,
      //     child: Text("Your widget")
      //   )
      // ],)
        
        );

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
    final RoleService roleService = Provider.of<RoleService>(context, listen: true); 
    final authService = Provider.of<AuthService>(context, listen: true);

//Todo: acuerdate de regresarlo a su valor original
    return Container(
      margin: EdgeInsets.only(top: 40), 
      padding: EdgeInsets.symmetric(    horizontal:     50), 
      child: Column(
        children: <Widget>[    
          PageView(), 

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
