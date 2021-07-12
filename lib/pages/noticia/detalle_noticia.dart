import 'dart:ui';

import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/models/Participante.dart';
import 'package:app_tarjeta/models/images/Imagen.dart';
import 'package:app_tarjeta/pages/noticia/detalle_participante_page.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/provider.dart';
import 'package:app_tarjeta/widgets/noticia/noticia_widget.dart';
// import 'package:app_tarjeta/widgets/drawer/drawer_widger.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetalleNoticia extends StatefulWidget {
  // const DetalleNoticia({ Key? key }) : super(key: key);

  @override
  _DetalleNoticiaState createState() => _DetalleNoticiaState();
}

class _DetalleNoticiaState extends State<DetalleNoticia> {
  Noticia noticia = new Noticia();

  @override
  Widget build(BuildContext context) {
// participantesBloc.cargar(noticia.id);

    final Noticia noticiaData = ModalRoute.of(context).settings.arguments;
    if (noticiaData != null) {
      noticia = noticiaData;
    }

// print(noticia.descripcion);
    return Scaffold(
        backgroundColor: Components.generalBackgroundColor,
        // drawer: DrawerWidger(),
        body: CustomScrollView(
          slivers: <Widget>[
            _CrearAppBar(noticia: noticia),
            SliverList(
                delegate: SliverChildListDelegate([
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    SingleChildScrollView(
                      // reverse: true,
                      child: Column(
                        children: <Widget>[

                          _NoticiaTitulo(noticia: noticia),
          Divider(color: Colors.red, thickness: 1,endIndent: 50,indent: 50,),

                          _Descripcion(noticia: noticia),
                          SizedBox(
                            height: 10,
                          ),
                          // _crearListado(participantesBloc)
                          _CrearImagenesNoticias(noticia: noticia),
                          SizedBox(
                            height: 20,
                          ),
                          // Center(child: Text('Contribuyentes'),),
                          _CrearParticipantes(noticia: noticia),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]))
          ],
        ));
  }

// Widget _crearListado(ParticipantesBloc participantesBloc){

// return StreamBuilder(
//   stream: participantesBloc.participantesStream,

//   builder: (BuildContext context, AsyncSnapshot<List<Participante>> snapshot) {
//       if (snapshot.hasData) {

//     // //  print(snapshot);
//     // final participantes = snapshot.data;
//     //  return ListView.builder(
//     //    itemCount: participantes.length,
//     //    itemBuilder: (context,i )=> _crearItem( context,participantesBloc,participantes[i])
//     //    );

//   return null;
//    }

//    else {
//     //  print(snapshot.connectionState);
//     //  if (snapshot.connectionState=='done') return Center(child: Text('error de conexion'),) ;
//    return Center( child:  CircularProgressIndicator(),);
//    }
//    },

//   );

// }

// Widget _crearItem(BuildContext context,ParticipantesBloc participantesBloc ,Participante participante){
//  Text(participante.nombre);

// //  ListTile(
// //           title:  Text('${ noticia.titulo} '),
// //           subtitle: Text(noticia.subtitulo),
// //           onTap: ()=> Navigator.pushNamed(context, 'noticia', arguments: noticia).then((value) { setState(() {

// //           });}),
// //     ),

// }

}

class _CrearImagenesNoticias extends StatelessWidget {
  // const _crearActores({ Key? key }) : super(key: key);
  final Noticia noticia;

  const _CrearImagenesNoticias({@required this.noticia});
  @override
  Widget build(BuildContext context) {
    // final participantesBloc = Providers.participantesBloc(context);
// participantesBloc.cargar(noticia.id);
    final imagenesNoticiaBloc = Providers.imagenesNoticia(context);

    // final imagenNoticiaService = new ImagenNoticiaService() ;
    // imagenNoticiaService.cargarImagenesNoticia(noticia.id);

    return FutureBuilder(
      future: imagenesNoticiaBloc.cargar(noticia.id),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List<Imagen>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return Container();
          }
          return _crearImagenesNoticiaPage(snapshot.data, context);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearImagenesNoticiaPage(List<Imagen> imagenes, BuildContext context) {
    //   return SizedBox(
    //   height: 200.0,
    //   child: PageView.builder(
    //     pageSnapping: true,
    //     controller: PageController(
    //       viewportFraction: 0.6,
    //       initialPage: 1
    //     ),
    //     itemCount: imagenes.length,

    //     itemBuilder:(context,i ){
    //       // return Text(participantes[i].nombre, );
    //       return SingleChildScrollView(child: _imagenNoticiaTarjeta(imagenes[i], context));

    //     }

    //     ),
    // );

    final size = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.all(10),
      // width: double.infinity,
      // height: 500.0,

      // width: size.height *0.99,
      // height: size.height *0.35,
      width: 600,
      height: 300,

      child: Swiper(
        // layout: ,
        layout: SwiperLayout.TINDER,
        itemWidth: double.infinity,
        itemHeight: double.infinity,
        itemBuilder: (BuildContext context, int index) {
          // return _imagenNoticiaTarjeta(imagenes[index], context);

          return Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Card(
              elevation: 1,
              shadowColor: Colors.black,


              // color: Colors.black,
              // shadowColor: Colors.black,
              // semanticContainer: false,
              // margin: EdgeInsets.all(15),
              // margin: EdgeInsets.only(bottom: 30 ),
              child: FittedBox(
                // fit: BoxFit.scaleDown,
                fit: BoxFit.fill,
                // alignment: Alignment.center,
                child: FadeInImage(
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  image: NetworkImage(imagenes[index].img),
                    
                  // height: double.infinity,
                  // width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          );
        },
        autoplay: true,
// autoplayDelay: 6,
        itemCount: imagenes.length,
        pagination: new SwiperPagination(
          // margin: EdgeInsets.only(bottom: 0),
          margin: EdgeInsets.only(bottom: 0),
          alignment: Alignment.bottomCenter
        ),
        // control: new SwiperControl(),


        scale: 2,
        duration: 2000,
        onTap: (value) {
          Navigator.push(context, MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return ViewImgeWidget(img: imagenes[value].img);
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
        physics: BouncingScrollPhysics(),

// scale: 1.3,
      ),
    );
  }

  Widget _imagenNoticiaTarjeta(Imagen imagen, BuildContext context) {
    TextStyle _style = TextStyle(
      // color: Colors.red[400],
      fontSize: 50.0,
    );
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 150,
            child: CircleAvatar(
              child: (imagen.img == null)
                  //  ?Text(participante.nombre.substring(0,2),style: _style,)
                  ? Container()
                  : AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipOval(
                        child: FadeInImage(
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          image: NetworkImage(imagen.img),
                          // height: double.infinity,
                          // width: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
            ),
          ),

          GestureDetector(
            onTap: () {
              //  mostrarAlerta(context, participante.nombre, participante.descripcion);
            },
            child: Text(
              imagen.id,
              overflow: TextOverflow.ellipsis,
            ),
          )

          // FadeInImage(placeholder: placeholder, image: image)
        ],
      ),
    );
  }
}

class _CrearParticipantes extends StatelessWidget {
  // const _crearActores({ Key? key }) : super(key: key);
  final Noticia noticia;

  const _CrearParticipantes({@required this.noticia});
  @override
  Widget build(BuildContext context) {
    final participantesBloc = Providers.participantesBloc(context);
// participantesBloc.cargar(noticia.id);

    return FutureBuilder(
      future: participantesBloc.cargar(noticia.id),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List<Participante>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return Container();
          } else {
            return _crearParticipantesPage(snapshot.data, context);
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearParticipantesPage(List<Participante> participantes, BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          child: 
          Divider(color: Colors.red, thickness: 1,endIndent: 50,indent: 50,),
        ),
       
        Center(
          child: Text(
            'Contribuyentes',
            style: TextStyle(fontSize: 15),
          ),
        ),
       
        SizedBox(
          height: 200.0,
          child: PageView.builder(
              pageSnapping: true,
              controller: PageController(viewportFraction: 0.6, initialPage: 1),
              itemCount: participantes.length,
              itemBuilder: (context, i) {
                // return Text(participantes[i].nombre, );
                // return SingleChildScrollView(child: _participanteTarjeta(participantes[i], context));
                return _participanteTarjeta(participantes[i], context);
              }),
        ),
      ],
    );
  }

  Widget _participanteTarjeta(Participante participante, BuildContext context) {
    TextStyle _style = TextStyle(
      // color: Colors.red[400],
      fontSize: 50.0,
    );
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 130,
            child: CircleAvatar(
              child: (participante.img == null)
                  ? Text(
                      participante.nombre.substring(0, 2),
                      style: _style,
                    )
                  : AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipOval(
                        child: FadeInImage(
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          image: NetworkImage(participante.img),
                          // height: double.infinity,
                          // width: double.infinity,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
            ),
          ),

          GestureDetector(
            onTap: () {
              //  return DetalleParticipantePage(participante: participante,);

              //         Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     pageBuilder:( _,__,___)=>DetalleParticipantePage(participante: participante),
              //     transitionDuration: Duration(milliseconds: 0)
              //   )
              // );

              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return DetalleParticipantePage(participante: participante);
                },
              ));
            },
            child: Text(
              participante.nombre,
              style: TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          )

          // FadeInImage(placeholder: placeholder, image: image)
        ],
      ),
    );
  }
}

// class _CrearParticipantesPage extends StatelessWidget {

// final List<Participante> participantes;

//   const _CrearParticipantesPage({ @required this.participantes});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200.0,
//       child: PageView.builder(itemBuilder: itemBuilder),
//     );
//   }
// }

class _CrearAppBar extends StatelessWidget {
  const _CrearAppBar({
    @required this.noticia,
  });

  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      // shape: ContinuousRectangleBorder(    borderRadius: BorderRadius.only(      bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80))),
// bottom: PreferredSize(
      // child: Text('das'),
      // preferredSize:Size.fromHeight(0)
      // ),

