
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
export 'package:qrreaderapp/src/models/scan_model.dart';

class DBProvider{

    static Database _database;
    static final DBProvider db = DBProvider._();

    DBProvider._();

    Future<Database> get database async {

        if (_database!=null){
          return _database;
        }
        
        _database = await initDB();

         return _database; 

    }

    initDB() async {

        Directory documentsDirectory =  await getApplicationDocumentsDirectory();

        final path =  join ( documentsDirectory.path, 'ScansDB.db');

        return await openDatabase(          
          path,
          version: 1,
          onOpen: (db){},
          onCreate: (Database db, int version) async{
            await db.execute(
              'CREATE TABLE Scans ('
               ' id INTEGER PRIMARY KEY,'
               ' tipo TEXT,'
               ' valor TEXT'
              ')'
            );
          }
         );

    }

    
    Future<int> insertScanRaw(ScanModel scan) async{

      final db =  await database;

      return  await db.rawInsert(
        "INSERT into Scans (id, tipo, valor) "
        "VALUES (${scan.id}, '${scan.tipo}', '${scan.valor}')"
      );
      
    }

    Future<int>  insertScan ( ScanModel scan) async{

      final db =  await database;

      return await db.insert('Scans', scan.toJson());      

    }

    Future<ScanModel> getScanId(int id) async{

      final db =  await database;

      final res =  await db.query('Scans',where: 'id=?', whereArgs: [id] );

      return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;

    }

    Future<List<ScanModel>> getAllScans() async{

      final db =  await database;

      final res =  await db.query('Scans');

      return res.isNotEmpty ? res.map( (c) => ScanModel.fromJson(c) ).toList() : [];

    }

    Future<List<ScanModel>> getScansByTipo(String tipo) async{

      final db =  await database;

      final res =  await db.rawQuery("SELCT * FROM Scans WHERE tipo='$tipo'");

      return res.isNotEmpty ? res.map( (c) => ScanModel.fromJson(c) ).toList() : [];

      

    }

     Future<int> updateScan(ScanModel scan) async{

      final db =  await database;

      return  await db.update('Scans',  scan.toJson() , where: 'id=?', whereArgs: [scan.id]);
      

    }

    Future <int> deleteScan(int id) async{

      final db =  await database;

      return  await db.delete('Scans', where: 'id=?', whereArgs: [id]);

      
    }

    Future <int> deleteAll() async{

      final db =  await database;

      return await db.rawDelete('DELETE FROM Scans');


    }
    


}