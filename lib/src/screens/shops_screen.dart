import 'package:flutter/material.dart';

import '../widgets/gradient_appbar.dart';
import '../widgets/shop/shopslist_bottomsheet.dart';
import '../widgets/buttons/floating_button.dart';
import '../widgets/buttons/switch_selected_button.dart';
import '../widgets/shop/shops.dart';

enum ShopType { RESTAURANT, HOTEL, BEAUTY, MASSAGE }

class ShopsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  static const String TAG = 'SHOPTYPE';
  ShopType status = ShopType.RESTAURANT;
  List<String> typeOptions = ['餐廳', '飯店', '美容', '按摩'];
  String selectedTypeOption = '餐廳';
  List<String> restaurantOptions = [
    '泰式',
    '中菜',
    '日式',
    '美式',
    '韓式',
    '粵菜',
    '法式',
    '台菜'
  ];
  String selectedRestaurantOption;
  List<String> hotelOptions = ['Hotel', 'Motel', '渡假村'];
  String selectedHotelOption;
  List<String> beautyOptions = ['醫美', '整牙', '美容'];
  String selectedBeautyOption;
  List<String> massageOptions = ['泰式按摩', '腳底按摩', '背部按摩', '全身按摩', '水療'];
  String selectedMassageOption;

  void _showModalBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return ShopsListBottomSheet();
      },
    );
  }

  Widget _buildCategoryButtons() {
    Widget categoryButton;
    switch (this.status) {
      case ShopType.RESTAURANT:
        categoryButton = SwitchSelectedButton(
            options: restaurantOptions,
            selectedOption: selectedRestaurantOption,
            onSelect: (String selectedOption) {
              setState(() {
                selectedRestaurantOption = selectedOption;
              });
            });
        break;
      case ShopType.HOTEL:
        categoryButton = SwitchSelectedButton(
            options: hotelOptions,
            selectedOption: selectedHotelOption,
            onSelect: (String selectedOption) {
              setState(() {
                selectedHotelOption = selectedOption;
              });
            });
        break;
      case ShopType.BEAUTY:
        categoryButton = SwitchSelectedButton(
            options: beautyOptions,
            selectedOption: selectedBeautyOption,
            onSelect: (String selectedOption) {
              setState(() {
                selectedBeautyOption = selectedOption;
              });
            });
        break;
      case ShopType.MASSAGE:
        categoryButton = SwitchSelectedButton(
            options: massageOptions,
            selectedOption: selectedMassageOption,
            onSelect: (String selectedOption) {
              setState(() {
                selectedMassageOption = selectedOption;
              });
            });
        break;
    }
    return categoryButton;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          GradientAppBar('Shops'),
          SizedBox(height: 16.0),
          SwitchSelectedButton(
            options: typeOptions,
            selectedOption: selectedTypeOption,
            onSelect: (String selectedOption) {
              setState(() {
                selectedTypeOption = selectedOption;
                switch (selectedTypeOption) {
                  case '餐廳':
                    status = ShopType.RESTAURANT;
                    break;
                  case '飯店':
                    status = ShopType.HOTEL;
                    break;
                  case '美容':
                    status = ShopType.BEAUTY;
                    break;
                  case '按摩':
                    status = ShopType.MASSAGE;
                    break;
                }
              });
            },
          ),
          SizedBox(height: 8.0),
          _buildCategoryButtons(),
          Flexible(
            child: Shops(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButton(() => _showModalBottomSheet()),
    );
  }
}
