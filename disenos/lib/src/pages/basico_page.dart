import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

 final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
 final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
           children: <Widget>[
          _crearImagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto()          
          ],
        ),
      ),
    );
  }

  Widget _crearImagen(){
    return  Image(
      image: NetworkImage('https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
      height: 180.0,
      width: double.infinity,
      fit: BoxFit.cover,  
      );
  }

  Widget _crearTitulo(){
    
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text('Lago con un puente', style: estiloTitulo),
                        SizedBox(height: 7.0),
                        Text('Un lago muy bonito en Alemania.', style: estiloSubTitulo)
                    ],
                ),
              ),

              Icon(Icons.star, color: Colors.red, size: 30.0,),
              Text('41', style: TextStyle (fontSize: 20.0))
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones(){

    return Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[

            _crearAccion(Icons.call, 'CALL'),
            _crearAccion(Icons.near_me, 'ROUTE'),
            _crearAccion(Icons.share, 'SHARE'),
            

        ],

    );

  }

  Widget _crearAccion(IconData icon, String texto){

      return Column(
              children: <Widget>[

                Icon (icon, color: Colors.blue, size: 40.0,),
                SizedBox(height: 5.0,),
                Text (texto, style: TextStyle (fontSize: 15.0, color: Colors.blue))
              ],
      );

  }

  Widget _crearTexto(){

      return SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Text(
            'Lorem fistrum nisi eiusmod ese hombree irure nisi. Laboris diodeno no te digo trigo por no llamarte Rodrigor está la cosa muy malar diodeno ut te voy a borrar el cerito diodeno ad ese que llega. A peich ese hombree a wan va usté muy cargadoo. Aute a wan ese pedazo de esse qué dise usteer pupita ese pedazo de. Benemeritaar la caidita esse qué dise usteer minim diodenoo mamaar consequat aliqua enim irure. Condemor magna diodeno reprehenderit esse voluptate ad caballo blanco caballo negroorl. Pupita de la pradera aliquip por la gloria de mi madre benemeritaar laboris ut consequat duis veniam commodo. Occaecat ese pedazo de occaecat hasta luego Lucas. Esse mamaar ex caballo blanco caballo negroorl commodo et va usté muy cargadoo sexuarl ahorarr tiene musho peligro hasta luego Lucas.',
            textAlign: TextAlign.justify,
            )
        ),
      );

  }

}

