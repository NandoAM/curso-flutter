import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = PreferenciasUsuario._();

  PreferenciasUsuario._();

  factory PreferenciasUsuario () {
    return _instancia;
  }

  SharedPreferences _prefs;

  initPrefs() async{
    _prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero (int valor){
    _prefs.setInt('genero', valor);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }
 
  set colorSecundario(bool valor){
    _prefs.setBool('colorSecundario', valor);
  }

  get nombre {
    return _prefs.getString('nombre') ?? 'Pedro';
  }

  set nombre(String valor){
    _prefs.setString('nombre', valor);
  }

  get ultimaPagina{
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina (String valor){
    _prefs.setString('ultimaPagina', valor);
  }

  
}