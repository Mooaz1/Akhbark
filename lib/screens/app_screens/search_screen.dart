import 'package:akhbark/logic/cubit/news_cubit.dart';
import 'package:akhbark/screens/app_screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController search_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search_list;
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                      child: TextFormField(
                        controller: search_controller,
                        validator: (value) {
                          if (value != null)
                            return null;
                          else
                            return "enter valid search";
                        },
                        onChanged: (value) {
                          NewsCubit.get(context).getSearch(value);
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Search",
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ),
                  NewsCubit.get(context).search_list.length > 0
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(DetailsScreen(list: list[index],));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: (NetworkImage(
                           "https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"))
                                                )
                                                )
                                                ),
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
                                                "${list[index]['title']}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(
                                              "${list[index]['publishedAt']}",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                          separatorBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 10),
                              child: Container(
                                height: 1,
                                color: Colors.black,
                              ),
                            );
                          }),
                          itemCount: list.length)
                      : Center(
                          child: Text("the search is empty",style: TextStyle(
                      color:Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
