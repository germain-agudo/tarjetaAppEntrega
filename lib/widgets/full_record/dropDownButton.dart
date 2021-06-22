import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  // const DropDownButton({ Key? key }) : super(key: key);
  final String dropdownValue;
  // final TextEditingController textEditingController;
  final Function onChanged;
  final IconData  prefixIcon;
  final IconData  dropdownButtonIcon;
  final List<String> items;
  const DropDownButton(
    {
      @required this.dropdownValue, 
      // @required this.textEditingController, 
      @required this.onChanged, 
      @required this.items,
      @required this. prefixIcon,
      this.dropdownButtonIcon=Icons.arrow_downward,
    }
    );

  


  @override
  Widget build(BuildContext context) {


    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20), //Esto es para que no se pegue al finalde mi margen

      margin: EdgeInsets.only(bottom: 20), //para hacer una separacion
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black.withOpacity(0.05), // color con opacidad,
            offset: Offset(0, 5), //Para la direccion se la sombra
            blurRadius: 5)
      ]),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: 
              Icon(
                // Icons.supervised_user_circle_sharp,
                this.prefixIcon,
                color: Colors.black54,
              )
              
              
              ),
          Text(items[0].toString(), style: TextStyle(fontSize: 16, color: Colors.black54)),
          Expanded(child: Container()),
          DropdownButton<String>(
            value: dropdownValue,

            icon: Icon(
              // Icons.arrow_downward,
              this.dropdownButtonIcon,
              // color: Colors.red,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black54),
            underline: Container(
              height: 2,
              color: Colors.black54,
            ),

            onChanged: 
            onChanged,
            // (String newValue) {
            //       print(newValue);
            //       setState(() {
            //         dropdownValue = newValue;
            //         textEditingController.text=dropdownValue;
            //       });
            //             },

            // items: <String>['Sexo', 'Masculino', 'Femenino']
            items: items.map<DropdownMenuItem<String>>((String value) {
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
}
