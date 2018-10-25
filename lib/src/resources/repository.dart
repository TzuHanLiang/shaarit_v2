import 'dart:async';
import 'shaarit_api_provider.dart';
// import 'shaarit_db_provider.dart';
import '../models/coupon_model.dart';
import '../models/shop_model.dart';

class Repository {
  List<Source> sources = <Source>[
    // shaaritDbProvider,
    ShaaritApiProvider(),
  ];
  List<Cache> caches = <Cache>[
    // shaaritDbProvider,
  ];

  Future<List<ShopModel>> fetchShopsList() async {
    List<ShopModel> shopsList;
    var source;
    for (source in sources){
      shopsList = await source.fetchShopsList();
      if(shopsList != null){
        break;
      }
    }
    return shopsList;
  }
  Future<List<ShopModel>> fetchShopsListWithType(String type) async {
    List<ShopModel> shopsListWithType;
    var source;
    for (source in sources){
      shopsListWithType = await source.fetchShopsListWithType(type);
      if(shopsListWithType != null){
        break;
      }
    }
    return shopsListWithType;
  }

  Future<List<CouponModel>> fetchCouponsList() async{
    List<CouponModel> couponList;
    var source;
    for (source in sources){
      couponList = await source.fetchCouponsList();
      if(couponList != null){
        break;
      }
    }
    return couponList;
    
  }

  clearCache() async {
    for (var cache in caches) {
      // await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<ShopModel>> fetchShopsList();
  Future<List<CouponModel>> fetchCouponsList();
}

abstract class Cache {
  // Future<int> clear();
}
