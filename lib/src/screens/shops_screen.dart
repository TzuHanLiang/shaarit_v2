import 'dart:async';

import 'package:flutter/material.dart';

// ui widget
import '../widgets/gradient_appbar.dart';
import '../widgets/shop/shopslist_bottomsheet.dart';
import '../widgets/buttons/floating_button.dart';
import '../widgets/buttons/switch_selected_button.dart';
import '../widgets/shop/shops_list.dart';

// Blocs
import '../blocs/bloc_provider.dart';
import '../blocs/shop_bloc.dart';

enum ShopType { RESTAURANT, HOTEL, BEAUTY, MASSAGE }

class ShopsScreen extends StatefulWidget {
  ShopsScreen({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  static const String TAG = 'SHOPTYPE';
  ShopType status = ShopType.RESTAURANT;
  List<String> typeOptions = ['餐廳', '飯店', '美容', '按摩'];
  String selectedTypeOption = '餐廳';
  List<String> restaurantOptions = ['泰式','中菜','日式','美式','韓式','粵菜','法式','台菜'];
  String selectedRestaurantOption;
  List<String> hotelOptions = ['Hotel', 'Motel', '渡假村'];
  String selectedHotelOption;
  List<String> beautyOptions = ['醫美', '整牙', '美容'];
  String selectedBeautyOption;
  List<String> massageOptions = ['泰式按摩', '腳底按摩', '背部按摩', '全身按摩', '水療'];
  String selectedMassageOption;

  // instance of Blocs
  // ShopBloc _shopBloc;
  // bool _isInit = false;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   // As the context of not yet available at initState() level,
  //   // if not yet initialized, we get the list of all genres
  //   // and retrieve the currently selected one, as well as the
  //   // filter parameters

  //   if (_isInit == false) {
  //     _shopBloc = BlocProvider.of<ShopBloc>(context);

  //     _getFilterParameters();
  //   }
  // }

  // _getFilterParameters() {
  //   StreamSubscription subscriptionFilters;

  //   subscriptionFilters =
  //       _shopBloc.outFilters.listen((MovieFilters filters) {
  //     _minReleaseDate = filters.minReleaseDate.toDouble();
  //     _maxReleaseDate = filters.maxReleaseDate.toDouble();
  //     _movieGenre = _genres.firstWhere((g) => g.genre == filters.genre);

  //     Simply to make sure the subscriptions are released
  //     subscriptionFilters.cancel();

  //     Now that we have all parameters, we may build the actual page
  //     if (mounted) {
  //       setState(() {
  //         _isInit = true;
  //       });
  //     }
  //   });
  // }

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
              //
              // When the user accepts the changes to the filters,
              // we need to send the new filters to the MovieCatalogBloc filters sink.
              //
              // _movieBloc.inFilters.add(MovieFilters(
              //   minReleaseDate: _minReleaseDate.round(),
              //   maxReleaseDate: _maxReleaseDate.round(),
              //   genre: _movieGenre.genre,
              // ));
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
    return 
    // _isInit == false
    //     ? Container()
    //     : 
        Scaffold(
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
                Expanded(
                  child: ShopsList(),
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingButton(() => _showModalBottomSheet()),
          );
  }
}
