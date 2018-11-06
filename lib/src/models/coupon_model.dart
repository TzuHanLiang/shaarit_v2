import 'dart:convert';

class CouponModel {
  /// 一個使用者會有四種coupon： 自己取得的，朋友給的，使用過的，送人了的。
  /// 以 enum 的資料型態來儲存

  /// 從店家取得的coupon才有，可由店家id、時間、發出的第幾張coupon 以及產生原因組成
  final String aquiredId;

  /// couponId 的設計： 新生成的couponId要與上一張銷用掉的coupon相關以便追蹤他的歷史
  final String couponId;

  /// 用來獲取 shop information
  /// 店家model裡面的 shopId 的資料型態 還沒有改
  final String shopId;

  /// then below properties would be unnecessary
  // final String image;
  // final String shopName;
  // final String shopType;
  // final String category;
  // final double amount;
  final Map<String, String> record;

  /// user之間傳送coupon會有兩種情境
  /// 會有兩種情況 pass or recommend
  ///
  /// 所以當一個 user 在發送 coupon 卷時 我們要先判斷這張coupon的來源
  /// 來源是店家才能夠顯示輸入推薦的原因的對話框, 
  /// ex:
  /// 
  /// {
  /// 'source': 'user',
  /// 'sourceId': 'userId'
  /// 'recipient': 'userId2'
  /// 'message': null, // unenble to send message
  /// 'response': null,
  /// 'state': 'pass',
  /// }
  ///
  /// OR
  ///
  /// {
  /// 'source': 'shop',
  /// 'sourceId': 'shopId'
  /// 'recipient': 'userId2'
  /// 'message': '我被他們家的炸雞給驚艷了',
  /// 'response': null,
  /// 'state': 'recommend',
  /// }


  /// coupon history 查詢：利用record[source] & couponId去查詢這個
  final List<int> giver;

  /// 經手未使用的使用者id (轉贈)
  final List<int> transferee;

  /// 要改成enum 先暫時enum
  final bool isAvailable;

  CouponModel.fromJson(Map<String, dynamic> parsedJson)
      : aquiredId = parsedJson['aquiredId'],
        couponId = parsedJson['couponId'],
        shopId = parsedJson['shopId'],
        record =parsedJson['record'] ?? {},
        giver = parsedJson['giver'] ?? [],
        transferee = parsedJson['transferee'] ?? [],
        isAvailable = parsedJson['isAvailable'] ?? true;

  CouponModel.fromDb(Map<String, dynamic> parsedJson)
      : aquiredId = parsedJson['aquiredId'],
        couponId = parsedJson['couponId'],
        shopId = parsedJson['shopId'],
        record =parsedJson['record'],
        giver = jsonDecode(parsedJson['giver']),
        transferee = jsonDecode(parsedJson['transferee']),
        isAvailable = parsedJson['isAvailable'] == 1;

  Map<String, dynamic> trunCouponModeltoMapforDb() {
    return <String, dynamic>{
      'couponId': couponId,
      'aquiredId': aquiredId,
      'shopId': shopId,
      'giver': jsonEncode(giver),
      'transferee': jsonEncode(transferee),      
      'isAvailable': isAvailable ? 1 : 0,
    };
  }
}
