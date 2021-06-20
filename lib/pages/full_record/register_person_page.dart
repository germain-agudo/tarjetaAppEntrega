// import 'dart:ui';
import 'package:app_tarjeta/global/components.dart';
// import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/components/role_service.dart';
import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';
// import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';
import 'package:app_tarjeta/widgets/login-register/custom_input.dart';
// import 'package:app_tarjeta/widgets/login-register/labels.dart';
// import 'package:app_tarjeta/widgets/login-register/logo.dart';
import 'package:app_tarjeta/widgets/logo_general.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';



class RegisterPersonPage extends StatefulWidget {

  @override
  _RegisterPersonPageState createState() => _RegisterPersonPageState();
}

class _RegisterPersonPageState extends State<RegisterPersonPage> {
  //  final emailCtrl = TextEditingController();
  // final passCtrl = TextEditingController();
  // final phoneCtrl = TextEditingController();
 
final sexoCtrl = TextEditingController(); 
final curpCtrl = TextEditingController(); 
final nombreCtrl = TextEditingController(); 
final apPaternoCtrl = TextEditingController(); 
final apMaternoCtrl = TextEditingController(); 
final municipioCtrl = TextEditingController(); 
final regionCtrl = TextEditingController(); 

 final  inputFielDateController =   TextEditingController();


  String dropdownValue = 'Sexo';
  String fecha ='';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completa tus datos'),
        
        
        actions:<Widget> [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar', 
            onPressed: (){
               ScaffoldMessenger.of(context)
                          .showSnackBar(
                                    const SnackBar(content: Text('This is a snackbar'))
                          );
            },
            ),

    IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),


        ],),
        // backgroundColor: Color(0xffF2F2F2),
        backgroundColor: Components.generalBackgroundColor,

        body: 

 Stack(
      children: <Widget>[
  
          Center(
            
            // child: Container(    alignment: Alignment.bottomCenter,    child:    Image(image: AssetImage('assets/logoINJEO.png')))
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('assets/logoINJEO.png'), 
                  height: 100,
                  
                ),
                Expanded(child: Container()),

              ],
            ),
            
        ),
          
        PageView(
        scrollDirection: Axis.horizontal,    
           
          // controller: controller,
          children: <Widget>[  
             _pages(_formularioUno()),
            _pages(_formularioDos()),              
            _pages(_formularioTres()),              
          ],
        ),
    
        // Center( child: Row( children: [ Expanded(child: Container()), Text('desliza'),
              // Icon( Icons.keyboard_arrow_right_outlined, size: 80.0,  color: Colors.red[400],  ),  ],  ), ),
 Container(
          alignment: Alignment.bottomCenter,
          child: Text("desliza hasta terminar el formulario")
        )
      ],
      
      )
        
        );






  }


Widget _pages(Widget formulario){
     return Center(
       
              child: SingleChildScrollView(
                
                child: Column(
                  children: <Widget>[                    
                   formulario
                  ],
                ),
              ),
              // child: Text('sdfe'),
            );

}

