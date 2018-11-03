import 'package:flutter/material.dart';
import 'shop_filter_button.dart';
import '../../style/colors.dart';

class SwitchSelectedButton extends StatefulWidget {
  @required
  final List<String> options;
  @required
  final String selectedOption;
  @required
  final Function onSelect;

  const SwitchSelectedButton({
    Key key,
    this.options,
    this.selectedOption,
    this.onSelect,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SwitchSelectedState();
}

class _SwitchSelectedState extends State<SwitchSelectedButton> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      height: 35.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(widget.options.length, (int index) {
          return Row(
            children: <Widget>[
              ShopFilterButton(
                text: widget.options[index],
                borderColor: widget.selectedOption == widget.options[index]
                    ? Colors.transparent
                    : grey,
                borderStyle: widget.selectedOption == widget.options[index]
                    ? BorderStyle.none
                    : BorderStyle.solid,
                buttonColor: widget.selectedOption == widget.options[index]
                    ? cherryRed
                    : Colors.transparent,
                textColor: widget.selectedOption == widget.options[index]
                    ? white
                    : grey,
                onPressed: () {
                  widget.onSelect(widget.options[index]);
                },
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
