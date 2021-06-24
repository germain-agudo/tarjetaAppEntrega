import 'package:app_tarjeta/models/Noticia.dart';
import 'package:app_tarjeta/services/noticia_service.dart';
import 'package:flutter/material.dart';
// import 'package:app_tarjeta/utils/utils.dart' as utils;
class AgregarNoticiaPage extends StatefulWidget {
  // const NoticiaPage({ Key? key }) : super(key: key);
  @override
  _AgregarNoticiaPageState createState() => _AgregarNoticiaPageState();
}

class _AgregarNoticiaPageState extends State<AgregarNoticiaPage> {
final formkeyAgregarNoticia = GlobalKey<FormState>();
  Noticia noticia = new Noticia();
final noticiaService = new NoticiaService();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticia'),
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual ),
            onPressed: (){
            }, 
          ),
          IconButton(
            icon: Icon(Icons.camera_alt ),
            onPressed: (){
            }, 
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key:  formkeyAgregarNoticia,
            child: Column(
              children: <Widget>[
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
    onPressed: _submit, 
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





void _submit(){

  
                        // estado actual del formulario
  if (!formkeyAgregarNoticia.currentState.validate() ) return;


formkeyAgregarNoticia.currentState.save();



    // Cuando el formulario es valido
print('Todo Ok');

  
print(noticia.titulo);
print(noticia.subtitulo);
print(noticia.descripcion);

noticiaService.crearNoticia(
noticia.titulo,
noticia.subtitulo,
noticia.descripcion,

);

}
}