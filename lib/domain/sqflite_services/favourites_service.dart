import 'dart:developer';

import 'package:save_cost/domain/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class FavouriteServices{
  final String tableProducts='productsTable';
  final String columnId='productId';
  final String columnProductName='productName';
  final String columnProductPrice='productPrice';
  final String columnProductAddress='productAddress';
  final String columnProductDescription='productDescription';
  final String columnProductSize='productSize';
  final String columnProductColor='productColor';
  final String columnProductImage='productImage';
  final String columnProductRate='productRate';
  final String columnProductSearchTimes='productSearchTimes';
  final String columnProductQuantity='productQuantity';
  final String columnProductSellTimes='productSellTimes';
  final String columnProductSeller='productSeller';
  final String columnProductDiscount='productDiscount';
  static Database? _db;

  Future<int> addToFavourite(Product myProduct)async{
    var dbClient = await db;
    return await dbClient.insert(tableProducts, myProduct.toDb());
  }

  Future<List<Product>> getFavouriteProducts()async{
    List<Product> products = [];
    var dbClient = await db;
    var favouritesList = await dbClient.query(tableProducts,
        columns: [columnId,columnProductName,columnProductPrice,
          columnProductAddress,columnProductDescription,columnProductSize,
          columnProductColor,columnProductImage,columnProductRate,columnProductSearchTimes,
          columnProductQuantity,columnProductSellTimes,columnProductSeller,columnProductDiscount]
    );
    favouritesList.forEach((element) {    // {}
      products.add(Product.fromDb(element));
    });
    return products;
  }


   Future<Database> get db async{
    if(_db!=null){
      return _db!;
    }
    _db=await initDb();
    return _db!;
  }

  initDb()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,'Favourites.db');
    var db = await openDatabase(path,version: 1,onCreate: _onCreate,onOpen: _onOpen,singleInstance: true);
    return db;
  }

  _onOpen(Database db) async {
    // Database is open, print its version
    log('db version ${await db.getVersion()}');
  }

  void _onCreate(Database db, int version)async{
    var sql ='create table $tableProducts($columnId text,'
        '$columnProductName text,'
        '$columnProductPrice text,'
        '$columnProductAddress text,'
        '$columnProductDescription text,'
        '$columnProductSize text,'
        '$columnProductColor text,'
        '$columnProductImage text,'
        '$columnProductRate text,'
        '$columnProductSearchTimes text,'
        '$columnProductQuantity text,'
        '$columnProductSellTimes text,'
        '$columnProductDiscount text,'
        '$columnProductSeller text)';
    await db.execute(sql);
  }

  Future<int> deleteProductFromFavourites(String name)async{
    var dbClient = await db;
    return await dbClient.delete(tableProducts,where: '$columnProductName=?',whereArgs: [name]);
  }

  Future closeDb()async{
    var dbClient = await db;
    return await dbClient.close();
  }
}