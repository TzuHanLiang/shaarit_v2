import 'package:flutter/material.dart';
import '../buttons/selected_button.dart';

class CategoryButtons extends StatelessWidget {
  final List<String> selectOptions;
  CategoryButtons({this.selectOptions});
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      height: 35.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(selectOptions.length, (int index) {
          return Row(
            children: <Widget>[
              SelectedButton(
                text: selectOptions[index],
                onPressed: () {},
              ),
              Container(
                margin: EdgeInsets.only(left: 8.0),
              ),
            ],
          );
        }),
      ),
    );
  }
}
