

// ****  this code was palned to be implemnted but it didnt****///



// import 'package:akhbark/components/components.dart';
// import 'package:akhbark/logic/cubit/news_cubit.dart';
// import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
// import 'package:share_plus/share_plus.dart';

// class SetteingsScreen extends StatefulWidget {
//   SetteingsScreen({super.key});

//   @override
//   State<SetteingsScreen> createState() => _SetteingsScreenState();
// }

// class _SetteingsScreenState extends State<SetteingsScreen> {
//   bool isprssed = true;
//   bool share_app_press= false;

//   @override
//   Widget build(BuildContext context) {
     
    
//     return BlocConsumer<NewsCubit, NewsState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text("settings"),
//             centerTitle: true,
//           ),
//           body: Padding(
//             padding: const EdgeInsetsDirectional.only(
//               top: 100,
//               start: 30,
//               end: 30,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Text("Change Theme Mode"),
//                 SizedBox(height: 40,),
//                 Row(
//                   children: [
//                     Text(NewsCubit.get(context).isdark?"Dark mode activated":"light mode activated",style: NewsCubit.get(context).isdark? TextStyle(color: Colors.white):TextStyle(color: Colors.black),),
//                     Spacer(),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           isprssed = !isprssed;
                          
//                         });
//                         NewsCubit.get(context).changeThemMode();
//                         print(dark.toString());
//                       },
//                       child: nuphButton(context,isprssed),
//                     )
//                   ],
//                 ),
              
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   AnimatedContainer nuphButton(BuildContext context,bool isnet) {
//     return AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           color: Theme.of(context).scaffoldBackgroundColor,
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                                 blurRadius: isnet ? 10 : 30,
//                                 offset: isnet ? Offset(-10, -10) : Offset(-28, -28),
//                                 color:
//                                    Colors.black,
//                                 inset: isnet),
//                             BoxShadow(
//                                 blurRadius: isnet ? 10 : 30,
//                                 offset: isnet ? Offset(10, 10) : Offset(28, 28),
//                                 color: Color(0xFFA7A9AF),
//                                 inset: isnet)
//                           ]),
//                     );
//   }
// }
