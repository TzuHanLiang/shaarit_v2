import 'buttons/bottomsheet_button.dart';
import 'package:flutter/material.dart';
import '../widgets/text_style/bottomsheet_label.dart';
// import '../presentation/shaarit_icons.dart';
import '../style/colors.dart';

class ShopsListBottomSheet extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      // width: 414.0,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 414.0,
              height: 43.5,
              decoration: BoxDecoration(
                color: cherryRed,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(8.0),
                  topRight: const Radius.circular(8.0),
                ),
                border: Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(226, 226, 226, 1.0),
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16.0,
            left: 160.0,
            child: Center(
              child: Row(children: [
                Icon(
                  Icons.sort,
                  color: white,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Sort",
                  style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "DIN",
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                ),
              ]),
            ),
          ),
          Positioned(
            top: 84.0,
            right: 289.0,
            child: BottomSheetButton(
              child: BottomSheetLabel('Coupon | '),
            ),
          ),
          Positioned(
            top: 84.0,
            left: 150.0,
            child: BottomSheetButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_downward),
                  BottomSheetLabel('多到少')
                ],
              ),
              onTap: () {},
            ),
          ),
          Positioned(
            top: 84.0,
            left: 280.0,
            child: BottomSheetButton(
              child: Row(
                children: [Icon(Icons.arrow_upward), BottomSheetLabel('少到多')],
              ),
              onTap: () {},
            ),
          ),
          Positioned(
            top: 132.0,
            right: 289.0,
            child: BottomSheetButton(
              child: BottomSheetLabel('回饋金 | '),
            ),
          ),
          Positioned(
            top: 132.0,
            left: 150.0,
            child: BottomSheetButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_downward),
                    BottomSheetLabel('多到少')
                  ],
                ),
                onTap: () {}),
          ),
          Positioned(
            top: 132.0,
            left: 280.0,
            child: BottomSheetButton(
              child: Row(
                children: [Icon(Icons.arrow_upward), BottomSheetLabel('少到多')],
              ),
              onTap: () {},
            ),
          ),
          Positioned(
            top: 180.0,
            right: 289.0,
            child: BottomSheetButton(
              child: BottomSheetLabel('距離 | '),
            ),
          ),
          Positioned(
            top: 180.0,
            left: 150.0,
            child: BottomSheetButton(
              child: Row(children: <Widget>[
                Icon(Icons.arrow_downward),
                BottomSheetLabel('遠到近'),
              ]),
              onTap: () {},
            ),
          ),
          Positioned(
            top: 180.0,
            left: 280.0,
            child: BottomSheetButton(
              child: Row(children: <Widget>[
                Icon(Icons.arrow_upward),
                BottomSheetLabel('近到遠'),
              ]),
              onTap: () {},
            ),
          ),
          Positioned(
            top: 228.0,
            right: 289.0,
            child: BottomSheetButton(
              child: BottomSheetLabel('我去過的 | '),
            ),
          ),
          Positioned(
            top: 228.0,
            left: 150.0,
            child: BottomSheetButton(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_downward),
                    BottomSheetLabel('多到少')
                  ],
                ),
                onTap: () {}),
          ),
          Positioned(
            top: 228.0,
            left: 280.0,
            child: BottomSheetButton(
              child: Row(
                children: [Icon(Icons.arrow_upward), BottomSheetLabel('少到多')],
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
