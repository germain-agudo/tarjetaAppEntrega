import 'dart:io';

import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/services/provider.dart';
// import 'package:app_tarjeta/services/noticia_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:app_tarjeta/utils/utils.dart' as utils;
class AgregarNoticiaPage extends StatefulWidget {
  // const NoticiaPage({ Key? key }) : super(key: key);
  @override
  _AgregarNoticiaPageState createState() => _AgregarNoticiaPageState();
}

class _AgregarNoticiaPageState extends State<AgregarNoticiaPage> {
final formkeyAgregarNoticia = GlobalKey<FormState>();
final scaffoldKey = GlobalKey<ScaffoldState>();



NoticiasBloc noticiasBloc;

  Noticia noticia = new Noticia();
// final noticiaService = new NoticiaService();
  bool _guardando = false;
  File foto;

  @override


  Widget build(BuildContext context) {

    noticiasBloc = Providers.noticiasBloc(context);

  final Noticia noticiaData = ModalRoute.of(context).settings.arguments;
      if ( noticiaData != null ) {
        noticia = noticiaData;
      }

//  if (_guardando) {
//      return Center( child:  CircularProgressIndicator(),);

//   }
    return Scaffold(
      key:  scaffoldKey,
      appBar: AppBar(
        title: Text('Noticia'),
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual ),
            onPressed:(){ _seleccionarFoto();}, 
          ),
          IconButton(
            icon: Icon(Icons.camera_alt ),
            onPressed: _tomarFoto, 
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

     
        child: (_guardando)?  Center( child:  CircularProgressIndicator(),):
        
        Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key:  formkeyAgregarNoticia,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearTitulo(),
                _crearSubtitulo(),
                _crearDescripcion(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
      
    );
  }

Widget _crearTitulo(){
  return TextFormField(
    initialValue: noticia.titulo,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      labelText: 'Titulo'
    ),
    onSaved: (value)=>noticia.titulo=value,

    validator: (value){
      if (value.length<3) {
        return 'Ingrese el titulo';//regeresa el error
      } else {
        return null;//pasa sin problemas
      }
    },
  ); 
}

Widget _crearSubtitulo(){

  return TextFormField(
  
    // keyboardType: TextInputType.numberWithOptions(decimal: true),
    // validator: ( value){
      //  if ( utils.isNumeric(value) ) { return null;
          // }else{ return 'solo numeros';}
    // },
    // onSaved: (value)=> noticia.descripcion= double.parse(value),

    initialValue: noticia.subtitulo,

    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      labelText: 'Subtitulo'
    ),

      onSaved: (value)=>noticia.subtitulo = value,
     validator: (value){
      if (value.length<3) {
        return 'Ingrese el Subtitulo';//regeresa el error
      } else {
        return null;//pasa sin problemas
      }
    },
  );
}

Widget _crearDescripcion(){ 
  return TextFormField(
    initialValue: noticia.descripcion,

    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      labelText: 'Descripcion'
    ),

      onSaved: (value)=>noticia.descripcion=value,

     validator: (value){
      if (value.length<3) {
        return 'Ingrese la descripción';//regeresa el error
      } else {
        return null;//pasa sin problemas
      }
    },
  );
}

Widget _crearBoton(){

 


  return ElevatedButton.icon(
    onPressed: (_guardando) ?null : _submit, 
    icon: Icon(Icons.save), 
    label: Text('Save'),
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        )
      ),
    backgroundColor: MaterialStateProperty.all(Colors.red[400])  
    ),
  );
}


// Widget _crearDisponible(){
//   return SwitchListTile(
//     value: noticia.disponoble,
//     title: Text('Disponible'),
//     activeColor: Colors.red,
//     onChanged: (value)=>setState((){
//       noticia.disponible = value
//     }),
//   );
  
// }





void _submit()async{

 String id='';
                        // estado actual del formulario
  if (!formkeyAgregarNoticia.currentState.validate() ) return;


formkeyAgregarNoticia.currentState.save();







if ( noticia.id ==null) {
setState(() {_guardando = true;});



id = await  noticiasBloc.crearNoticia(noticia.titulo, noticia.subtitulo, noticia.descripcion,);


} else {
noticiasBloc.editarNoticia(noticia.titulo, noticia.subtitulo, noticia.descripcion, noticia.id);

}



    // Cuando el formulario es valido
setState(() {_guardando = true;});


if ( foto != null) {
  print( await  noticiasBloc.subirImagen(foto,(noticia.id==null)?id : noticia.id));
}

// setState(() {_guardando = false;});

mostrarSnackbar('Registro Guardardo');
Navigator.pop(context);
}

 void mostrarSnackbar( String mensaje){

      final snackbar = SnackBar(
        content: Text(mensaje),
        duration: Duration( milliseconds:  1500 ),
        );
    // scaffoldKey.currentState.sh
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }


Widget _mostrarFoto(){
  if ( noticia.img !=null) {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'), 
      image: NetworkImage(noticia.img),
      height: 300.0,
      fit: BoxFit.contain,
      
      );
    
  }else{
        
    // // Si foto tiene el path con ifnromacion la muestre y si no ??? muestre la imagen estatica,
    // return Image(image: AssetImage(foto?.path ??'assets/no-image.png'),
    // height:300.0,    fit: BoxFit.cover,   );

     if( foto != null ){
        return Image.file(
          foto,
          fit: BoxFit.cover,
          height: 300.0,
          // width: 500,
        );
      }
      return Image.asset('assets/no-image.png');

  }
}

_seleccionarFoto()async{
_procesarImage(ImageSource.gallery);


}

_tomarFoto()async{
_procesarImage(ImageSource.camera);

}


_procesarImage( ImageSource origin) async{
 final _picker = ImagePicker();


    final pickedFile = await _picker.getImage(
      source: origin,
      maxHeight: 720, maxWidth: 720

    );

    if (pickedFile==null) {}
    else
    foto = File(pickedFile?.path);
 
    if (foto != null) {
      noticia.img = null;
    }
 
    setState(() {});


}








}