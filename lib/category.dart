import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0) + EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sports: ",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(7.0)),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [

                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        "he play football with his trio messi and suariz",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      height: 120,
                    ),
                  )),
                  Column(
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://images2.minutemediacdn.com/image/fetch/w_736,h_485,c_fill,g_auto,f_auto/https%3A%2F%2Fplayingfor90.com%2Fwp-content%2Fuploads%2Fgetty-images%2F2018%2F08%2F1240334654-850x560.jpeg"),
                        height: 140,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ), ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
