import 'package:flutter/material.dart';

import '../../models/coupon_model.dart';

import 'coupon_card_widget.dart';
import '../../screens/sending_coupon_screen.dart';
import '../../screens/coupon_details_screen.dart';

class CouponsList extends StatelessWidget {
  final Stream<List<CouponModel>> couponStream;

  CouponsList({
    Key key,
    @required this.couponStream,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: couponStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<CouponModel>> snapshot) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildCouponCard(
              context,
              index,
              snapshot.data,
            );
          },
        );
      },
    );
  }

  Widget _buildCouponCard(
    BuildContext context,
    int index,
    List<CouponModel> coupons,
  ) {
    final CouponModel coupon =
        (coupons != null && coupons.length > index) ? coupons[index] : null;
    if (coupon == null) {
      return Container(); // 或是像YouTube一樣先顯示灰色的格子們
    }
    return InkWell(
      ///
      /// activate recommend process
      ///
      onDoubleTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return SendingCouponScreen(couponModel: coupon);
          }),
        );
      },
      child: CouponCardWidget(
        key: Key('coupon_${coupon.couponId}'),
        couponModel: coupon,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return CouponDetailsScreen(coupon: coupon);
            }),
          );
        },
      ),
    );
  }
}
