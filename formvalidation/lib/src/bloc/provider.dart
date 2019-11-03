import 'package:flutter/material.dart';

import 'package:formvalidation/src/bloc/login_bloc.dart';
import 'package:formvalidation/src/bloc/productos_bloc.dart';
export 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();

  final _productosBloc = ProductosBloc();

  static Provider _instancia;


  factory Provider ({Key key, Widget child}) {
    if (_instancia == null){
      _instancia = new Provider._(key: key, child: child);
    }

    return _instancia;

  }

 
  
  Provider._({Key key, Widget child}) : super (key: key, child: child);

    @override
  bool updateShouldNotify( Provider oldWidget) {
    return true;
  }

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }

  static ProductosBloc productosBloc (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)._productosBloc;
  }


}