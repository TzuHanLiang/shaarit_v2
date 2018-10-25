import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/shop_model.dart';
import '../models/coupon_model.dart';
import 'repository.dart';

class ShaaritApiProvider implements Source {
  Client client = Client();

  Future<List<ShopModel>> fetchShopsList() async {
    final response = await client.get('url');
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
        .get('url$type')
        .then((response) => response.body)
        .then(json.decode)
        .then((json) => json['result'])
        .then((shops) => shops.foreach(
            (shop) => shopsListWithType.add(ShopModel.fromJson(shop))));

    return shopsListWithType;
  }

  Future<List<CouponModel>> fetchCouponsList() async {
    final response = await client.get('url');
    final rawCouponsList = json.decode(response.body);

    Future<List<CouponModel>> couponsList =
        rawCouponsList.map((coupon) => CouponModel.fromJson(coupon)).toList();
    return couponsList;
  }
}
