import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
export 'package:formvalidation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {


  static Provider _instancia;

  factory Provider ({Key key, Widget child}) {
    if (_instancia == null){
      _instancia = new Provider._(key: key, child: child);
    }

    return _instancia;

  }

  final loginBloc = LoginBloc();
  
  Provider._({Key key, Widget child}) : super (key: key, child: child);

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBloc;
  }

  @override
  bool updateShouldNotify( Provider oldWidget) {
    return true;
  }
}