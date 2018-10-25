class ShopModel {
  final int shopId;
  final String image;
  final String shopName;
  final String shopType;
  final String category;
  final double distance;
  final double rebate;
  final double amount;
  final bool visit;

  ShopModel.fromJson(Map<String, dynamic> parsedJson)
      : shopId = parsedJson['shopId'],
        image = parsedJson['image'],
        shopName = parsedJson['shopName'],
        shopType = parsedJson['shopType'],
        category = parsedJson['category'],
        distance = parsedJson['distance'],
        rebate = parsedJson['rebate'],
        amount = parsedJson['amount'],
        visit = parsedJson['visit'] ?? false;


  ShopModel.fromDb(Map<String, dynamic> parsedJson)
      : shopId = parsedJson['shopId'],
        image = parsedJson['image'],
        shopName = parsedJson['shopName'],
        shopType = parsedJson['shopType'],
        category = parsedJson['category'],
        distance = parsedJson['distance'],
        rebate = parsedJson['rebate'],
        amount = parsedJson['amount'],
        visit = parsedJson['visit'] == 1;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shopId': shopId,
      'image': image,
      'shopName': shopName,
      'shopType': shopType,
      'category': category,
      'distance': distance,
      'rebate': rebate,
      'amount': amount,
      'visit': visit ? 1 : 0,
    };
  }
}
