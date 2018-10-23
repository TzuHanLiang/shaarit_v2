import 'package:flutter/material.dart';

class WidgetPlayground extends StatefulWidget {
  @override
  _WidgetPlaygroundState createState() => new _WidgetPlaygroundState();
}

class _WidgetPlaygroundState extends State<WidgetPlayground> {
  int stepCounter = 0;
  List<Step> steps = [
    Step(
      title: Text('1-6'),
      subtitle: Text('sub'),
      content: Text('1st step'),
      isActive: true,
    ),
    Step(
      title: Text('2-6'),
      content: Text('2nd step'),
      isActive: true,
    ),
    Step(
      title: Text('3-6'),
      content: Text('3rd step'),
      isActive: true,
    ),
    Step(
      title: Text('4-6'),
      content: Text('4th step'),
      isActive: true,
    ),
    Step(
      title: Text('5-6'),
      content: Text('5th step'),
      isActive: true,
    ),
    Step(
      title: Text('6-6'),
      content: Text('6th step'),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('App')),
        body: Container(
            child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              ButtonTheme.bar(
                // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