      automaticallyImplyLeading: false,
      leading:
// BackButton(color: Colors.black,) ,
          Container(
        child: IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.of(context).pop();
            },
            icon: FaIcon(
              FontAwesomeIcons.arrowCircleLeft,
              color: Components.generalBackgroundColor.withOpacity(0.9),
              size: 40,
            )),
      ),

      // title: Center(child: Text('Sliver AppBar')),

      elevation: 4.0,
      backgroundColor: Colors.blue[300],
      // foregroundColor: Colors.transparent,
      // shadowColor: Colors.transparent,

      // actions: [
      //     IconButton(onPressed: (){
      //         Navigator.pop(context);
      //     }, icon: Icon(Icons.ac_unit))
      // ],

      // backgroundColor: Components.generalBackgroundColor,
      // backgroundColor: Color.fromRGBO(250, 31, 38, 0.85),
      expandedHeight: size.height * 0.40,
      // expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          centerTitle: true,
          // title:   SafeArea(child: Text('desliza')),
          title: Text(
            noticia.titulo,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              letterSpacing: 2, 
              // height: 0.5, 
              color: Colors.white, 
              fontSize: 25.0,

                // fontWeight: FontWeight.w400
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
// color: Color.fromARGB(125, 0, 0, 255),
                      color: Colors.black),
                ]),
          ),
          background: Stack(
            children: <Widget>[
              Container(
                color: Components.generalBackgroundColor,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: new BoxDecoration(
                  color: Components.generalBackgroundColor,
                  // boxShadow: [new BoxShadow(blurRadius: 1.0)],
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.0)),
                ),
                child: (noticia.img == null)
// ShaderMask(
//                 shaderCallback: (rect){
//                    return LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Colors.white, Colors.red],
//     ).createShader(Rect.fromLTRB(10, 20, rect.width, rect.height));

//                 },
//                 blendMode: BlendMode.dstIn,
//                 child:
                    ? Image(
                        // color: Colors.blueGrey.withOpacity(0.2),

                        image: AssetImage('assets/logoINJEO.png'),
                        fit: BoxFit.contain,
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                      )
                    :
                    // : ShaderMask(
                    //   shaderCallback: (Rect bounds){
                    //     return LinearGradient(
                    //       colors: [ //         Color(0xFF704214),          //         Colors.tr,          //         ]
                    //     ).createShader(bounds);
                    //   },
                    //   blendMode: BlendMode.color,
                    //   child: FadeInImage(
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return ViewImgeWidget(img: noticia.img);
                            },
                          ));
                        },
                        // color: Colors.blueGrey.withOpacity(0.2),

                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(colors: [
                              Colors.blueGrey.withOpacity(0.9),
                              Colors.blueGrey[900].withOpacity(0.2),
                              Colors.blueGrey[900].withOpacity(0.5),
                              // Colors.transparent,
                            ]).createShader(bounds);
                          },
                          blendMode: BlendMode.color,
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 4),
                            child: FadeInImage(
                              placeholder: AssetImage('assets/loading.gif'),
                              image: NetworkImage(noticia.img),
                              height: double.infinity,
                              width: double.infinity,
                              // fadeInDuration: Duration(microseconds:150),
                              fadeOutDuration: Duration(milliseconds: 12),

                              // fit:BoxFit.fitWidth,
                              fit: BoxFit.cover,
                              // alignment: Alignment.center,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}

class _NoticiaTitulo extends StatelessWidget {
  // const _NoticiaTitulo({ Key? key }) : super(key: key);

  final Noticia noticia;
  const _NoticiaTitulo({
    @required this.noticia,
  });

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          // ( usuario.img == null)
          //           ? CircleAvatar(
          //             maxRadius: 40,
          //             child: Text(usuario.userName.substring(0,2), style: TextStyle(fontSize: 40),))
          //           :ClipRRect(
          //             borderRadius: BorderRadius.circular(20.0),
          //             child: FadeInImage(
          //                 placeholder: AssetImage('assets/jar-loading.gif'),
          //                 image: NetworkImage(usuario.img),
          //                 height:150,
          //                 // width: double.infinity,
          //                 fit:BoxFit.cover,
          //                 alignment: Alignment.center,
          //                 ),
          //           ),

          SizedBox(
            width: 20.0,
          ),

          
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //  Container( padding: EdgeInsets.all(25), child: Divider(  color: Colors.red, )),

// Container( padding: EdgeInsets.fromLTRB(30, 0, 25, 0),  child: Divider(  color: Colors.red, )),


              SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    noticia.subtitulo,
                    style: Theme.of(context).textTheme.headline4,
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // Center(
              //   child: Text(
              //     noticia.titulo,
              //     style: Theme.of(context).textTheme.headline4,
              //     // overflow: TextOverflow.ellipsis,
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              // Text( noticia.subtitulo, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis,)
            ],
          )),
        ],
      ),
    );
  }
}

