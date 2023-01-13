import 'package:akhbark/logic/cubit/news_cubit.dart';
import 'package:akhbark/screens/app_screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var favorite = NewsCubit.get(context).fav_list;
        return Scaffold(
            body: favorite.length > 0
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Dismissible(
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete_forever),
                        ),
                        key: Key(favorite[index].toString()),
                        onDismissed: (direction) {
                          direction = DismissDirection.horizontal;
                         NewsCubit.get(context).fav_list.removeAt(index);
                        },
                        child: GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(
                              list: favorite[index],
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: (NetworkImage((favorite[
                                                        index]['urlToImage'] !=
                                                    null)
                                                ? '${favorite[index]['urlToImage']}'
                                                : "https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"))))),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 120,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${favorite[index]['title']}",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "${favorite[index]['publishedAt']}",
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsetsDirectional.only(start: 10),
                        child: Container(
                          height: 1,
                          color: Colors.black,
                        ),
                      );
                    }),
                    itemCount: favorite.length)
                : Center(
                    child: Text(
                    "the favorite is empty",
                    style: TextStyle(
                        color: NewsCubit.get(context).isdark
                            ? Colors.white
                            : Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  )));
      },
    );
  }
}
