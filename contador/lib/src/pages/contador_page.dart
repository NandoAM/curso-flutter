import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>  _ContadorPageState(); 

}


class _ContadorPageState extends State<ContadorPage> {

  final _estiloTexto = new TextStyle( fontSize: 25);

  int _contador = 0;


  @override
  Widget build(BuildContext context) {    
    
        return Scaffold(
          
          
          appBar: AppBar(
            title: Text('Contador: Stateful'),
            centerTitle: true          
            ),
            
            body: Center(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                
                children: <Widget>[
                  Text('Numero de clicks:' , 
                        style: _estiloTexto,
                  ),
                  Text('$_contador',
                      style: _estiloTexto,
                  )

              ],)
            ),

            floatingActionButton: _crearBotones()

        );

  }

  Widget _crearBotones(){

    return Row(
      
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton (child: Icon(Icons.exposure_zero), onPressed: _resetearContador),
        Expanded(child: SizedBox()),
        FloatingActionButton (child: Icon(Icons.remove), onPressed: _restarContador),
        SizedBox(width: 5.0),
        FloatingActionButton (child: Icon(Icons.add), onPressed: _sumarContador),
      ],
    
    );
  }

  void _sumarContador() {

      _contador++;
      setState(() {
        
      });
  }

  void _restarContador() {      
    setState(() => _contador--);
}

  void _resetearContador() {

      _contador=0;
      setState(() {
        
      });
  }

  

  

} 