class _Descripcion extends StatelessWidget {
  // const _Descripcion({ Key? key }) : super(key: key);
  final Noticia noticia;
  const _Descripcion({
    @required this.noticia,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
//           Center(
//               child: Text(
//             noticia.subtitulo,
//             style: Theme.of(context).textTheme.headline5,
//             overflow: TextOverflow.clip,
//             textAlign: TextAlign.center,
//           )),

//           // SizedBox(  height: 10.0,),
//           //       Container(child: Divider(color: Colors.red, )),
//           // SizedBox(  height: 10.0,),

//           // Container( padding: EdgeInsets.fromLTRB(45, 0, 25, 0), child: Divider(  color: Colors.red, )),
// // Container( padding: , child: Divider(color: Colors.red, )),
//  Container( padding: EdgeInsets.fromLTRB(45, 0, 25, 0), child: Divider(  color: Colors.red,              )),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              noticia.descripcion,
              // +noticia.descripcion
              // +noticia.descripcion
              // +noticia.descripcion
              // +noticia.descripcion
              // +noticia.descripcion
              // +noticia.descripcion
              // +noticia.descripcion
              // +noticia.descripcion,
              // style:TextStyle(fontSize: 18, wordSpacing: 5, height: 2),
              // textAlign: TextAlign.justify,
              style: TextStyle(wordSpacing: 5, height: 2),
              textAlign: TextAlign.center,
              // style: Texts,
            ),
          ),
        ],
      ),
    );
  }
}

// class _CrearAppbar extends StatelessWidget {
//   // const _crearAppbar({ Key? key }) : super(key: key);
// final Noticia noticia;

//   const _CrearAppbar({ this.noticia}) ;

//   @override
//   Widget build(BuildContext context) {
//     return _crearAppBarNoticia(noticia: noticia);
//   }
// }
