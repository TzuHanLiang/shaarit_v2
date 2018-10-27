import 'package:flutter/material.dart';
import 'style/colors.dart';
import '../src/blocs/shops_provider.dart';
import '../src/blocs//coupons_provider.dart';
import '../src/screens/home.dart';
import '../src/screens/shops_detail.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return CouponsProvider(
      child: ShopsProvider(
        child: MaterialApp(
          theme: buildThemeData(),
          title: 'Shaarit Version 2',
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          // extract the shop id from setting.name
          // and pass into ShopDetail
          // A fantastic location to do some initialization
          // or data fetching for Shopsdetail
          final couponsBloc = CouponsProvider.of(context);
          final shopId = int.parse(settings.name.replaceFirst('/shop/', ''));

          couponsBloc.fetchCouponsList(shopId);
          return ShopsDetail(
            shopId: shopId,
          );
        },
      );
    }
  }
}

ThemeData buildThemeData() {
  final baseTheme = ThemeData.light();
  return baseTheme.copyWith(
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
          side: BorderSide(
              color: darkerGrey, style: BorderStyle.none, width: 1.0)),
      height: 44.0,
      minWidth: 160.0,
    ),
    buttonColor: cherryRed,
  );
}
