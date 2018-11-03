import 'shop_model.dart';

class ShopsList {
  final List<ShopModel> shops;

// assume data structure is Nested structures with Lists
  ShopsList.fromJSON(Map<String, dynamic> parsedJson)
      : shops = (parsedJson['results'] as List)
            .map((shop) => ShopModel.fromJson(shop))
            .toList();
            
// assume data structure is List of maps
  ShopsList.fromJson(List<Map<String, dynamic>> parsedJson)
      : shops = parsedJson.map((shop) => ShopModel.fromJson(shop)).toList();
}
