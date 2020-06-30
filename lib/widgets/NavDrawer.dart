import 'package:flutter/material.dart';
import 'package:app/widgets/NavDrawerState.dart';
import 'package:app/models/Menu.dart';

class NavDrawer extends StatefulWidget {
  //static final String routeName = '/labelForm';



  Function(String) callback;
  Function() getUsername;


  NavDrawer(this.callback, this.getUsername);

  @override
  State<StatefulWidget> createState() => new NavDrawerState();
}
