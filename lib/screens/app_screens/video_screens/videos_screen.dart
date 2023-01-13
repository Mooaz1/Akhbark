import 'package:akhbark/screens/app_screens/video_screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // gizra , bbc , el hads , sky trt , alrabia , al ekhbarya , al hewar, france 24, al hora, al ghad, dw
  List channals_image_list=[
    "https://2.bp.blogspot.com/-x6oAMI_vJIY/V4lOENKtG5I/AAAAAAAAA_8/hg0ZRnBTzTYSmFEvO3rtNzNX0733aepCgCLcB/s1600/m79G0z_U.jpg",
    "https://upload.wikimedia.org/wikipedia/en/thumb/f/ff/BBC_News.svg/1023px-BBC_News.svg.png",
    "https://mediaaws.almasryalyoum.com/news/large/2015/09/30/371876_0.jpg",
    "http://img0cf.b8cdn.com/images/logo/73/1465073_logo_1573380810_n.png",
    "https://www.pngkit.com/png/full/209-2090655_logo-of-trt1-trt-tv-1.png",
    "https://www.fekera.com/wp-content/uploads/2018/12/تردد-قناة-العربية-2021-علي-النايل-سات-والعرب-سات.jpeg",
    "https://upload.wikimedia.org/wikipedia/commons/e/e3/القنا.png",
    "https://www.altkia.com/wp-content/uploads/2015/03/قناة-الحوار.jpg",
    "https://static.france24.com/meta_og_twcards/jsonld_publisher.png",
    "https://www.emploi.ma/sites/default/files/styles/medium/public/logo/alhurra.png",
    "https://i.ytimg.com/vi/C9R1JrHuWSM/maxresdefault.jpg",
    "https://pbs.twimg.com/profile_images/905053740209754112/4T05Cmmh_400x400.jpg"






  ];
  List<String> channals_list=[
    "https://youtu.be/bNyUyrR0PHo",
    "https://youtu.be/HxI2TxhhS9A",
    "https://youtu.be/St61kDYyrvk",
    "https://youtu.be/yd_H1PwIB0E",
    "https://youtu.be/aSVBH45EnaQ",
    "https://youtu.be/_rewJPptlBg",
    "https://youtu.be/5x_MqAq5pos",
    "https://youtu.be/HRTAnpasP78",
    'https://youtu.be/gxG3pdKvlIs',
    "https://youtu.be/di0njNFieL8",
    "https://youtu.be/64bUjSA0MOw",
    "https://youtu.be/vBOG85PlrTw",


  ];
 
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 10,
          top: 20
        ),
        child: GridView.builder(
          
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .9,
                crossAxisCount:3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemCount: channals_list.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(VideoPlayerScreen(url:channals_list[index],));
                },
                child: Container(
                
                 decoration: BoxDecoration(
                  image: DecorationImage(  
                    image: NetworkImage("${channals_image_list[index]}"),
                    fit: BoxFit.cover
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: Colors.black
                  )
                 ),
                
                ),
              );
            },
          
          ),
      )

    );
  }
  Future setLand()async{
    await SystemChrome.setEnabledSystemUIOverlays([]);
await SystemChrome.setPreferredOrientations(
  [DeviceOrientation.landscapeLeft,
   DeviceOrientation.landscapeRight,]
);
  }
}