import 'package:flutter/material.dart';


class NoticiasPage extends StatelessWidget {
  // const NoticiasPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
        
      ),
      body: Container(),
      floatingActionButton: _crearBoton(context),
    );
  }

  _crearBoton(BuildContext context){
    return FloatingActionButton(
      backgroundColor: Colors.red[700],
      child:  Icon(Icons.add),
      onPressed:()=>Navigator.pushNamed(context, 'noticia'),
       );
  }
}