import 'package:app_tarjeta/models/Participante.dart';
import 'package:app_tarjeta/models/redes/Red.dart';
import 'package:app_tarjeta/services/provider.dart';
import 'package:app_tarjeta/services/redes/redes_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetalleParticipantePage extends StatelessWidget {
  // const DetalleParticipantePage({ Key? key }) : super(key: key);
  final Participante participante;

  const DetalleParticipantePage({@required this.participante});




  @override


  Widget build(BuildContext context) {

final participanteBloc = Providers.participantesBloc(context);
// final participanteBloc = Providers.participantesBloc(context);
// final par = Participante();

// print(object)
participanteBloc.detalleParticipante(participante.id).then(
  (value){
    participante.nombre= value.nombre;
    participante.descripcion= value.descripcion;
    participante.img= value.img;
    participante.cargo= value.cargo;
  }
     
      
      )
        .catchError((onError)=>print(onError));




    return Scaffold(
      appBar: AppBar(      ),

      body: SingleChildScrollView(
               physics: BouncingScrollPhysics(),


child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: <Widget>[
            
                SizedBox(height: 20,),

        _ParticipanteTitulo(participante: participante),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Divider(color: Colors.red, )),
        _DescripcionParticipante(participante: participante),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Divider(color: Colors.red, )),
                SizedBox(height: 10,),




  _CrearRedesParticipantes(participante: participante)



  ],

),
),
    );
  }





}

class _ParticipanteTitulo extends StatelessWidget {
  // const _ParticipanteTitulo({ Key? key }) : super(key: key);
final Participante participante;

  const _ParticipanteTitulo({ @required this.participante}) ;


  @override
  Widget build(BuildContext context) {

print(participante.id);

      return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
          children: <Widget>[
              ( participante.img == null)
                        ? CircleAvatar(
                          maxRadius: 40,
                          child: Text(participante.nombre.substring(0,2), style: TextStyle(fontSize: 40),))
                        :ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                              placeholder: AssetImage('assets/jar-loading.gif'), 
                              image: NetworkImage(participante.img),
                              height:150,
                              // width: double.infinity,
                              fit:BoxFit.cover,
                              alignment: Alignment.center,
                              ),
                        ),
    
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                

                Divider(color: Colors.red, ),
                Center(
                  child: Text(
                    participante.nombre, 
                    style: Theme.of(context).textTheme.bodyText1, 
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,  
                    
                    ),
                ),
                SizedBox(height: 10,),


                Center(
                  child: Text(
                    participante.cargo, 
                    style: Theme.of(context).textTheme.bodyText1, 
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,  
                    
                    ),
                ),
                Divider(color: Colors.red, ),


                // Text( noticia.subtitulo, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis,)
              ],
            ) 
          )
    
          ],
      ),
    );
  }
}

class _DescripcionParticipante extends StatelessWidget {
  // const _DescripcionParticipante({ Key? key }) : super(key: key);

final Participante participante;

  const _DescripcionParticipante({
    @required this.participante
    }); 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Center(
        
        child: Text(
          participante.descripcion,
          
          style: TextStyle(wordSpacing: 5, height: 2),
          textAlign: TextAlign.center,
          )
          
          
          ),
    );
  }
}








class _CrearRedesParticipantes extends StatelessWidget {
  // const _crearActores({ Key? key }) : super(key: key);
final Participante participante;

