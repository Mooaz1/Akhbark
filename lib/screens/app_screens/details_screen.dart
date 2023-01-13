import 'package:akhbark/logic/cubit/news_cubit.dart';
import 'package:akhbark/screens/app_screens/fav_screen.dart';
import 'package:akhbark/screens/app_screens/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({super.key, this.list});
  final list;

  double? height;

  double? width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return  BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Stack(children: [
                Column(
                  children: [
                    ClipPath(
                      clipper: ClipContainer(),
                      child: Container(
                        height: height! * .5,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                                image: (NetworkImage((list['urlToImage'] !=
                                        null)
                                    ? '${list['urlToImage']}'
                                    : "https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg")),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      height: height! * .05,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "${list['description']}",
                            style:Theme.of(context).textTheme.headline2 ,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                //date
                Positioned(
                    top: height! * .5 - 30,
                    right: width! * .25,
                    child: Text(
                      "${list['publishedAt']}",
                      style:Theme.of(context).textTheme.headline1 ,
                    )),

                Positioned(
                    top: height! * .03,
                    right: width! * .05,
                    child: IconButton(
                      onPressed: () {
                        //_TypeError (type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'List<dynamic>')

                        NewsCubit.get(context).getFavlist(list);
                        Get.to(FavScreen());
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                        color: Colors.white,
                      ),
                    )),
              ]),
              floatingActionButton: Container(
                height: 100,
                width: 100,
                child: FloatingActionButton(
                 
                  onPressed: () {
                Get.to(WebviewPage(url: list['url'],));                 },
                  child: Text(
                    "go to webpage",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      
    );
  }
}

class ClipContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;
    final path = Path();
    // (0,0) point 1
    path.lineTo(0, h); //point2
    path.quadraticBezierTo(w * .5, h - 100, w, h); //point 4
    path.lineTo(w, 0); //point 5
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // ignore: todo
    // TODO: implement shouldReclip
    return false;
  }
}
