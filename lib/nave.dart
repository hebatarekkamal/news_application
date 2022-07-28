import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class nave extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      fixedColor: Colors.black,
      onTap: (index){

      },
      items: [
        BottomNavigationBarItem(
            icon: Icon
              (Icons.home,color: Colors.black),
            label: "home"
        ),
        BottomNavigationBarItem(
            icon: Icon
              (Icons.favorite,color: Colors.black),
            label: "favourite"
        ), BottomNavigationBarItem(
            icon: Icon
              (Icons.settings,color: Colors.black,),
            label: "setting"
        ),
      ],
    );
  }
}
