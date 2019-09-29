import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  

  final List<String> opciones = ['Uno','Dos','Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Componentes temp'),
      ),

      body: ListView(

        //children: _crearItems()
        children: _crearItemsCorta(),

      ),
    );
  }


 List<Widget> _crearItems(){

   List<Widget> lista=new List<Widget> ();

   for (String opcion in opciones) {

      final tempWidget = ListTile(

          title: Text(opcion),

      );
      

       lista..add(tempWidget)
            ..add(Divider());
     
   }

   return lista;
 }

 List<Widget> _crearItemsCorta(){

   return opciones.map( ( item ){

        return Column(
          children: <Widget>[
            ListTile(
              title: Text(item),
              subtitle: Text('Subtitulo'),
              leading: Icon(Icons.directions_bike),
              trailing: Icon (Icons.arrow_right),
              onTap: (){},
            ),
            Divider()
          ],
        );

    }).toList();

 }


}