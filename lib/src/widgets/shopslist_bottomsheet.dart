import 'buttons/bottomsheet_button.dart';
import 'package:flutter/material.dart';
import '../presentation/shaarit_icons.dart';

class ShopsListBottomSheet extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 255, 255, 0.0),
      child: Container(
        height: 280.0,
        width: 414.0,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(8.0),
                topRight: const Radius.circular(8.0))),
        child: Stack(children: [
          Positioned(
            child: Container(
              width: 414.0,
              height: 43.5,
              decoration: BoxDecoration(
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
            left: 177.0,
            child: Row(children: [
              Text(
                "Sort",
                style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "DIN",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
              ),
              Icon(Shaarit.icfilter)
            ]),
          ),
          Positioned(
            top: 84.0,
            right: 289.0,
            child: BottomButton('Coupon | ', () {}),
          ),
          Positioned(
            top: 84.0,
            left: 165.0,
            child: BottomButton('多到少', () {}),
          ),
          Positioned(
            top: 84.0,
            left: 293.0,
            child: BottomButton('少到多', () {}),
          ),
          Positioned(
            top: 132.0,
            right: 289.0,
            child: BottomButton('回饋金 | ', () {}),
          ),
          Positioned(
            top: 132.0,
            left: 165.0,
            child: BottomButton('多到少', () {}),
          ),
          Positioned(
            top: 132.0,
            left: 293.0,
            child: BottomButton('少到多', () {}),
          ),
          Positioned(
            top: 180.0,
            right: 289.0,
            child: BottomButton('距離 | ', () {}),
          ),
          Positioned(
            top: 180.0,
            left: 165.0,
            child: BottomButton('遠到近', () {}),
          ),
          Positioned(
            top: 180.0,
            left: 293.0,
            child: BottomButton('近到遠', () {}),
          ),
          Positioned(
            top: 228.0,
            right: 289.0,
            child: BottomButton('我去過的 | ', () {}),
          ),
          Positioned(
            top: 228.0,
            left: 165.0,
            child: BottomButton('多到少', () {}),
          ),
          Positioned(
            top: 228.0,
            left: 293.0,
            child: BottomButton('少到多', () {}),
          ),
        ]),
      ),
    );
  }
}
