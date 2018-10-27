// import 'dart:async';
import 'package:rxdart/rxdart.dart';
//Subjects == StreamController & Observable == Stream
import '../models/shop_model.dart';
import '../resources/repository.dart';

class ShopsBloc {
  final _repository = Repository();
  // topIds StreamController
  final _shopsList = PublishSubject<List<ShopModel>>();
  final _shopDetail = PublishSubject<ShopModel>();
  final _shopsListWithType = PublishSubject<List<ShopModel>>();
  final _shopsListWithCategory = PublishSubject<List<ShopModel>>();

  Observable<List<ShopModel>> get shopsList => _shopsList.stream;
  Observable<ShopModel> get shopDetail => _shopDetail.stream;
  Observable<List<ShopModel>> get shopsListWithType =>
      _shopsListWithType.stream;
  Observable<List<ShopModel>> get shopsListWithCategory =>
      _shopsListWithCategory.stream;

  // incoming requests to change data done by respoitory
  Function() get fetchShopsList => _fetchShopsList;

  _fetchShopsList() async {
    final shops = await _repository.fetchShopsList();
    _shopsList.sink.add(shops);
  }

  Function(int) get fetchShopDetail => _fetchShopDetail;

  _fetchShopDetail(int shopId) async {
    final shop = await _repository.fetchShopDetail(shopId);
    _shopDetail.sink.add(shop);
  }

  Function(String) get fetchShopsListWithType => _fetchShopsListWithType;

  _fetchShopsListWithType(String type) async {
    final shops = await _repository.fetchShopsListWithType(type);
    _shopsListWithType.sink.add(shops);
  }

  Function(String) get fetchShopsListWithCategory =>
      _fetchShopsListWithCategory;

  _fetchShopsListWithCategory(String category) async {
    final shops = await _repository.fetchShopsListWithCategory(category);
    _shopsListWithCategory.sink.add(shops);
  }

  clearCache() {
    return _repository.clearCache();
  }

  dispose() {
    _shopsList.close();
    _shopsListWithType.close();
    _shopsListWithCategory.close();
    _shopDetail.close();
  }
}
