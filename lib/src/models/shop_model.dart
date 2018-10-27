class ShopModel {
  final int shopId;
  final String image;
  final String shopName;
  final String shopType;
  final String category;
  final String address;
  final double distance;
  final double rebate;
  final double amount;
  //去過的次數
  final int visit;

  ShopModel.fromJson(Map<String, dynamic> parsedJson)
      : shopId = parsedJson['shopId'],
        image = parsedJson['image'],
        shopName = parsedJson['shopName'],
        shopType = parsedJson['shopType'],
        category = parsedJson['category'],
        distance = parsedJson['distance'],
        address = parsedJson['address'],
        rebate = parsedJson['rebate'],
        amount = parsedJson['amount'],
        visit = parsedJson['visit'] ?? 0;


  ShopModel.fromDb(Map<String, dynamic> parsedJson)
      : shopId = parsedJson['shopId'],
        image = parsedJson['image'],
        shopName = parsedJson['shopName'],
        shopType = parsedJson['shopType'],
        category = parsedJson['category'],
        address = parsedJson['address'],
        distance = parsedJson['distance'],
        rebate = parsedJson['rebate'],
        amount = parsedJson['amount'],
        visit = parsedJson['visit'];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shopId': shopId,
      'image': image,
      'shopName': shopName,
      'shopType': shopType,
      'category': category,
      'distance': distance,
      'address' : address,
      'rebate': rebate,
      'amount': amount,
      'visit': visit ,
    };
  }
}
