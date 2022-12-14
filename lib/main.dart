import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_step_app_msp/cubit/cubit.dart';
import 'package:frist_step_app_msp/cubit/states.dart';
import 'package:frist_step_app_msp/layout/newslayout.dart';
import 'package:frist_step_app_msp/loginnew.dart';
import 'package:frist_step_app_msp/network/dio_helper.dart';
import 'package:frist_step_app_msp/splach.dart';

// GET
// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// query : country=eg&category=business&apiKey=84d9bfdd09d94514ab491388a3e520e4
// apiKey = bdb4c206eb8c49e7bd6fd024b8b30db3 ((sohyla))

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create : (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , state) {},
        builder: (context , state) {

          NewsCubit cubit = BlocProvider.of(context);
          cubit..getDiscovery()..getBusinessData()..getSportsData()..getScienceData()..getHealthData()..getTechnologyData();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black87,
                ),
                backgroundColor: Colors.white,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),

                titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 20.0,
              ),
            ),
            home: splach(),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black12,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.black12,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black12,
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    color: Colors.blue,
                  ),
                  bodyText2: TextStyle(
                    color: Colors.blue,
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 20.0,
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          );
        },
      ),
    );
  }
}