import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_step_app_msp/cubit/cubit.dart';
import 'package:frist_step_app_msp/frcubit/cubit.dart';
import 'package:frist_step_app_msp/cubit/states.dart';
import 'package:frist_step_app_msp/layout/screens/webview.dart';
import 'package:frist_step_app_msp/modules/item.dart';


class details extends StatelessWidget{
  @override
  details(String p ,String t,String d,d2,u){
    this.picture=p;
    this.titile=t;
    this.detail=d;
    this.date=d2;
    this.url = u;
  }
  late String picture,date;
  late String titile;
  late String detail;
  late String url;
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        NewsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body:SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.network(picture),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0)-EdgeInsets.only(bottom: 15),
                  child: Container(alignment: Alignment.topLeft,
                    child: Text("published : "+date,style: TextStyle(color: Colors.grey),),
                    height: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: (){
                      navigateTo(context, WebViewScreen(url));
                    },
                    child: Text(titile
                      ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0)-EdgeInsets.only(top: 15),
                    child: Text(detail
                      ,style: TextStyle(fontSize: 17),),

                  ),
                ),

              ],
            ),
          )
          ,bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index)
          {
            cubit.changeBottomNavBar(index,context);
          },
          items: cubit.bottomItems,
        ),
        );
      },

    );
  }
}