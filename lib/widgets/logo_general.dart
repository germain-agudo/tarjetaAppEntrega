import 'package:flutter/material.dart';
//Logo

class LogoGeneral extends StatelessWidget {
  // const _logo({ Key? key }) : super(key: key);
  final String tiutlo;

  const LogoGeneral({Key key, @required this.tiutlo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //
        margin: EdgeInsets.only(top: 40),

        //El contenido va a estar restringido con el
        width: 400,
        // height: 500,
        // width: MediaQuery.of(context).size.height * 1.6,
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/logoINJEO.png'),
              // fit: BoxFit.cover,
            ),
            Text(
              this.tiutlo,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
