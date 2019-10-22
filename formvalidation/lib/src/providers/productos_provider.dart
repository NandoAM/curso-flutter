import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class ProductosProvider {

  final String _url = 'https://flutter-varios-616b4.firebaseio.com';


  Future<List<ProductoModel>> cargarProductos() async {

    final url = '$_url/productos.json';

    final response = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(response.body);

    final List<ProductoModel> productos =  new List();

    if (decodedData == null) return [];
    
    decodedData.forEach((id,prod){

        final prodTemp =  ProductoModel.fromJson(prod);
        prodTemp.id =  id;

        productos.add(prodTemp);

    });

    return productos;

  }

  Future<bool> crearProducto(ProductoModel producto) async{

        final url = '$_url/productos.json';

        final response = await http.post(url, body:productoModelToJson(producto));

        final decodedData = json.decode(response.body);

        print (decodedData);

        return true;
  }

    Future<bool> editarProducto(ProductoModel producto) async{

        final url = '$_url/productos/${producto.id}.json';

        final response = await http.put(url, body:productoModelToJson(producto));

        final decodedData = json.decode(response.body);

        print (decodedData);

        return true;
  }

  Future<int> borrarProducto(String id) async{

    final url = '$_url/productos/$id.json';

    final response =  await http.delete(url);

    print (json.decode(response.body));

    return 1;
  }

  Future<String> subirImagen(File imagen) async{


      final url =  Uri.parse('https://api.cloudinary.com/v1_1/dlwp7nzk4/image/upload?upload_preset=bbiuawpu');

      final mimeType = mime(imagen.path).split('/');

      final imageUploadRequest =  http.MultipartRequest(
        'POST',
        url
      );

      final file = await http.MultipartFile.fromPath(
        'file',
         imagen.path,
         contentType:  MediaType(mimeType[0],mimeType[1])
      );

      imageUploadRequest.files.add(file);

      final streamResponse = await imageUploadRequest.send();

      final response = await http.Response.fromStream(streamResponse);

      if ( response.statusCode != 200 && response.statusCode!=201){
        print('Algo fue mal: $response.body');        
        return null;
      }

      final respData = json.decode(response.body);

      print (respData);

      return respData['secure_url'];



  }
  
}