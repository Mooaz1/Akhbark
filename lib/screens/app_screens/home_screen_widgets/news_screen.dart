import 'package:akhbark/logic/cubit/news_cubit.dart';
import 'package:akhbark/screens/app_screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key, required this.height,required this.list_index })
      : super(key: key);

  final double? height;
  final list_index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list =NewsCubit.get(context).all_topics[list_index];
        print(list[0]['title']);
   return      ListView.separated(
     shrinkWrap: true,
       physics: BouncingScrollPhysics(),
       itemBuilder: ((context, index) {
         return GestureDetector(
          onTap: () {
            print(list[index]);
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
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(
                             fit: BoxFit.fill,
                             image: (NetworkImage(
                              (list[index]['urlToImage']!=null) ? '${list[index]['urlToImage']}':"https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"))))),
                 SizedBox(
                   width: 20,
                 ),
                 Expanded(
                   child: Container(
                     height: 120,
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Expanded(
                           child: Text(
                            "${list[index]['title']}",
                             style:TextStyle(
                      color:NewsCubit.get(context).isdark? Colors.white:Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                             maxLines: 3,
                             overflow: TextOverflow.ellipsis,
                           ),
                         ),
                         Text(
                          "${list[index]['publishedAt']}",
                           style: TextStyle(color: Colors.grey, fontSize: 20),
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
           padding: const EdgeInsetsDirectional.only(start: 10),
           child: Container(
             height: 1,
             color: Colors.black,
           ),
         );
       }),
       itemCount:list.length);
      },
    );
  }
}
