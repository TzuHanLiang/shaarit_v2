import 'package:flutter/material.dart';
import '../blocs/shops_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;
  Refresh({this.child});
//RefreshIndicator -> StoriesBloc -> Repository -> DB Provider
  Widget build(context) {
    final bloc = ShopsProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async{
        await bloc.clearCache();
        await bloc.fetchShopsList();
      },
    );
  }
}
