import 'package:akhbark/components/components.dart';
import 'package:akhbark/logic/cache/cache_helper.dart';
import 'package:akhbark/logic/cubit/news_cubit.dart';
import 'package:akhbark/logic/dio/dio_helper.dart';
import 'package:akhbark/screens/auth_screens/login_screen.dart';
import 'package:akhbark/screens/auth_screens/pre_screen.dart';
import 'package:akhbark/screens/auth_screens/regstertion_screen.dart';
import 'package:akhbark/screens/splash/splash_screen.dart';
import 'package:akhbark/utilities/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'logic/cubit/bloc_observer.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
 await CacheHelper.init();
 

  DioHelper.init();

  runApp(BlocProvider(
    create: (context) => NewsCubit()..getDate()..changeThemMode(fromshared: dark),
    child: BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GetMaterialApp(
          scaffoldMessengerKey: Utils.messangerkey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: HexColor('#134b5f'),
                  elevation: 0.0,
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  )),
              scaffoldBackgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: HexColor('#134b5f'),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: HexColor('#134b5f'),
              ),
              textTheme:const  TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  bodyText2: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  headline1: TextStyle(color: Colors.grey, fontSize: 20),
                  headline2: TextStyle(color: Colors.black, fontSize: 30)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('#134b5f'),
                unselectedItemColor: Colors.white,
              )),
          darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.black,
                  elevation: 0.0,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  )),
              scaffoldBackgroundColor: Colors.black,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.black,
              ),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  bodyText2: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  headline1: TextStyle(color: Colors.grey, fontSize: 20),
                  headline2: TextStyle(color: Colors.white, fontSize: 30)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                unselectedItemColor: Colors.white,
              )),
          themeMode:
               NewsCubit.get(context).isdark? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
        );
      },
    ),
  ));
}