  const _CrearRedesParticipantes({@required this.participante});
  @override
  Widget build(BuildContext context) {

    
  // final imagenesNoticiaBloc = Providers.imagenesNoticia(context);

 
final participanteBloc = Providers.participantesBloc(context);




    return FutureBuilder(
      future: participanteBloc.cargarRedParticipante(participante.id),
      // initialData: InitialData,
      
      builder: (BuildContext context, AsyncSnapshot  <List<Red>>  snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return Container();
          }


           return _crearImagenesRedes(snapshot.data, context);
        } else{
          // return Center() ;
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );



  }


Widget _redSocialTerjeta( {@required Red red, @required BuildContext context}){
     final size = MediaQuery.of(context).size;

 TextStyle _style = TextStyle(
      // color: Colors.red[400],
      fontSize: 50.0,
    );
      return Row(
        
        children: <Widget>[

 CircleAvatar(        
   child:  ( red.img == null)
           ?Text(red.red.substring(0,2),style: _style,)
           :AspectRatio(
             aspectRatio: 1/1,
             child: ClipOval(
               child: FadeInImage(
                  //  placeholder: AssetImage('assets/jar-loading.gif'), 
        placeholder: AssetImage('assets/gif/loading-inicio.gif'),

                   image: NetworkImage(red.img),
                  //  height: double.infinity,
                  //  width: double.infinity,
                  //  fit:BoxFit.cover,
                   alignment: Alignment.center,
                   ),
             ),
           ),
   
 ),

 
       Container(
      //  height: 100,
       width: size.width *0.4,
       child: ListTile(
         title: Text(red.red, style: TextStyle(fontSize: 12, ),
                      overflow: TextOverflow.ellipsis,
         
         ),
       ),
       )
 





          // FadeInImage(placeholder: placeholder, image: image)
        ],
      );
















//   return Container(
    
// height:  50,
// // width: double.infinity,

//     // height: 90,

//     // width: double.infinity,
//     // width: double.infinity,
//      child: Card(
//        child: Center(
//          child: Row(
//            children: <Widget>[
//              FadeInImage(
//                         // width: 35,
//          placeholder: AssetImage('assets/jar-loading.gif'), 
//          image: NetworkImage(red.img),
//          // width: 20,
     
//          // height: double.infinity,
     
//        //  fit:BoxFit.cover,
//          alignment: Alignment.center,
//          ),
     
     
         
//            ],
//          ),
//        ),
//      ),
//   );
}



Widget _crearImagenesRedes (List<Red> red,BuildContext context){


     final size = MediaQuery.of(context).size;


 return Container(
      // height: 200.0,
    
      height: size.height * 0.1,
      child: PageView.builder(
        pageSnapping: true,
        controller: PageController(
          viewportFraction: 0.6,
          initialPage: 0
        ),
        itemCount: red.length,

        itemBuilder:(context,i ){
          // return Text(participantes[i].nombre, );
          // return SingleChildScrollView(    physics: BouncingScrollPhysics(),  scrollDirection: Axis.horizontal,  child: _redSocialTerjeta(red: red[i] ,context:  context));
          return SingleChildScrollView(    physics: BouncingScrollPhysics(),  scrollDirection: Axis.horizontal,  child: _redSocialTerjeta(red: red[i] ,context:  context));

        }  
        
        ),
    );
}




//   Widget _dividirLista(List<Red> red, BuildContext context){
//  final int itemCount =  (red.length % 2 >0) ? red.length+1 :red.length;
// List<Red> uno=[];
// List<Red> dos=[];


// // print(itemCount);
// final contador = itemCount/2;

// // final contadorDos = itemCount/2;


// for (var i = 0; i <( itemCount); i++) {
//   if (i <contador ) {
//     print('es menor' + i.toString());
//   uno.add(red[i]);
//     // print(red[i]);
//   }else{
//     if (i<red.length) {
      
//     print('es mayor' + i.toString());
//   dos.add(red[i]);

//     } 

//   }
//   // else {
//     // if (i<red.length && i>(itemCount/2)) {
//     // dos.add(red[i]);
      
//     // }
//   // }

// }

//      final size = MediaQuery.of(context).size;

// return Row(

//   children: <Widget>[
// Container(color: Colors.red, width: size.width *0.5, height: 100,   
// child:
//   ListView.builder(
//   scrollDirection: Axis.vertical,
//   itemCount: uno.length,
//   itemBuilder: (BuildContext context, int index) {
//   return _redSocial(red: uno[index]);
//  },
// ),
 
// ),
// Container(color: Colors.black, width: size.width *0.5, height: 100, 
// child: 
// ListView.builder(
//   scrollDirection: Axis.vertical,
//   itemCount: dos.length,
//   itemBuilder: (BuildContext context, int index) {
//   return _redSocial(red: dos[index]);
//  },
// ),


// ),
// // ListView.builder(
// //   // scrollDirection: Axis.horizontal,
// //   itemCount: uno.length,
// //   itemBuilder: (BuildContext context, int index) {
// //   // return _redSocial(red: uno[index]);
// //   return Container(color: Colors.black,);
// //  },
// // ),

// //       ListView.builder(
// //         // scrollDirection: Axis.horizontal,
// //         itemCount: dos.length,
// //         itemBuilder: (BuildContext context, int index) {
// //         // return _crearFilas(context, dos);
// //         // return _redSocial(red: dos[index]);
// //     return Container(color: Colors.black,);
      
// //        },
// //       ),
// //     // Container(child: Text('sdfs'),),

//     // _crearFilas(context, uno),

//     // Expanded(child: Container()),





//     // _crearFilas(context, dos),

//     // Container(child: Text('sdfs')),

//   ],

// );









  
// //    Swiper(
// //     // layout: ,
// //     layout: SwiperLayout.TINDER,
// //     itemWidth: double.infinity,
// //     itemHeight: double.infinity,
// //     itemBuilder: (BuildContext context, int index){
// //       // return _imagenNoticiaTarjeta(imagenes[index], context);
    
    
// //       return Container(
// //         margin: EdgeInsets.all(25),
// //         child: FittedBox(
// //           fit: BoxFit.fitHeight,
// //                                 //  fit:BoxFit.cover,

// //           child: Card(
            
// //             elevation: 10,
// //             // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
// //             child: Container(
// //               height: 25,
// //               child: FadeInImage(
// //                 width: 35,
// //                                    placeholder: AssetImage('assets/jar-loading.gif'), 
// //                                    image: NetworkImage(red[index].img),
                                    
// //                                    // height: double.infinity,
// //                                    // width: double.infinity,
// //                                   //  fit:BoxFit.cover,
// //                                    alignment: Alignment.center,
// //                                    ),
// //             ),
// //           ),
// //         ),
// //       );
     
// //     },
// // // autoplay: true,
// // // autoplayDelay: 9000,
// //     itemCount:red.length ,
// //     pagination: new SwiperPagination(),
// //     // autoplayDelay: 300,
// //     // autoplayDisableOnInteraction: true,
// //     control: new SwiperControl(),
      
// //     // scale: 2,
    

// // physics: BouncingScrollPhysics(),

// // // scale: 1.3, 

// //     ),
// // );





//   }
  
  
  }