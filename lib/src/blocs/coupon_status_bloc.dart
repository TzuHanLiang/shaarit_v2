import 'dart:async';

import 'bloc_provider.dart';
import '../models/shop_model.dart';
import '../models/coupon_model.dart';

import 'package:rxdart/rxdart.dart';

class CouponStatusBloc implements BlocBase {
  CouponStatusBloc() {
    _visitShopController.listen(_handleVisitShop());
  }
  CouponStatusBloc.isVisit(ShopModel shopModel) {
    _visitedShopsController.stream
        // we only consider the one that matches THIS one
        .map((list) =>
            list.any((ShopModel item) => item.shopId == shopModel.shopId))
        // if any, we notify that it is part of the visited shops
        .listen((isFavorite) => _isVisitedController.add(isFavorite));
  }

  /// total Coupons
  BehaviorSubject<List<CouponModel>> _totalCouponsController =
      BehaviorSubject<List<CouponModel>>();
  Sink<List<CouponModel>> get _inCouponList => _totalCouponsController.sink;
  Stream<List<CouponModel>> get outCouponList =>
      _totalCouponsController.stream;

  /// 以下統稱為coupon的狀態 => Coupon State
  ///-------------- get a new coupon from user or shop ------------------------------
  ///-------------- recommend coupon ------------------------------
  BehaviorSubject<List<CouponModel>> _recommendCouponsController =
      BehaviorSubject<List<CouponModel>>();
  Stream<List<CouponModel>> get outRecommendCoupons =>
      _recommendCouponsController.stream;

  ///-------------- used coupon ---------------------------
  ///-------------- passed coupon ---------------------------
  ///-------------- total available coupons ------------------------------
  BehaviorSubject<List<CouponModel>> _availableCouponsController =
      BehaviorSubject<List<CouponModel>>();
  Stream<List<CouponModel>> get outAvailableCoupons =>
      _availableCouponsController.stream;

  ///-------------- Visit state ------------------------------

  // Unique list of visited shops
  final Set<ShopModel> _visitedShops = Set<ShopModel>();

  // ##########  STREAMS  ##############
  //  Interface that allows to add a new visit shop
  BehaviorSubject<ShopModel> _visitShopController =
      BehaviorSubject<ShopModel>();
  Sink<ShopModel> get inAddVisitedShops => _visitShopController.sink;

  // Interface that allows to get the total number of each visited shop
  // 要怎麼把次數加進來？ 研究一下you hit me的例子
  BehaviorSubject<Map<ShopModel, int>> _visitTimesController =
      new BehaviorSubject<Map<ShopModel, int>>(seedValue: {});
  Sink<Map<ShopModel, int>> get _inTotalVisit => _visitTimesController.sink;
  Stream<Map<ShopModel, int>> get outTotalVisit => _visitTimesController.stream;

  // Interface that allows to get the list of all visited shops
  BehaviorSubject<List<ShopModel>> _visitedShopsController =
      new BehaviorSubject<List<ShopModel>>(seedValue: []);
  Sink<List<ShopModel>> get inVisitedShops => _visitedShopsController.sink;
  Stream<List<ShopModel>> get outVisitedShops => _visitedShopsController.stream;

  // A stream only meant to return whether THIS shop is visited
  final BehaviorSubject<bool> _isVisitedController = BehaviorSubject<bool>();
  Stream<bool> get outIsVisited => _isVisitedController.stream;

  void dispose() {
    _availableCouponsController.close();
    _recommendCouponsController.close();
    _totalCouponsController.close();
    _visitShopController.close();
    _visitedShopsController.close();
    _visitTimesController.close();
    _visitedShopsController.close();
  }

  // ########## HANDLING ###########

  _handleVisitShop() {}
}
