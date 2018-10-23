import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/text_style/headline.dart';
import '../widgets/buttons/primary_setting_button.dart';
import '../widgets/inputs/phone_input.dart';

class RegisterScreen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen1State();
  }
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  String _phoneNum;
  String _imei;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
          ),
          GradientAppBar('Register'),
          Positioned(
            top: 40.0,
            left: 0.0,
            child: BackButton(
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 128.0,
            left: 125.0,
            child: Headline("請輸入電話號碼"),
          ),
          Positioned(
            top: 186.0,
            left: 32.0,
            child: DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Positioned(
            top: 186.0,
            right: 20.0,
            child: PhoneInput(),
          ),
          Positioned(
            top: 260.0,
            left: 48.0,
            child: PrimarySettingButton(
              '取得驗證碼',
              // () => Navigator.pushNamed(context, '/confirmation'),
            ),
          ),
        ],
      ),
    );
  }
}
