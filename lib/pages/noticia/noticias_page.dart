import 'package:app_tarjeta/models/Noticia.dart';
// import 'package:app_tarjeta/models/response/NoticiaResponse.dart';
// import 'package:app_tarjeta/services/noticia_service.dart';
import 'package:app_tarjeta/services/provider.dart';
import 'package:flutter/material.dart';


class NoticiasPage extends StatefulWidget {
  // const NoticiasPage({ Key? key }) : super(key: key);
  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
    // final noticiaService = new NoticiaService();

  @override
  Widget build(BuildContext context) {

final noticiasBloc = Providers.noticiasBloc(context);
noticiasBloc.cargarNoticias();
    return Scaffold(
      appBar: AppBar( title: Text('Noticias'),      ),
      body: Container(
        
        child: _crearListado(noticiasBloc)
        ),
      floatingActionButton: _crearBoton(context),
    );
  }

Widget _crearListado(NoticiasBloc noticiasBloc){

return StreamBuilder(
  stream: noticiasBloc.noticiasStream,
  
  builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) { 
      if (snapshot.hasData) {
     
    //  print(snapshot);
    final noticias = snapshot.data;
     return ListView.builder(
       itemCount: noticias.length,
       itemBuilder: (context,i )=> _crearItem( context,noticiasBloc,noticias[i])
       );
   } else {
    //  print(snapshot.connectionState);
    //  if (snapshot.connectionState=='done') return Center(child: Text('error de conexion'),) ; 
   return Center( child:  CircularProgressIndicator(),);
   }
   },

  );



// return FutureBuilder(
//   future: noticiaService.cargarNoticias(),
//  builder: (BuildContext context, AsyncSnapshot<List<Noticia>> snapshot) {
//    if (snapshot.hasData) {
     
//     //  print(snapshot);
//     final noticias = snapshot.data;
//      return ListView.builder(
//        itemCount: noticias.length,
//        itemBuilder: (context,i )=> _crearItem( context,noticias[i])
//        );
//    } else {
//     //  print(snapshot.connectionState);
//     //  if (snapshot.connectionState=='done') return Center(child: Text('error de conexion'),) ; 
//    return Center( child:  CircularProgressIndicator(),);
//    }
   
//    },
  
//   );


}

Widget _crearItem(BuildContext context,NoticiasBloc noticiasBloc ,Noticia noticia){
  return Dismissible(
    key: UniqueKey(),
    background: Container(
      color: Colors.red,
    ),
    // direction: DismissDirection.none,

    // onDismissed: (direccion)async{
    //  await noticiaService.borrarNoticia(noticia.id).then((value){
    //    setState(() {
         
    //    });
    //  });
    // },
    onDismissed: (direccion)async{
      await  noticiasBloc.borrarNoticia(noticia.id);
      setState(() {
        
      });
      },
    child: Card(
      child: Column(
        children: <Widget>[
          ( noticia.img == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'), 
                image: NetworkImage(noticia.img),
                height: 300.0,
                width: double.infinity,
                fit:BoxFit.cover
                ),
           ListTile(
          title:  Text('${ noticia.titulo} '),
          subtitle: Text(noticia.subtitulo),
          // onTap: ()=> Navigator.pushNamed(context, 'noticia', arguments: noticia).then((value) { setState(() {  });}),
          onTap: ()=> Navigator.pushNamed(context, 'detalleNoticia', arguments: noticia).then((value) { setState(() {  });}),
    ),
        ],
      ),
    )
  );


//  ListTile(
//           title:  Text('${ noticia.titulo} '),
//           subtitle: Text(noticia.subtitulo),
//           onTap: ()=> Navigator.pushNamed(context, 'noticia', arguments: noticia).then((value) { setState(() {
            
//           });}),
//     ),



}

  _crearBoton(BuildContext context){
    return FloatingActionButton(
      backgroundColor: Colors.red[700],
      child:  Icon(Icons.add),
      onPressed:()=>Navigator.pushNamed(context, 'noticia')
      .then((value){setState(() {
        
      });}),
       );


  }
}