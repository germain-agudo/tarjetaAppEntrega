import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/services/auth_service.dart';
// import 'package:app_tarjeta/widgets/drawer/drawer_widger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DetalleNoticia extends StatefulWidget {
  // const DetalleNoticia({ Key? key }) : super(key: key);

  @override
  _DetalleNoticiaState createState() => _DetalleNoticiaState();
}

class _DetalleNoticiaState extends State<DetalleNoticia> {

  Noticia noticia = new Noticia();

  
  @override
  Widget build(BuildContext context) {

  final Noticia noticiaData = ModalRoute.of(context).settings.arguments;
      if ( noticiaData != null ) {
        noticia = noticiaData;
      }

print(noticia.descripcion);
    return Scaffold(
      
      // drawer: DrawerWidger(),
      body:CustomScrollView(
        slivers: <Widget>[
          _CrearAppBar(noticia: noticia),
          SliverList(delegate: SliverChildListDelegate(
            [
              SizedBox(height: 10.0,),
              _NoticiaTitulo(noticia: noticia),
              _Descripcion(noticia: noticia),
             
            ]
          ) )
        ],
      )
    );
  }
}



class _CrearAppBar extends StatelessWidget {
  const _CrearAppBar({
  
    @required this.noticia,
  }) ;

  final Noticia noticia;

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    
    return SliverAppBar(
      
        elevation: 2.0,
        backgroundColor: Components.generalBackgroundColor,
      // backgroundColor: Color.fromRGBO(250, 31, 38, 0.85),
        expandedHeight: size.height * 0.5,
        // expandedHeight: 250,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          // title: Text( noticia.subtitulo,  style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400), ),
        background:   ( noticia.img == null)
              ? Image(image: AssetImage('assets/logoINJEO.png'))        
              : FadeInImage(
                                placeholder: AssetImage('assets/loading.gif'), 
                                image: NetworkImage(noticia.img),
                                // height: double.infinity,
                                // width: double.infinity,
                                fadeInDuration: Duration(microseconds:150),
                                // fit:BoxFit.fitWidth,
                                fit:BoxFit.cover,
                                alignment: Alignment.center,
                                ),



        ),
    );
  }
}


class _NoticiaTitulo extends StatelessWidget {
  // const _NoticiaTitulo({ Key? key }) : super(key: key);

  final Noticia noticia;
  const _NoticiaTitulo({
  
    @required this.noticia,
  }) ;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
          children: <Widget>[
              ( usuario.img == null)
                        ? CircleAvatar(
                          maxRadius: 40,
                          child: Text(usuario.userName.substring(0,2), style: TextStyle(fontSize: 40),))
                        :ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                              placeholder: AssetImage('assets/jar-loading.gif'), 
                              image: NetworkImage(usuario.img),
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
                Center(
                  child: Text(
                    noticia.titulo, 
                    style: Theme.of(context).textTheme.bodyText1, 
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,  
                    
                    ),
                ),
                SizedBox(height: 10,),
                // Text( noticia.subtitulo, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis,)
              ],
            ) 
          )
    
          ],
      ),
    );
  }
}



class _Descripcion extends StatelessWidget {
  // const _Descripcion({ Key? key }) : super(key: key);
 final Noticia noticia;
  const _Descripcion(
    {  
    @required this.noticia,
    }
 );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          Center(child: 
                Text( 
                  noticia.subtitulo, 
                  style: Theme.of(context).textTheme.subtitle1, 
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,  
                )

          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            noticia.descripcion,
            textAlign: TextAlign.justify,
            // style: Texts,
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

