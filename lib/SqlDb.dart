import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
class SqlDb{

  static Database? _database;
  Future<Database?> get db async { // to ensure the table Crate or not to make intialDb one time not many time
    if (_database == null) {
      _database = await intialDb();
      return _database;
    } else {
      return _database;
    }
  }


   intialDb() async{
    String Databasepath = await getDatabasesPath(); //path al database 2ftrade
    String path = join(Databasepath, 'DatabaseProjectSoftwarz.db');//Databasepath/DatabaseProjectSoftware.db // .db like photo ,Jbj
    Database mydb = await openDatabase(path, onCreate: _onCreare, version: 1 , onUpgrade: _onUpgrade);
    return mydb;
  }
  // tab lw 7bet 23ml update ll database zawed al version w hynfez upgrade gdeda
  // _onCreare createted one time if add a new table will not added
  _onUpgrade(Database db , int oldVersion , int newVersion){
  print('onUpgrade Function');
  }



   _onCreare(Database db, int version)async{
     await db.execute(''' 
     CREATE TABLE "Upload_Customer_Product_Data"(
     "ItemID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
     "ItemName" TEXT NOT NULL

     )
     ''');
     // "ItemDescription" TEXT NOT NULL,
     // "ChildAgeMonth" INTEGER NOT NULL,
     // "childAgeYear" INTEGER NOT NULL,
     // "size" INTEGER NOT NULL,
     // "Category" TEXT NOT NULL,
     // "ImagesPaths" BLOB
     // lw i need to crate another table  await db.execute(''' w create al table ''');
     // A BLOB (large binary object) is an SQLite data type that stores large objects, typically large files such as images,
     //al two () al b3d al 2sm al Table dol 27ot fehom 2same al column
     //AUTOINCREMENT +1 BY ADD ITEM
     print("CREATE===================================================");
   }

   ReadDataFromDatabase(String sql) async{
   Database? read = await db;
   List<Map> response = await read!.rawQuery(sql);
   return response;
   } //Select Data the same MySql
// rawQuery('b7ot hna la select ');

  InsertDataFromDatabase(String sql) async{
    Database? read = await db;
    int response = await read!.rawInsert(sql);
    return response;
  } // return number of raw

  UpDateDataFromDatabase(String sql) async{
    Database? read = await db;
    int response = await read!.rawUpdate(sql);
    return response;
  }

  DeleteDataFromDatabase(String sql) async{
    Database? read = await db;
    int response = await read!.rawDelete(sql);
    return response;
  }
//Select
//Delete 
//Update
//Insert
}

