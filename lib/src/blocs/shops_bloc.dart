import 'dart:async';
import 'package:rxdart/rxdart.dart';
//Subjects == StreamController & Observable == Stream
import '../models/shop_model.dart';
import '../resources/repository.dart';

class ShopsBloc {
  final _repository = Repository();
  // topIds StreamController
  final _shopsList = PublishSubject<List<ShopModel>>();
  final _shopsListWithType = PublishSubject<List<ShopModel>>();
  

  Observable<List<ShopModel>> get shopsList => _shopsList.stream;
  

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

  clearCache() {
    return _repository.clearCache();
  }

  dispose() {
    _shopsList.close();
    _shopsListWithType.close();
  }
}
