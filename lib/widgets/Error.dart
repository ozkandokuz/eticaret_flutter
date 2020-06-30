import 'package:flutter/material.dart';





class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar:AppBar(
           title: new Text("Error")
        ),
        body: Center(
            child:
              Text(
                'Bir hata oluştu. Uygulamayı yeniden başlatın.',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

        ),
      )
    );
  }

}