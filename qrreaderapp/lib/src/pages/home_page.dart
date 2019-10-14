import 'package:flutter/material.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreaderapp/src/utils/utils.dart' as utils;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scansBloc.deleteAllScans();
            },            
          )
        ],
      ),
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

          child: Icon(Icons.filter_center_focus),
          onPressed: () =>_scanQR(context),
          backgroundColor: Theme.of(context).primaryColor,

      ),
    );
  }

  _scanQR(BuildContext context) async{
    
    //web= https://librosdeterror.com
    //geo = 38.1680621,-6.6553369,17
    
    String futureString = '';

    try{

        //futureString = await new QRCodeReader().scan();
        futureString = await new QRCodeReader()
               .setAutoFocusIntervalInMs(200) // default 5000
               .setForceAutoFocus(true) // default false
               .setTorchEnabled(true) // default false
               .setHandlePermissions(true) // default true
               .setExecuteAfterPermissionGranted(true) // default true
               .scan();

    }catch(e){
        futureString = e.toString();
    }


//   String futureString = 'https://librosdeterror.com';   


    if(futureString!=null){

       final scan = ScanModel(valor: futureString);
       scansBloc.addScan(scan);

      utils.abrirScan(context, scan);

    }

  }

  Widget _callPage(int paginaActual){

    switch (paginaActual) {
      case 0:
        return MapasPage();
        break;
      case 1:
        return DireccionesPage();  
        break;
      default:
        return MapasPage();
    }

  }

  Widget _crearBottomNavigationBar(){

    return BottomNavigationBar(

      currentIndex: currentIndex,
      onTap: (index) {

        setState(() {
          currentIndex = index; 
        });

      },
      items: [

         BottomNavigationBarItem(
           icon: Icon(Icons.map),
           title: Text('Mapas')
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.directions),
           title: Text('Direcciones')
         ),

      ],

    );

  }
}