import 'package:flutter/material.dart';
// import '../../widgets/buttons/selected_button_unused.dart';
import '../../style/colors.dart';

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
      // color: Colors.purple[200],
      margin: EdgeInsets.only(left: 16.0),
      height: 35.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(selectOptions.length, (int index) {
          return InkWell(
            onTap: () {},
            child: new Container(
              margin: EdgeInsets.only(right: 8.0),
              width: 60.0,
              height: 35.0,
              decoration: new BoxDecoration(
                border: new Border.all(color: grey),
                borderRadius: new BorderRadius.circular(18.5),
              ),
              child: new Center(
                child: Text(
                  selectOptions[index],
                  style: const TextStyle(
                      color: grey,
                      fontWeight: FontWeight.w400,
                      fontFamily: "PingFangTC",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
