import 'package:app_tarjeta/helpers/mostrar_alerta.dart';
import 'package:app_tarjeta/services/auth_service.dart';
import 'package:app_tarjeta/services/users/person_service.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:app_tarjeta/global/components.dart';

import 'package:app_tarjeta/pages/full_record/s.dart';

import 'package:app_tarjeta/widgets/full_record/dropDownButton.dart';
import 'package:app_tarjeta/widgets/full_record/pages_full_record.dart';

import 'package:app_tarjeta/widgets/login-register/custom_input.dart';
import 'package:app_tarjeta/widgets/login-register/boton_ok.dart';
import 'package:provider/provider.dart';





class RegisterPersonPage extends StatefulWidget {
  @override
  _RegisterPersonPageState createState() => _RegisterPersonPageState();
}

class _RegisterPersonPageState extends State<RegisterPersonPage> {

  final sexoCtrl = TextEditingController();
  final curpCtrl = TextEditingController();
  final nombreCtrl = TextEditingController();
  final apPaternoCtrl = TextEditingController();
  final apMaternoCtrl = TextEditingController();
  final municipioCtrl = TextEditingController();
  final regionCtrl = TextEditingController();

  final inputFielDateController = TextEditingController();

  String dropdownValue = 'Sexo';
  String fecha = '';


  PersonService personService;
  AuthService authService;

  @override
  void initState() {
   
    super.initState();
    this.authService= Provider.of<AuthService>(context, listen: false);
    this.personService = Provider.of<PersonService>(context, listen: false);
  
  }


  @override
  Widget build(BuildContext context) {

  // final personService = Provider.of<PersonService>(context, listen: true);
  // final authService = Provider.of<AuthService>(context, listen: true);


    return Scaffold(
        appBar: AppBar(
          title: const Text('Completa tus datos'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return LinearProgressPageIndicatorDemo();
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
            ),
          ],
        ),
        // backgroundColor: Color(0xffF2F2F2),
        backgroundColor: Components.generalBackgroundColor,
        body: Stack(
          children: <Widget>[
            Center(             // child: Container(    alignment: Alignment.bottomCenter,    child:    Image(image: AssetImage('assets/logoINJEO.png')))
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
              scrollBehavior: ScrollBehavior(),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[   
                PageFullRecord(_formularioUno()),
                PageFullRecord(_formularioDos()),
                PageFullRecord(_formularioTres()),
              ],
              // pageSnapping: false,
            ),
            Container(alignment: Alignment.bottomCenter, child: Text("desliza hasta terminar el formulario"))
          ],
        ));
  }


  Widget _formularioUno() {
    return Container(
      // color: Colors.red,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
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

  Widget _formularioDos() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          DropDownButton(
              dropdownValue: dropdownValue,
              onChanged: (String newValue) {
                print(newValue);
                setState(() {
                  dropdownValue = newValue;
                  sexoCtrl.text = dropdownValue;
                });
              },
              items: ['Sexo', 'Masculino', 'Femenino'],
              prefixIcon: Icons.group),

          CustomInput(
            icon: Icons.person_pin_circle,
            placeholder: 'Curp',
            keyboardType: TextInputType.text,
            textController: curpCtrl,
          ),

          CustomInput(
            icon: Icons.person,
            placeholder: 'Fecha Nacimiento',
            keyboardType: TextInputType.datetime,
            textController: inputFielDateController,
            ontap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              await _selectDate(context);
            },
            enableInteractiveSelection: false,
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1960),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'MX'),

      initialEntryMode: DatePickerEntryMode.calendarOnly,

      //  builder: (BuildContext context, Widget child) {
      //       return Theme(
      //         data: ThemeData.light().copyWith(
      //           colorScheme: ColorScheme.light(
      //               primary: Colors.redAccent[700],
      //               onPrimary: Colors.white,
      //               // surface: Colors.pink,
      //               // onSurface: Colors.yellow,

      //               ),
      //           dialogBackgroundColor:Components.generalBackgroundColor,

      //         ),
      //         child: child,
      //       );
      //     },
    );

    if (picked != null) {
      setState(() {
        // fecha= picked?.toString();
        // String formattedDate = DateFormat('DD/MM/yyyy - KK:mm').format(now);

        // DateTime now = DateTime.now();
        // String formattedDate = DateFormat('DD/MM/yyyy - KK:mm').format(now);
        // print(formattedDate);

//  final DateTime now = DateTime.now();
//   final DateFormat format = DateFormat('dd-MM-yyy');
//   final String formatted = format.format(now);
//   print(formatted);

// String   formatDate(DateTime date) => new DateFormat("MMMM d").format(picked);

// String dateSlug ="${picked.day.toString().padLeft(2,'0')}/${picked.month.toString().padLeft(2,'0')}/${picked.year.toString()}";

        // DateFormat  formDate= new DateFormat('DD/mM/yyyy');
        // DateFormat.yMMMMd('en_US')


        DateFormat formDateCast = new DateFormat('dd-MM-yyy');
        String fechaNacimiento = formDateCast.format(picked);
        inputFielDateController.text = fechaNacimiento;

        // print(fechaNacimiento);


        // DateFormat formDate = new DateFormat.yMMMMd('es_MX');
        // fecha = formDate.format(picked);
        // inputFielDateController.text = fecha;



// String edad = '';
// DateTime currentDate = DateTime.now();
// edad = '${currentDate.difference(picked).inDays}';
   


        print(inputFielDateController.text);
      });
    }
  }

  Widget _formularioTres() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.person_pin_circle,
            placeholder: 'Municipio',
            keyboardType: TextInputType.text,
            textController: municipioCtrl,
          ),

          CustomInput(
            icon: Icons.person,
            placeholder: 'Region',
            keyboardType: TextInputType.text,
            textController: regionCtrl,
          ),

          BotonOk(
              text: 'enviar',
              color: (this.personService.autenticando) ? Colors.blueGrey : Colors.red,
              onPressed: 
                      (this.personService.autenticando)
                                ? null
                                :() async {

                                  final registroOk = await personService.register(
                                    nombreCtrl.text,
                                    apPaternoCtrl.text,
                                    apMaternoCtrl.text,
                                    sexoCtrl.text,
                                    curpCtrl.text,
                                    inputFielDateController.text,
                                    municipioCtrl.text,
                                    regionCtrl.text,
                                    authService.usuario.id
                                    );
                                  if (registroOk == true) {
                                    Navigator.pushReplacementNamed(context, 'botones');
                                  } else {
                                    // print(registroOk);
                                    mostrarAlerta(context, 'Registro incorrecto', registroOk);
                                  }
                                }

              // () {
                // print('ok');
                // print(nombreCtrl.text);
                // print(apPaternoCtrl.text);
                // print(apMaternoCtrl.text);
                // print(sexoCtrl.text);
                // print(curpCtrl.text);
                // print(inputFielDateController.text);
                // print(municipioCtrl.text);
                // print(regionCtrl.text);
              // }
               )
        ],
      ),
    );
  }
}

//
