import 'dart:ui';

import 'package:app_tarjeta/global/components.dart';
import 'package:flutter/material.dart';

class TableContent extends StatelessWidget {
  // const TableContent({ Key? key }) : super(key: key);
final Color color;
final IconData icono;
final String texto;

  const TableContent(
     this.color, 
     this.icono, 
     this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 180,
            //margin: EdgeInsets.all(15.0),
            // decoration: BoxDecoration(color: Color.fromRGBO(62, 66, 107, 8.7), borderRadius: BorderRadius.circular(20.0)),
            decoration: BoxDecoration(
              color: Components.tableBackground, 
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox( height: 5.0,       ),
                CircleAvatar(
                  backgroundColor: color,
                  // maxRadius: 40,
                  maxRadius: MediaQuery.of(context).size.height * 0.04,
                  child: Icon(
                    icono,
                    color: Colors.white,
                    // size: 30.0,
                    size:MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
                Text(  texto, style: TextStyle(color: color, fontSize: 16),   ),
                SizedBox( height: 5.0,  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}