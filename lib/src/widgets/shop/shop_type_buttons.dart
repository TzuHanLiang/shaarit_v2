import 'package:flutter/material.dart';
// import '../../widgets/buttons/selected_button_unused.dart';
// import '../../style/colors.dart';
import '../../widgets/buttons/selected_button.dart';

class ShopTypeButtons extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShopTypeButtonsState();
  }
}

class ShopTypeButtonsState extends State<ShopTypeButtons> {
  List<String> selectOptions = ['餐廳', '美容', '推拿', '桑拿'];
  String selectedOption = '餐廳';

  Widget build(BuildContext build) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Row(
        children: <Widget>[
          SelectedButton(text: '餐廳', onPressed: () {}),
          Container(margin: EdgeInsets.only(left:8.0),),
          SelectedButton(text: '美容', onPressed: () {}),
          Container(margin: EdgeInsets.only(left:8.0),),
          SelectedButton(text: '推拿', onPressed: () {}),
          Container(margin: EdgeInsets.only(left:8.0),),
          SelectedButton(text: '桑拿', onPressed: () {}),
        ],
      ),
    );
  }
}
