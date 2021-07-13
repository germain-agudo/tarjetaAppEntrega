import 'package:flutter/material.dart';

class InputFormNoticia extends StatelessWidget {
  // const InputFormNoticia({ Key? key }) : super(key: key);
final  String initialValue;
final  String text;
final Function onSaved;
final Function validator;
final Icon icon;
  const InputFormNoticia({
    Key key, 
    @required this.initialValue, 
    @required this.onSaved, 
    @required this.validator,
    @required this.icon,
    @required this.text
    }); 
    
  @override
  Widget build(BuildContext context) {
      return Container(
        // height: 60,
    width: double.infinity,
      padding: EdgeInsets.only(top: 5, left: 15, bottom: 5, right: 20), //Esto es para que no se pegue al finalde mi margen

      margin: EdgeInsets.only(bottom: 20), //para hacer una separacion
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black.withOpacity(0.05), // color con opacidad,
            offset: Offset(0, 5), //Para la direccion se la sombra
            blurRadius: 5)
      ]),

      child: Center(
        child: TextFormField(
             initialValue: initialValue,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
              prefixIcon: icon,

          labelText: text,
          border: InputBorder.none,
        // hintText: text,
        // suffixIcon: Icon(Icons.description_sharp)         
              // hintText: 'titulo',

        ),
        onSaved: onSaved,
        validator: validator
        
        ),
      ),
    );
  }
}