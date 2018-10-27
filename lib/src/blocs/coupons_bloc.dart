import 'package:rxdart/rxdart.dart';
import '../models/coupon_model.dart';
import '../resources/repository.dart';
// import 'dart:async';

class CouponsBloc {
  final _repository = Repository();
  final _couponsList = PublishSubject<List<CouponModel>>();
  final _couponListWithShopId = PublishSubject<List<CouponModel>>();
  final _couponListHasRecommanded = PublishSubject<List<CouponModel>>();
  final _couponDetail = PublishSubject<CouponModel>();

  // streams
  Observable<List<CouponModel>> get couponList => _couponsList.stream;
  Observable<List<CouponModel>> get couponListWithShopId =>
      _couponListWithShopId.stream;
  Observable<List<CouponModel>> get couponListHasRecommanded =>
      _couponListHasRecommanded.stream;
  Observable<CouponModel> get couponDetail => _couponDetail.stream;

  // CouponsBloc() {
  //   _couponsList.stream
  //       .transform(_sortingWithShopId())
  //       .pipe(_couponListWithShopId);
  //   _couponsList.stream
  //       .transform(_sortingHasRecommanded())
  //       .pipe(_couponListHasRecommanded);
  // }
  // _sortingWithShopId() {}
  // _sortingHasRecommanded() {}

  // sink
  Function() get fetchCouponsList => _fetchCouponsList;

  _fetchCouponsList() async {
    final coupons = await _repository.fetchCouponsList();
    _couponsList.sink.add(coupons);
  }

  Function(int) get fetchCouponDetail => _fetchCouponDetail;

  _fetchCouponDetail(int couponId) async {
    final coupon = await _repository.fetchCouponDetail(couponId);
    _couponDetail.sink.add(coupon);
  }
  Function(int) get fetchCouponListWithShopId => _fetchCouponListWithShopId;

  _fetchCouponListWithShopId(int shopId) async {
    final coupons = await _repository.fetchCouponsListWithShopId(shopId);
    _couponsList.sink.add(coupons);
  }

  Function(bool) get fetchCouponsListHasRecommanded => _fetchCouponsListHasRecommanded;

  _fetchCouponsListHasRecommanded(bool hasRecommanded) async {
    final coupons = await _repository.fetchCouponsListHasRecommanded(hasRecommanded);
    _couponsList.sink.add(coupons);
  }

  clearCache() {
    return _repository.clearCache();
  }

  dispose() {
    _couponsList.close();
    _couponListWithShopId.close();
    _couponListHasRecommanded.close();
    _couponDetail.close();
  }
}
