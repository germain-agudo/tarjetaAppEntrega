import 'package:app_tarjeta/routes/drawer_routes.dart';
import 'package:flutter/material.dart';
// import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListaOpcionesDrawer extends StatelessWidget {
  // const ListaOpcionesDrager({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i)=> Divider(
        color:  Colors.red,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder:(context, i)=>ListTile(
        leading: FaIcon( pageRoutes[i].icon , color: Colors.blue,),
        title: Text(pageRoutes[i].titulo),
        trailing: Icon(Icons.chevron_right, color: Colors.blue,),
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>pageRoutes[i].page ));
            // Navigator.pushReplacementNamed(context, routeName)
        },
      ) , 
      );

  }
}