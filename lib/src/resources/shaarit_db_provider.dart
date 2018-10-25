import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/shop_model.dart';
import '../models/coupon_model.dart';
import 'repository.dart';

class ShaaritDbProvider
// implements Source, Cache
{
  Database couponDb;
  Database shopDb;

  ShaaritDbProvider() {
    init();
  }
  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'shaarit.db');
    shopDb = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      db.execute("""
        CREATE TABLE Shops
        (
          shopId INTEGER PRIMARY KEY,
          image TEXT,
          shopName TEXT,
          shopType TEXT,
          category TEXT,
          distance DOUBLE,
          rebate DOUBLE,
          amount DOUBLE
        )
        """);
    });

    couponDb = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""
        CREATE TABLE Coupons
        ( 
          userId INTEGER PRIMARY KEY,
          couponId INTEGER,
          aquiredId INTEGER,
          recipientId INTEGER,
          reason TEXT,
          response TEXT,
          giver BLOB,
          transferee BLOB,
          image TEXT,
          shopName TEXT,
          shopType TEXT,
          category TEXT,
          amount DOUBLE
          isAvailable INTEGER
        )  
        """);
      },
    );
  }

  List<Future<int>> addShopsList(List<ShopModel> shopsList) {
    List<Future<int>> shopsIndex;
    shopsIndex = shopsList
        .map((shop) => shopDb.insert(
              'Shops',
              shop.toMap(),
              conflictAlgorithm: ConflictAlgorithm.ignore,
            ))
        .toList();
    return shopsIndex;
  }

  Future<List<ShopModel>> fetchShopTpypeList(String categories) async {
    final maps = await shopDb.query(
      "Coupons",
      columns: null,
      where: 'shopType ?',
      whereArgs: [categories],
    );

    if (maps.length > 0) {
      return null;
    }

    return null;
  }


  List<Future<int>> addCouponsList(List<CouponModel> couponsList) {
    List<Future<int>> couponsIndex;
    couponsIndex = couponsList
        .map((coupon) => couponDb.insert(
              'Coupons',
              coupon.trunCouponModeltoMapforDb(),
              conflictAlgorithm: ConflictAlgorithm.ignore,
            ))
        .toList();
    return couponsIndex;
  }

  final shaaritDbProvider = ShaaritDbProvider();
}
