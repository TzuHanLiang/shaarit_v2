import 'package:flutter/material.dart';
import 'style/colors.dart';
import 'blocs/bloc_provider.dart';
import 'blocs/user_bloc.dart';
import 'blocs/coupon_status_bloc.dart';
// import 'blocs/shop_bloc.dart';
import '../src/screens/home.dart';
// import '../src/screens/shop_detail_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return BlocProvider<UserBloc>(
      bloc: UserBloc(),
      child: MaterialApp(
        theme: buildThemeData(),
        title: 'Shaarit Version 2',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        return BlocProvider<CouponStatusBloc>(
            bloc: CouponStatusBloc(), child: HomeScreen());
      });
    } else {
      return MaterialPageRoute(
        builder: (context) {
          // extract the shop id from setting.name and pass into ShopDetail
          // A fantastic location to do some initialization or data fetching for Shopsdetail

          // final shopId = int.parse(settings.name.replaceFirst('/shop/', ''));
          // final couponBloc = BlocProvider<CouponBloc>.of(context);
          // final shopBloc = ShopsProvider.of(context);
          // shopBloc.fetchShopDetail(shopId);
          // couponBloc.fetchCouponListWithShopId(shopId);
          // return ShopsDetailScreen(shopId: shopId);
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
