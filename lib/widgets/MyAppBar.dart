import 'package:flutter/material.dart';
import 'package:app/widgets/MyAppBarState.dart';


class MyAppBar extends StatefulWidget with PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Function(String) callback;
  String logo_url;
  ValueNotifier<bool> back_button_notifier = ValueNotifier<bool>(false);

  MyAppBar(this.callback, this.logo_url,this.back_button_notifier);

  @override
  State<StatefulWidget> createState() => new MyAppBarState();
}
