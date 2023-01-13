
import 'package:akhbark/screens/auth_screens/regstertion_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PreScreen extends StatefulWidget {
  const PreScreen({super.key});

  @override
  State<PreScreen> createState() => _PreScreenState();
}

class _PreScreenState extends State<PreScreen> {
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: width,
                height: height! / 2,
                decoration:  BoxDecoration(
                    color: HexColor('#071e26'),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120))),
              ),
              Container(
                width: width,
                height: height! / 2,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    // ignore: prefer_const_constructors
                    Text(
                      "Akhbark",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w500,color: HexColor('#134b5f')),
                    ),
                    SizedBox(height: height!*.04,),
                    // ignore: prefer_const_constructors
                    Text(
                      "A news platfrom cover local news",
                      style:
                          TextStyle(fontSize: 20, color: HexColor('#134b5f')),
                    ),
                    SizedBox(height: height!*.13,),
                    InkWell(
                      onTap: () {
                        Get.to(()=>RegestrtionScreen(),transition:Transition.circularReveal,duration:
                        Duration(seconds: 3)  );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: height!*.07,
                        width: width!*.6,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen[400],
                          borderRadius: BorderRadius.circular(60)
                        ),
                        child: Row(
                          children:const [
                            Text("Get started for free"),
                            Spacer(),
                           
                           Text("➤",style: TextStyle(
                            fontSize: 15
                           ),)
                    
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: height! * .4,
            left: width! * .3,
            child: Container(
              height: height! * .15,
              width: width! * .3,
              decoration: BoxDecoration(
                color: Colors.white,
                  image: DecorationImage(  
                    image: AssetImage('assets/akhbark.png'),
                    fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ],
      )),
    );
  }
}
