import 'package:flutter/material.dart';
import 'package:app/widgets/MyAppBarState.dart';


class MyAppBar extends StatefulWidget with PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Function(String) callback;
  String logo_url;

  MyAppBar(this.callback, this.logo_url);

  @override
  State<StatefulWidget> createState() => new MyAppBarState();
}
