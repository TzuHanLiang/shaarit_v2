import 'dart:async';
import 'dart:convert';

//先不用repository， api <=> bloc <=> ui widget 之後再加進來 api, db<=> repository <=> bloc <=> ui widget
// import '../resources/shaarit_api_provider.dart';
import '../api/shaarit_shop_api.dart';
import 'bloc_provider.dart';
import '../models/shop_model.dart';

import '../models/shop_filters.dart';

// import '../models/shop_page_result.dart';
// 他的 moviepageresult 是為了得到  List<MovieCard> movies 
//  = (json['results'] as List).map((json) => MovieCard.fromJSON(json)).toList();
// 跟我直接從我們的資料庫得到的 List<String, dynamic> 要轉成 List<ShopModel> 一樣

import 'package:rxdart/rxdart.dart';

class ShopCategoryBloc implements BlocBase{
  void dispose(){}
}