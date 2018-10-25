import 'dart:convert';

class CouponModel {
  // 根據 userId 對 api request
  // 一個使用者會有四種coupon： 自己取得的，朋友給的，使用過的，送人了的。
  // aquiredId != userId ? 朋友給的 : 自己取得的;
  // recipientId != null ? （送人了）isAvailable = false : true;
  // 使用coupon時
  // if(aquiredId != userId){
  //   aquiredId will get the refund & response from userId(recipientId)
  //   userId會取得新coupon with new id &
  //   giver.add(aquiredId) || giver.add(connection) (giver ?? [])
  // }else{
  //   userId會取得新coupon with new id
  // }
  //

  // 從店家取得的coupon才有，可由店家id、時間、發出的第幾張coupon組成
  final int userId;
  final int couponId;
  // 取得coupon的id
  final int aquiredId;
  // 送人的coupon： 受贈者的id + 贈予者推薦的原因 + await 受贈者的反饋
  // final Map<String, dynamic> connection;
  final int recipientId;
  final String reason;
  final String response;
  // 自己取得的coupon(若取得同時銷用另一張coupon，新的coupon要複製銷用coupon的來源, 加到list裡)
  // final List<Map<String, dynamic>> giver;
  final List<int> giver;
  // 經手未使用的使用者id (轉贈)
  final List<int> transferee;
  // final Map shopDetail;
  final String image;
  final String shopName;
  final String shopType;
  final String category;
  final double amount;
  final bool isAvailable;

  CouponModel.fromJson(Map<String, dynamic> parsedJson)
      : userId = parsedJson['userId'],
      couponId = parsedJson['couponId'],
        aquiredId = parsedJson['aquiredId'],
        // connection = parsedJson['connection'] ?? {},
        recipientId = parsedJson['recipientId'] ?? '',
        reason = parsedJson['reason'] ?? '',
        response = parsedJson['response'] ?? '',
        giver = parsedJson['giver'] ?? [],
        transferee = parsedJson['transferee'] ?? [],
        image = parsedJson['image'],
        shopName = parsedJson['shopName'],
        shopType = parsedJson['shopType'],
        category = parsedJson['category'],
        amount = parsedJson['amount'],
        isAvailable = parsedJson['isAvailable'] ?? true;

  CouponModel.fromDb(Map<String, dynamic> parsedJson)
      : userId = parsedJson['userId'],
      couponId = parsedJson['couponId'],
        aquiredId = parsedJson['aquiredId'],
        // connection = parsedJson['connection'],
        recipientId = parsedJson['recipientId'],
        reason = parsedJson['reason'],
        response = parsedJson['response'],
        giver = jsonDecode(parsedJson['giver']),
        transferee = jsonDecode(parsedJson['transferee']),
        image = parsedJson['image'],
        shopName = parsedJson['shopName'],
        shopType = parsedJson['shopType'],
        category = parsedJson['category'],
        amount = parsedJson['amount'],
        isAvailable = parsedJson['isAvailable'] == 1;

  Map<String, dynamic> trunCouponModeltoMapforDb() {
    return <String, dynamic>{
      'userId' : userId,
      'couponId': couponId,
      'aquiredId': aquiredId,
      // 'connection': connection,
      'recipientId': recipientId,
      'reason': reason,
      'response': response,
      'giver': jsonEncode(giver),
      'transferee': jsonEncode(transferee),
      // 'shopDetail': shopDetail,
      'image': image,
      'shopName': shopName,
      'shopType': shopType,
      'category': category,
      'amount': amount,
      'isAvailable': isAvailable ? 1 : 0,
    };
  }
}
