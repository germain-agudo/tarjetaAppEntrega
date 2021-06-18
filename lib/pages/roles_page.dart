

import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/widgets/logo_general.dart';
// import 'package:app_tarjeta/widgets/roles_widget/roles_widget.dart';
import 'package:app_tarjeta/widgets/roles_widget/table_widget.dart';
import 'package:flutter/material.dart';

class RolePage extends StatelessWidget {
  // const LoadingPage({ Key? key }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color(0xffF2F2F2),
        backgroundColor: Components.generalBackgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints( minHeight: MediaQuery.of(context).size.height * .9, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget> [
                LogoGeneral( tiutlo: 'Usuario', ),
                TableWidget(),
                Text('terminos y condiciones')
              ],
            ),
          ),
        ));
  }

  
}
