import 'dart:ui';

import 'package:akhbark/logic/cubit/news_cubit.dart';
import 'package:akhbark/screens/app_screens/home_screen_widgets/news_screen.dart';
import 'package:akhbark/screens/auth_screens/pre_screen.dart';
import 'package:akhbark/utilities/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  double? height;
  double? width;
  List<String> topics = [
    "All news",
    "Bussniess",
    "Enterrainment",
    "helth",
    "Science",
    "Sports",
    "Tech"
  ];

  List<String> image_list = [
    "assets/news.png",
    "assets/bussniess.png",
    "assets/entertainment.png",
    "assets/helth.png",
    "assets/science.png",
    "assets/sports.png",
    "assets/tech.png",
  ];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit =NewsCubit();
        print("list is                  " +
            NewsCubit.get(context).all_topics.length.toString());
        return (NewsCubit.get(context).all_topics.length>6)?Scaffold(
         
          body: Column(
            children: [
              SizedBox(
                height: height! * .05,
              ),
              Container(
                height: height! * .16,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          NewsCubit.get(context).changeIndexList(index);
                          print(index.toString());
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: height! * .08,
                                width: width! * .2,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "${image_list[index]}"),
                                        fit: BoxFit.cover),
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                              ),
                              SizedBox(
                                height: height! * .01,
                              ),
                              Text(
                                topics[index].toString(),
                                style:NewsCubit.get(context).isdark? TextStyle(color: Colors.white):TextStyle(color: Colors.black)
                                
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
              Expanded(child: NewsScreen(height: height,list_index: NewsCubit.get(context).currentIndex,))
            ],
          ),
        ):Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
