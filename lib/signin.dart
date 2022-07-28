import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(backgroundColor: Colors.pink[900],),
    body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "email",

            ),
          )
        ],
      ),
    ),
  );
  }
}