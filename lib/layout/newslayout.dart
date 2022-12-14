import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_step_app_msp/cubit/cubit.dart';
import 'package:frist_step_app_msp/cubit/states.dart';
import 'package:frist_step_app_msp/layout/screens/search.dart';
import 'package:frist_step_app_msp/modules/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state) {},
        builder: (context , state)
        {
          //var cubit = NewsCubit.get(context);
          NewsCubit cubit = BlocProvider.of(context);
          //cubit..getDiscovery()..getBusinessData()..getSportsData()..getScienceData()..getHealthData()..getTechnologyData();


          return Scaffold(
            appBar: AppBar(
              title: Text('News App',),
              actions: [
                IconButton(
                    onPressed: (){
                      NewsCubit.get(context).ChangeMode();
                    }
                    , icon: Icon(
                  Icons.brightness_4,
                )
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index,context);
              },
              items: cubit.bottomItems,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      );
  }
}
