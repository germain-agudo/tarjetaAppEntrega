import 'package:flutter/material.dart';


class SegundoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('sdf'),),
      // body: _Titulo(),
      // body: _ListaTareas(),
      body: Stack(children: <Widget>[
        _MainScroll(),
        Positioned(
          bottom: -10,
          right: 0,
          child: _BotonNewList()
          )
      ],),
    );
   
  }

}
 

class _BotonNewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      // minWidth: size.width * 0.9,
      height: 150,
      


      child:ElevatedButton(
        
child: Container(
  height: size.height *0.1,
  width: size.width * 0.7,
  child: Center(
    child:Text('CREATE NEW LIST', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ) ,
  ),
),

        onPressed: (){}, 
        // icon: Icon(Icons.save), 
        // label: 
        style: ButtonStyle(
          
          shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only( topLeft: Radius.circular(50))
            )
          ),
          
          // backgroundColor: MaterialStateProperty.all(Colors.red[400])  

        ),
        ) ,
    );
  }
}



class _MainScroll extends StatelessWidget {
  // const _MainScroll({ Key? key }) : super(key: key);
final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
// Container(child: Text('dsd')),

  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
          // SliverAppBar(
          //   backgroundColor: Colors.red,
          //   title: Text('Hola Mundo'),

          //   floating: true,
          //   elevation: 0,
          // ),

    SliverPersistentHeader(
      floating: true,
      delegate:  _SliverCustomHeaderDelegate(
        minheight: 200,
        maxheight:200,

        child: Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          child: _Titulo()
          ) 
      )
      ),

          SliverList(
            // delegate: SliverChildListDelegate( []  )
            delegate: SliverChildListDelegate( [
              
              ...items,
              SizedBox(height: 100,)
              
              ] )
            ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{
  
final double minheight;
final double maxheight;
final Widget child;

_SliverCustomHeaderDelegate(
{  
  @required this.minheight, 
  @required this.maxheight, 
  @required this.child
  }
  
  );  
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // tODO: implement build
  return SizedBox.expand(child: child,);
  }

  @override //estes es el tamaño maximo que va a utilozar
  // tODO: implement maxExtent
  // double get maxExtent => (minheight> maxheight)? minheight:maxheight;
  double get maxExtent => maxheight;

  @override
  // tODO: implement minExtent
  double get minExtent => minheight;

  @override //para redibujar 
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    // tODO: implement shouldRebuild
   return maxheight != oldDelegate.maxheight || 
          minExtent != oldDelegate.minheight ||
          child != oldDelegate.child;
  }
}




class _Titulo extends StatelessWidget {
  // const _Titulo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Container(

            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text('Oaxaca', style: TextStyle( color:  Color(0xff531228), fontSize: 50,)),
          ),
              Stack(
                children: <Widget>[
                 SizedBox(width: 100,),

                  Positioned(
                    bottom: 8,
                    child: Container(
                      width: 150,
                      height:  8,
                      color: Color(0xffF7CDD5),
                  
                    ),
                  ),

                  Container(
                    child: Text('INJEO', style: TextStyle( color: Color(0xffD93A30) , fontSize: 50,  fontWeight: FontWeight.bold),),
                  )
                ],
              )

        ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

 
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: items.length,
      itemBuilder:(BuildContext context, int index)=>items[index],
      
    );
  }
}

class _ListItem extends StatelessWidget {
final String titulo;
final Color color;

  const _ListItem( this.titulo, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,//este para abajo y en medio
      padding: EdgeInsets.all(30),
      child: Text(titulo,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 20),),
        height: 130,
        // width: 100,
        margin: EdgeInsets.all(10),
        // color: Colors.red,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
        ),
    );
  }
}