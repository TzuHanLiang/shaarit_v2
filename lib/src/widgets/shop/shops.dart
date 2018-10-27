import 'package:flutter/material.dart';
import '../shop/shop_card.dart';
// import '../text_style/gesture_hint.dart';
// import '../refresh.dart';
// import '../../blocs/shops_provider.dart';
// import '../../models/coupon_model.dart';

class Shops extends StatelessWidget {
  Widget build(BuildContext context) {
    // final bloc = ShopsProvider.of(context);

    return
        // StreamBuilder(
        //   stream: bloc.couponList,
        //   builder: (BuildContext context, AsyncSnapshot<List<CouponModel>> snapshot) {
        //     return
        Container(
      // child: Refresh need to distinct from coupons refresh? (   // clearCache = null, need to be fixed
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // itemCount: snapshot.data.length,
        itemCount: _shops.length,
        itemBuilder: (BuildContext context, int index) {
          // return CouponCard(_coupons[index], index);
          return ShopCard(_shops[index], index);
          // return CouponCard(snapshot.data[index], index);
        },
      ),
      //     ),
      //   },
      // );
    );
  }
}

//temperory
class Shop {
  final String image;
  final int shopId;
  final String shopName;
  final String shopType;
  final String category;
  final String address;
  final double distance;
  final double rebate;
  final double amount;
  final int visit;

  Shop(this.image, this.shopId, this.shopName, this.shopType, this.category, this.address,
      this.distance, this.rebate, this.amount, this.visit);
}

List<Shop> _shops = [
  Shop('assets/images/food.jpg', 0,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 1,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 2,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 3,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 4,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 5,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 6,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 7,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 8,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 9,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 10,'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 11,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 12,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 13,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 14,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 15,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 16,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 17,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 18,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 19,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 20,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 21,'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 22,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 23,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 24,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 25,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 26,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 27,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 28,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 29,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 30,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 31,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 32,'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 33,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 34,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 35,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 36,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 37,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 38,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 39,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 0),
  Shop('assets/images/food.jpg', 40,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 41,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 42,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
  Shop('assets/images/food.jpg', 43,'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, 1),
];
