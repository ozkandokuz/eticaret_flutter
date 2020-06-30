import 'package:flutter/cupertino.dart';

class MyConfig extends InheritedWidget {
  Widget child;
  int accountId;
  int scopeId;

  MyConfig({Key key, this.child, this.accountId, this.scopeId}): super(key: key, child: child);


  static MyConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyConfig>();
  }
  @override
  bool updateShouldNotify(MyConfig old) => accountId != old.accountId || scopeId != old.scopeId;
}