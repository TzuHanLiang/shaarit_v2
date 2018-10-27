import 'package:flutter/material.dart';
import 'coupons_bloc.dart';
export 'coupons_bloc.dart';

class CouponsProvider extends InheritedWidget {
  final CouponsBloc bloc;

  CouponsProvider({Key key, Widget child})
      : bloc = CouponsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static CouponsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CouponsProvider)
            as CouponsProvider)
        .bloc;
  }
}
