import 'package:rxdart/rxdart.dart';
//Subjects == StreamController & Observable == Stream

import '../models/coupon_model.dart';
import '../models/shop_model.dart';
import '../resources/repository.dart';

class ShaaritBloc {
  final _repository = Repository();
  // topIds StreamController
  final _shopsList = PublishSubject<List<ShopModel>>();
  final _shopsListWithType = PublishSubject<List<ShopModel>>();
  final _couponsList = PublishSubject<List<CouponModel>>();

  Observable<List<ShopModel>> get shopsList => _shopsList.stream;
  Observable<List<CouponModel>> get couponList => _couponsList.stream;

  Function(String) get fetchShopsListWithType => _fetchShopsListWithType;

  _fetchShopsListWithType(String type) async {
    final shops = await _repository.fetchShopsListWithType(type);
    _shopsList.sink.add(shops);
  }

  // incoming requests to change data done by respoitory
  Function() get fetchShopsList => _fetchShopsList;

  _fetchShopsList() async {
    final shops = await _repository.fetchShopsList();
    _shopsList.sink.add(shops);
  }

  Function() get fetchCouponsList => _fetchCouponsList;

  _fetchCouponsList() async {
    final coupons = await _repository.fetchCouponsList();
    _couponsList.sink.add(coupons);
  }

  clearCache() {
    return _repository.clearCache();
  }

  dispose() {
    _shopsList.close();
    _shopsListWithType.close();
    _couponsList.close();
  }
}
