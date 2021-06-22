import 'package:flutter/material.dart';

class PageFullRecord extends StatelessWidget {
  // const PageFullRecord({ Key? key }) : super(key: key);
final Widget formulario;

  const PageFullRecord(
     this.formulario
    );
  @override
  Widget build(BuildContext context) {
    return  Center(
       
              child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
                
                child: Column(
                  children: <Widget>[                    
                   formulario
                  ],
                ),
              ),
              // child: Text('sdfe'),
            );
  }
}