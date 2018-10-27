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
    for (source in sources) {
      shopsList = await source.fetchShopsList();
      if (shopsList != null) {
        break;
      }
    }
    return shopsList;
  }

  Future<ShopModel> fetchShopDetail(int shopId) async {
    ShopModel shopDetail;
    var source;
    for (source in sources) {
      shopDetail = await source.fetchShopDetail();
      if (shopDetail != null) {
        break;
      }
    }
    return shopDetail;
  }
// This two functions below may be done by transformer
  Future<List<ShopModel>> fetchShopsListWithType(String type) async {
    List<ShopModel> shopsListWithType;
    var source;
    for (source in sources) {
      shopsListWithType = await source.fetchShopsListWithType(type);
      if (shopsListWithType != null) {
        break;
      }
    }
    return shopsListWithType;
  }

  Future<List<ShopModel>> fetchShopsListWithCategory(String category) async {
    List<ShopModel> shopsListWithCategory;
    var source;
    for (source in sources) {
      shopsListWithCategory = await source.fetchShopsListWithCategory(category);
      if (shopsListWithCategory != null) {
        break;
      }
    }
    return shopsListWithCategory;
  }




  Future<List<CouponModel>> fetchCouponsList() async {
    List<CouponModel> couponList;
    var source;
    for (source in sources) {
      couponList = await source.fetchCouponsList();
      if (couponList != null) {
        break;
      }
    }
    return couponList;
  }

  Future<CouponModel> fetchCouponDetail(int couponId) async {
    CouponModel couponDetail;
    var source;
    for (source in sources) {
      couponDetail = await source.fetchCouponDetail();
      if (couponDetail != null) {
        break;
      }
    }
    return couponDetail;
  }


  // This two functions below may be done by transformer
  Future<List<CouponModel>> fetchCouponsListWithShopId(int shopId) async {
    List<CouponModel> couponListWithShopId;
    var source;
    for (source in sources) {
      couponListWithShopId = await source.fetchCouponsListWithShopId(shopId);
      if (couponListWithShopId != null) {
        break;
      }
    }
    return couponListWithShopId;
  }

  Future<List<CouponModel>> fetchCouponsListHasRecommanded(bool hasRecommanded) async {
    List<CouponModel> couponListHasRecommanded;
    var source;
    for (source in sources) {
      couponListHasRecommanded = await source.fetchCouponsListHasRecommanded(hasRecommanded);
      if (couponListHasRecommanded != null) {
        break;
      }
    }
    return couponListHasRecommanded;
  }

  
  clearCache() async {
    for (var cache in caches) {
      // await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<ShopModel>> fetchShopsList();
  Future<ShopModel> fetchShopDetail(int shopId);
  Future<List<CouponModel>> fetchCouponsList();
  Future<CouponModel> fetchCouponDetail(int couponId);
}

abstract class Cache {
  // Future<int> clear();
}
