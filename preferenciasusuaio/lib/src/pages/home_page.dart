import 'package:flutter/material.dart';
import 'package:preferenciasusuaio/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuaio/src/widgets/menu_widget.dart';


class HomePage extends StatelessWidget {

  static final String routeName = 'home';  
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

     prefs.ultimaPagina = HomePage.routeName;
    
      return Scaffold(
          appBar: AppBar(
            title: Text('Preferencias de usuario'),
            backgroundColor: (prefs.colorSecundario ? Colors.teal : Colors.blue),
          ),
          drawer: MenuWidget(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Text('Color secundario ${prefs.colorSecundario}'),
                Divider(),
                Text('Genero ${prefs.genero}'),
                Divider(),
                Text('Nombre usuario: ${prefs.nombre}'),
                Divider(),
            ],
          ),

      );
  }

}