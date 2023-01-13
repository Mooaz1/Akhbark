import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
   VideoPlayerScreen({super.key,this.url});
   String? url;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
 //final  String ?videourl=widget.url;
  late YoutubePlayerController youtubePlayerController;
  @override
  void initState() {
    // TODO: implement initState
   
    final videoid=YoutubePlayer.convertUrlToId(widget.url!);
    youtubePlayerController=YoutubePlayerController(
      
      initialVideoId: videoid!,
      flags:const YoutubePlayerFlags(
        autoPlay: true
      )
      );
      setLand();
       super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setportrit();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio:19.5/9,
            child: YoutubePlayer(controller: youtubePlayerController,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              FullScreenButton(),
              ProgressBar(
                isExpanded: true,
                
                
              )
            ],
            ),
          )
        ],
      ),

    );
  }
  Future setLand()async{
    await SystemChrome.setEnabledSystemUIOverlays([]);
await SystemChrome.setPreferredOrientations(
  [DeviceOrientation.landscapeLeft,
   DeviceOrientation.landscapeRight,]
);
  }
  Future setportrit()async{
    await SystemChrome.setEnabledSystemUIOverlays([]);
await SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitUp,
   DeviceOrientation.portraitDown,]
);
  }
}