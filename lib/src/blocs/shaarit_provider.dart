import 'package:flutter/material.dart';
import 'shaarit_bloc.dart';
export 'shaarit_bloc.dart';

class ShaaritProvider extends InheritedWidget {
  final ShaaritBloc bloc;

  ShaaritProvider({Key key, Widget child})
      : bloc = ShaaritBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ShaaritBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ShaaritProvider)
            as ShaaritProvider)
        .bloc;
  }
}
