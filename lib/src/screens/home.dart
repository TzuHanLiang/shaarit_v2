import 'package:flutter/material.dart';

import '../presentation/shaarit_icons.dart';
import './shops_screen.dart';
import './coupons_screen.dart';
import './get_coupon_screen.dart';
import './profile_screen.dart';
// import '../blocs/bloc_provider.dart';
// import '../blocs/shop_bloc.dart';
// import '../models/shop_model.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> _pages = [
    // BlocProvider<ShopBloc>(bloc: ShopBloc(), child: ShopsScreen()),
    ShopsScreen(),
    CouponsScreen(),
    GetCouponScreen(),
    ProfileScreen(),
  ];
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Shaarit.shops),
            title: Text('Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Shaarit.mycoupon),
            title: Text('MyCoupon'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Shaarit.getcoupon),
            title: Text('GetCoupon'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Shaarit.profile),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
