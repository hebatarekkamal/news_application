
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_step_app_msp/cubit/cubit.dart';
import 'package:frist_step_app_msp/cubit/states.dart';
import 'package:frist_step_app_msp/modules/item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context , state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (val) {
                    NewsCubit.get(context).getSearch(val);
                  },
                ),
              ),
              Expanded(
                  child : buildListForSearchScreen(list,context),
              ),
            ],
          ),
        );
      },
    );
  }
}
