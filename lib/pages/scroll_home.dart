import 'package:app_tarjeta/pages/login_page.dart';
import 'package:app_tarjeta/widgets/scroll_home/welcome_page.dart';
import 'package:flutter/material.dart';

class ScrollHomePage extends StatelessWidget {
  // const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[_bienvenida(), LoginPage()],
      ),
    );
  }

  Widget _bienvenida() {
    return Stack(
      children: <Widget>[
        WelcomePage(),
        Center(
          child: Row(
            children: [
              Expanded(child: Container()),
              Text('desliza'),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 80.0,
                color: Colors.red[400],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
