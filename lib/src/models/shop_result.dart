import 'shop_model.dart';

class ShopResult {
  // final int unknown;
  // final int unknown;
  // final int unknown;
  final List<ShopModel> shops;

  ShopResult.fromJSON(Map<String, dynamic> json)
    // : unknown = json['unknown'],
      // unknown = json['unknown'],
      // unknown = json['unknown'],
      : shops = (json['results'] as List).map((json) => ShopModel.fromJson(json)).toList();
}


//assume 資料型態跟 tmdb 的類似 https://developers.themoviedb.org/4/list/get-list