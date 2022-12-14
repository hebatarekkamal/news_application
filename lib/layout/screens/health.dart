
//import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_step_app_msp/cubit/states.dart';
import 'package:frist_step_app_msp/modules/item.dart';
import 'package:frist_step_app_msp/cubit/cubit.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>
      (
      listener: (context, state) {},
      builder: (context, state) {
        //NewsCubit.get(context).getBusinessData();
        var list =  NewsCubit.get(context).health;
        var size = list.length;
        //print(list.length);
       if(size > 0)
         {
           return
             Scaffold(
               appBar: AppBar(
                 title: Text(
                   'Health',
                 ),
               ),
               body: ConditionalBuilder(
                 fallback: (context) => Center(child: Text('this is not true')),
                 condition: state is! GetHealthload,
                 builder: (context) => CarouselSlider.builder(
                   options: CarouselOptions(
                     height: 1500,

                     autoPlay: false,
                     enlargeCenterPage: true,
                     viewportFraction: 0.9,
                     //aspectRatio: 2.0,
                     initialPage: 2,
                   ),
                   itemCount: list.length,
                   itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => buildItem(list[itemIndex],context),
                 ),
               ),
             );
         }
       else
         {
           return Container(
             child: Center(child: Text('Data Is Loading')),
           );
         }
      },
    );

  }
}
