import 'package:flutter/material.dart';
import 'shops_bloc.dart';
export 'shops_bloc.dart';

class ShopsProvider extends InheritedWidget {
  final ShopsBloc bloc;

  ShopsProvider({Key key, Widget child})
      : bloc = ShopsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ShopsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ShopsProvider)
            as ShopsProvider)
        .bloc;
  }
}
