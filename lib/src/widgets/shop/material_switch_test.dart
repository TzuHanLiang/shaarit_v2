import 'package:flutter/material.dart';
import 'material_switch.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => new _ExampleState();
}

class _ExampleState extends State<Example> {
  List<String> switchOptions = <String>['Male', 'Female'];
  String selectedSwitchOption = 'Male';
  String appTitle = 'Material Switch Demo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Column(children: <Widget>[
        MaterialSwitch(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(5.0),
          selectedOption: selectedSwitchOption,
          options: switchOptions,
          selectedBackgroundColor: Colors.indigo,
          selectedTextColor: Colors.white,
          onSelect: (String selectedOption) {
            setState(() {
              selectedSwitchOption = selectedOption;
            });
          },
        ),
      ]),
    );
  }
}