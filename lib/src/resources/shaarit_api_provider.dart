import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/shop_model.dart';
import '../models/coupon_model.dart';
import 'repository.dart';

class ShaaritApiProvider implements Source {
  Client client = Client();

//shop
  Future<List<ShopModel>> fetchShopsList() async {
    final response = await client.get('url/shops');
    final rawShopsList = json.decode(response.body);

    Future<List<ShopModel>> shopsList =
        rawShopsList.map((shop) => ShopModel.fromJson(shop)).toList();

    return shopsList;
  }

  Future<List<ShopModel>> fetchShopsListWithType(String type) async {
    // final response = await client.get('url$type');
    // final rawShopsList = json.decode(response.body);

    // Future<List<ShopModel>> shopsListWithType =
    //     rawShopsList.map((shop) => ShopModel.fromJson(shop)).toList();
    final shopsListWithType = [];
    await client
        .get('url/shops$type')
        .then((response) => response.body)
        .then(json.decode)
        .then((json) => json['result'])
        .then((shops) => shops.foreach(
            (shop) => shopsListWithType.add(ShopModel.fromJson(shop))));

    return shopsListWithType;
  }

  Future<List<ShopModel>> fetchShopsListWithCategory(String category) async {
    final shopsListWithCategory = [];
    await client
        .get('url/shops/$category')
        .then((response) => response.body)
        .then(json.decode)
        .then((json) => json['result'])
        .then((shops) => shops.foreach(
            (shop) => shopsListWithCategory.add(ShopModel.fromJson(shop))));

    return shopsListWithCategory;
  }

  Future<ShopModel> fetchShopDetail(int shopId) async {
    final response = await client.get('url/shops/$shopId');
    final parsedJson = json.decode(response.body);

    return ShopModel.fromJson(parsedJson);
  }

  //coupon
  Future<List<CouponModel>> fetchCouponsList() async {
    final response = await client.get('url/coupons');
    final rawCouponsList = json.decode(response.body);

    Future<List<CouponModel>> couponsList =
        rawCouponsList.map((coupon) => CouponModel.fromJson(coupon)).toList();
    return couponsList;
  }

  Future<List<CouponModel>> fetchCouponsListWithShopId(int shopId) async {
    final response = await client.get('url/coupons/$shopId');
    final parsedJson = json.decode(response.body);

    Future<List<CouponModel>> couponListWithShopId =
        parsedJson.map((coupon) => CouponModel.fromJson(coupon)).toList();
    return couponListWithShopId;
  }

  Future<List<CouponModel>> fetchCouponsListHasRecommanded(bool hasRecommanded) async{
    final response = await client.get('url/coupons/$hasRecommanded');
    final parsedJson = json.decode(response.body);

     Future<List<CouponModel>> couponListHasRecommanded = 
     parsedJson.map((coupon) => CouponModel.fromJson(coupon)).toList();

     return couponListHasRecommanded;
  }

  Future<CouponModel> fetchCouponDetail(int couponId) async{
    final response = await client.get('url/coupons/$couponId');
    final parsedJson = json.decode(response.body);

    return CouponModel.fromJson(parsedJson);
  }



}
