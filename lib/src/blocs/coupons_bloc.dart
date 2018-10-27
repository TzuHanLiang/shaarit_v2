import 'package:rxdart/rxdart.dart';
import '../models/coupon_model.dart';
import '../resources/repository.dart';
import 'dart:async';


class CouponsBloc {
final _repository = Repository();
  final _couponsList = PublishSubject<List<CouponModel>>();

  // streams
  Observable<List<CouponModel>> get couponList => _couponsList.stream;

  // sink
  Function(int) get fetchCouponsList => _fetchCouponsList;
  
  _fetchCouponsList(int) async {
    final coupons = await _repository.fetchCouponsList();
    _couponsList.sink.add(coupons);
  }

   clearCache() {
    return _repository.clearCache();
  }


   dispose() {
    _couponsList.close();
  }
}