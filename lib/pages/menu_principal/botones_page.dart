import 'dart:ui';

import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/widgets/drawer/drawer_widger.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:provider/provider.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;

    return Scaffold(
      drawer: DrawerWidger(),
      appBar: AppBar(
        title: Text(
          (usuario.userName == null) ? 'hola' : usuario.userName,
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        // backgroundColor: Colors.white,

        // leading: IconButton(
        //   icon: Icon(Icons.exit_to_app, color: Colors.black87,),
        //   onPressed: (){
        //     //Desconectarnos
        //     Navigator.pushReplacementNamed(context, 'login');
        //     AuthService.deleteToken();
        //   }),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.check_circle,
              color: Colors.blue[400],
            ),
            // child: Icon(Icons.check_circle, color: Colors.blue[400],),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[_titulos(), _botonesRedondeados()],
            ),
          )
        ],
      ),
      bottomNavigationBar: _buttomNavigationBar(context),
      /* (
          fixedColor: Colors.pink,

          //estas se agregaron
          showSelectedLabels: false,
          showUnselectedLabels: false,
          //estas dos
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: ''),
          ]), */
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [Color.fromRGBO(52, 54, 101, 1.0), Color.fromRGBO(35, 37, 57, 1.0)]),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 350.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 10.0),
            ])),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa,
        ),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ////////////////////////
            Text(
              'Classify transaccion',
              style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Classify this transaccion into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttomNavigationBar(BuildContext context) {
    return new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
            primaryColor: Colors.pinkAccent,
            textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: BottomNavigationBar(showSelectedLabels: false, showUnselectedLabels: false, items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bubble_chart,
                size: 30.0,
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              size: 30.0,
            ),
            label: '',
          ),
        ]));
  }

  Widget _botonesRedondeados() {
    return Table(
      children: <TableRow>[
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
          _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, 'Bus'),
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.pinkAccent, Icons.shop, 'Buy'),
          _crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, 'File'),
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.blueAccent, Icons.movie_filter, 'Entertaiment'),
          _crearBotonRedondeado(Colors.green, Icons.cloud, 'Grocery'),
        ]),
        TableRow(children: <Widget>[
          _crearBotonRedondeado(Colors.red, Icons.collections, 'Photos'),
          _crearBotonRedondeado(Colors.teal, Icons.help_outline, 'Help'),
        ]),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 180,
            //margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(color: Color.fromRGBO(62, 66, 107, 8.7), borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(
                    icono,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                Text(
                  texto,
                  style: TextStyle(color: color),
                ),
                SizedBox(
                  height: 5.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
