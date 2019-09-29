import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(

          appBar:  AppBar(
              title: Text('Avatar page'),
              actions: <Widget>[

                Container(

                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    
                    backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
                    radius: 25.0,
                  
                  ),
                ),

                Container(

                  margin: EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                    
                     child: Text('SL'),
                     backgroundColor: Colors.brown,
                  
                  
                  ),
                )

              ],
          ),
          body: Center(

            child: FadeInImage(

              image: NetworkImage('https://nuevaspalabras.com.ar/wp-content/uploads/2018/11/Stan-Lee.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),

            ),

          ),

    );

  }
}