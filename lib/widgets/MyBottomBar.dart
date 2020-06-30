import 'package:flutter/material.dart';
import 'package:app/widgets/MyBottomBarState.dart';


class MyBottomBar extends StatefulWidget with PreferredSizeWidget{

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


  Function(String) callback;
  ValueNotifier<int> cart_prd_count_notifier = ValueNotifier<int>(0);
  ValueNotifier<bool> back_button_notifier = ValueNotifier<bool>(false);

  MyBottomBar(this.callback,this.cart_prd_count_notifier,this.back_button_notifier);

  @override
  State<StatefulWidget> createState() => new MyBottomBarState();
}