Widget _inputEdad(){
return Container(
   
   width: double.infinity,
      padding: EdgeInsets.only(
          top: 5,
          left: 5,
          bottom: 5,
          right: 20), //Esto es para que no se pegue al finalde mi margen

      margin: EdgeInsets.only(bottom: 20), //para hacer una separacion
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05), // color con opacidad,
                offset: Offset(0, 5), //Para la direccion se la sombra
                blurRadius: 5)
          ]),
      child: 
      
      
       Row(
         children: [
           
         


  Container( margin: EdgeInsets.symmetric(horizontal: 14),child: Icon(Icons.supervised_user_circle_sharp,  color: Colors.black54,))
          ,Text('Sexo', style: TextStyle(fontSize: 16, color: Colors.black54))


           ,Expanded(child: Container()),

           DropdownButton<String>(
                  
      value: dropdownValue,

      icon: const Icon(Icons.arrow_downward,),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black54),
      underline: Container(
            height: 2,
            color: Colors.black54,
      ),
  

      onChanged: (String newValue) {
            print(newValue);
            setState(() {
              dropdownValue = newValue;
              sexoCtrl.text=dropdownValue;
            });
      },
      items: <String>['Sexo', 'Masculino', 'Femenino']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
      }).toList(),
    ),
         ],
       ),

 );
}

 Widget _formularioUno(){
     return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(top: 40), 
      padding: EdgeInsets.symmetric(    horizontal:     50), 
      child: Column(
        children: <Widget>[    
          CustomInput(
            // Correo
            icon: Icons.person_pin_circle,
            placeholder: 'Nombre(s)',
            keyboardType: TextInputType.text,
            textController: nombreCtrl,
          ),

          CustomInput(
            // Correo
            icon: Icons.person,
            placeholder: 'Apellido Paterno',
            keyboardType: TextInputType.text,
            textController: apPaternoCtrl,
          ),
          
          CustomInput(
            // Correo
            icon: Icons.person,
            placeholder: 'Apellido Materno',
            keyboardType: TextInputType.text,
            textController: apMaternoCtrl,
          ),
        ],
      ),
    );
 }

 Widget _formularioDos(){

     return Container(
      margin: EdgeInsets.only(top: 40), 
      padding: EdgeInsets.symmetric(    horizontal:     50), 
      child: Column(
        children: <Widget>[    

          

_inputEdad(),
          CustomInput(
            // Correo
            icon: Icons.person_pin_circle,
            placeholder: 'Curp',
            keyboardType: TextInputType.text,
            textController: curpCtrl,
          ),

          CustomInput(
            // Correo
            icon: Icons.person,
            placeholder: 'Fecha Nacimiento',
            keyboardType: TextInputType.text,
            textController:inputFielDateController,
            ontap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
              _selectDate( context);
            },
            enableInteractiveSelection: false,
          ),
          
        


        ],
      ),
    );
 }

_selectDate(BuildContext context)async{
  DateTime  picked = await showDatePicker(
    context: context, 
    initialDate: new DateTime.now(), 
    firstDate: new DateTime(1960), 
    lastDate: new DateTime(2025),
    locale:Locale('es','ES'),
    // helpText: 'Seleccione fecha'
  
       builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                    primary: Colors.redAccent[700],
                    onPrimary: Colors.white,
                    // surface: Colors.pink,
                    // onSurface: Colors.yellow,

                    ),
                dialogBackgroundColor:Components.generalBackgroundColor,
                
              ),
              child: child,
            );
          },



    
    );

    if ( picked != null) {
      setState(() {
      
              fecha= picked?.toString();
          print(fecha);
        // DateTime now = DateTime.now();
        // String formattedDate = DateFormat('DD/MM/yyyy - KK:mm').format(now);
        // print(formattedDate);
        
        
        // DateFormat  formDate= new DateFormat('dd/MM/yyyy','es-ES');
      
              
              

              
              // fecha= _formDate.format(picked);

              // inputFielDateController.text= fecha;
              // print(inputFielDateController.text);
            });
    }
}


 Widget _formularioTres(){
     return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(top: 40), 
      padding: EdgeInsets.symmetric(    horizontal:     50), 
      child: Column(
        children: <Widget>[    
          CustomInput(
            // Correo
            icon: Icons.person_pin_circle,
            placeholder: 'Municipio',
            keyboardType: TextInputType.text,
            textController: municipioCtrl,
          ),

          CustomInput(
            // Correo
            icon: Icons.person,
            placeholder: 'Region',
            keyboardType: TextInputType.text,
            textController: regionCtrl,
          ),
          
            BotonOk(text: 'enviar', onPressed: (){
              print('ok');
              print(nombreCtrl.text);
              print(apPaternoCtrl.text);
              print(apMaternoCtrl.text);
              print(sexoCtrl.text);
              print(curpCtrl.text);
              print(inputFielDateController.text);
              print(municipioCtrl.text);
              print(regionCtrl.text);
              // print(Ctrl.text);




            })
        ],
      ),
    );
 }



}

//