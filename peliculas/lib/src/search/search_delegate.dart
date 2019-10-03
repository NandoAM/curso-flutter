import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate{


  final peliculasProvider = new PeliculasProvider();

  final peliculas = ['El caballero oscuro','Vengadores: Infinity War', 'El imperio contraataca', 'Iron man', 'Dead pool', 'Thor', 'Spiderman'];

  final peliculasRecientes= ['Spiderman', 'Hulk'];

  String seleccion = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones que tendra el AppBar
    return [

        IconButton(
          icon: Icon( Icons.clear),
          onPressed: (){
            query = '';
          },
        )

    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,        
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen al escribir.

    if (query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      
        future: peliculasProvider.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot){

          if(snapshot.hasData){

            final peliculas = snapshot.data;

            return ListView(
              children: peliculas.map((pelicula){
                  return ListTile(
                    leading: FadeInImage(
                      image: NetworkImage(pelicula.getPosterImg()),
                      placeholder: AssetImage('assets/img/no-image.jpg'),
                      width: 50.0,
                      fit: BoxFit.cover
                    ),
                    title: Text(pelicula.title),
                    subtitle: Text(pelicula.originalTitle),
                    onTap: (){
                      close(context, null);
                      pelicula.uniqueId = '';
                      Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                    },
                  );
              }).toList(),
            );

          }else{
            return Center(child: CircularProgressIndicator());
          }

        },

    );


  }

  

}