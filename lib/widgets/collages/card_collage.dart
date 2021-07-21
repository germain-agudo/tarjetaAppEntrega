import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardCollageWidget extends StatelessWidget {
  // const CardCollageWidget({ Key? key }) : super(key: key);
final String primeraImagen ;
final String segundaImagen ;
final String terceraImagen ;
final String texto ;

  const CardCollageWidget(
    {
     @required this.primeraImagen, 
     @required this.segundaImagen, 
     @required this.terceraImagen, 
     @required this.texto
    }
  );

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Row(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.only(left: 100),
            margin: EdgeInsets.only(left: 25),
            height: 260,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundColor: Colors.blue,
                    //   radius: 30,
                    //   child: FaIcon(
                    //       FontAwesomeIcons.images,
                    //       color:Colors.white,
                    //       size: 40,
                    //     )
                    //   //  Icon(Icons.image_aspect_ratio),
                    // ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amberAccent,
                              child: Image.asset(
                                // 'assets/collages/agregar-imagen-uno.jpg',
                                primeraImagen,
                                fit: BoxFit.fitHeight,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Container(
                            width: 75,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  // color: Colors.red,
                                  child: Image.asset(
                                    // 'assets/collages/agregar-imagen-tres.jpg',
                                    this.terceraImagen,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
    
                                  height: 110,
                                ),
                                Expanded(
                                    child: Container(
                                  child: Image.asset(
                                    // 'assets/collages/agregar-imagen-dos.jpg',
                                    this.segundaImagen,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  // color: Colors.blueAccent,
                                ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
    
                    Container(
                        height: 50,
                        margin: EdgeInsets.only(top: 20),
                        child: Text(
                          // 'Agregar imagen',
                          this.texto,
                          textAlign: TextAlign.center,
                          style: TextStyle(),
                        )),
                    // Text('Agregar más imagenes', textAlign: TextAlign.center, style: TextStyle( ),)
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 119),
                    child: CircleAvatar(
                        backgroundColor: Colors.redAccent,
    
                        // radius: 30,
    
                        child: FaIcon(
                          FontAwesomeIcons.plus,
    
                          color: Colors.white,
    
                          // size: 40,
                        )
    
                        //  Icon(Icons.image_aspect_ratio),
    
                        ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
