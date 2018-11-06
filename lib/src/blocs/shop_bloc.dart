import 'dart:async';
import 'dart:convert';

//先不用repository， api <=> bloc <=> ui widget 之後再加進來 api, db<=> repository <=> bloc <=> ui widget
// import '../resources/shaarit_api_provider.dart';
import '../api/api.dart';
import 'bloc_provider.dart';
import '../models/shop_model.dart';
import '../models/shops_list_model.dart';

import '../models/shop_filters.dart';

// import '../models/shop_page_result.dart';
// 他的 moviepageresult 是為了得到  List<MovieCard> movies
//  = (json['results'] as List).map((json) => MovieCard.fromJSON(json)).toList();
// 跟我直接從我們的資料庫得到的 List<String, dynamic> 要轉成 List<ShopModel> 一樣

import 'package:rxdart/rxdart.dart';

class ShopBloc implements BlocBase {
  ShopBloc();
  ShopBloc.shopInfo(String shopId) {
    /// ShopModel _fetchShopInfo(shopId){
    ///   ShopModel shop = api.get(url${shopId}); 
    ///   retrun shop
    /// }
    /// _inShop.add(shop);
  }

  PublishSubject<List<ShopModel>> _shopsController =
      PublishSubject<List<ShopModel>>();
  Sink<List<ShopModel>> get _inShopsList => _shopsController.sink;
  Stream<List<ShopModel>> get outShopsList => _shopsController.stream;

  PublishSubject<ShopModel> _shopController = PublishSubject<ShopModel>();
  Sink<ShopModel> get _inShop => _shopController.sink;
  Stream<ShopModel> get outShop => _shopController.stream;

  void dispose() {
    _shopController.close();
    _shopsController.close();
  }
}
