import 'package:akhbark/logic/cubit/news_cubit.dart';
import 'package:akhbark/screens/app_screens/fav_screen.dart';
import 'package:akhbark/screens/app_screens/home_screen.dart';
import 'package:akhbark/screens/app_screens/search_screen.dart';
import 'package:akhbark/screens/app_screens/setting.dart';
import 'package:akhbark/screens/app_screens/video_screens/videos_screen.dart';
import 'package:akhbark/screens/auth_screens/pre_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> main_widgets_list = const [HomeScreen(), VideoScreen(),FavScreen()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: (()async => false),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                NewsCubit.get(context).changeThemMode();
                },
                icon: Icon(Icons.nightlight,
                ),
              ),
        
              actions: [
                IconButton(
                    onPressed: (() {
                      Get.to(SearchScreen());
                    }),
                    icon: Icon(
                      Icons.search,
                    )),
                IconButton(
                    onPressed: (() {
                      FirebaseAuth.instance.signOut();
                      Get.to(PreScreen());
                    }),
                    icon: Icon(
                      Icons.exit_to_app,
                    )),
              ],
            ),
            body: main_widgets_list.elementAt(currentIndex),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.newspaper,
                    ),
                    label: 'News'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_collection_outlined),
                    label: "Striming channals"),
                     BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "Favorite ")
              ],
            ),
          ),
        );
      },
    );
  }
}
