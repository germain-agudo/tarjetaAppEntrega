import 'package:app_tarjeta/global/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:photo_view/photo_view.dart';
class ViewImgeWidget extends StatelessWidget {
  // const NoticiaWidget({ Key? key }) : super(key: key);
final String img;

  const ViewImgeWidget({
    @required this.img
    });


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.transparent,
//     appBar: AppBar(
//       // backwardsCompatibility: true,
//       shadowColor: Colors.black,
//       backgroundColor:Colors.black,
//       // elevation: 0,    
//       foregroundColor: Colors.transparent,
// automaticallyImplyLeading: false,
// leading: Container(  
//   child: IconButton(onPressed: (){Navigator.pop(context);}, icon: FaIcon( FontAwesomeIcons.arrowCircleLeft, color: Components.generalBackgroundColor, size: 40,)  ),
// ),      
//     ),

      body:
      
  //     Container(
  //   child: PhotoView(

  //     imageProvider: NetworkImage(
  //       img
  //     ),
  //   )
  // )




     Center(

       child: Container(

// color: Colors.black,
         width: double.infinity,
         height: double.infinity,
         child:  FadeInImage(
                               placeholder: AssetImage('assets/jar-loading.gif'), 
                               image: NetworkImage(img),
                                
                               // height: double.infinity,
                               // width: double.infinity,
                               fit:BoxFit.scaleDown,
                               alignment: Alignment.center,
                               ),
       ),
     ) 









    //  Center(child: Text(noticia),) 
      //  Center(
      //   child: FittedBox(
      //     child: Container(
      //       width: double.infinity,
      //       height: double.infinity,
      //       child: FadeInImage(
      //                          placeholder: AssetImage('assets/jar-loading.gif'), 
      //                          image: NetworkImage(noticia),
                                
      //                          // height: double.infinity,
      //                          // width: double.infinity,
      //                         //  fit:BoxFit.scaleDown,
      //                          alignment: Alignment.center,
      //                          ),
      //     ),
      //   ),
      // ),
    );
  }
}