import 'dart:ui';

import 'package:akhbark/components/components.dart';
import 'package:akhbark/screens/auth_screens/login_screen.dart';
import 'package:akhbark/utilities/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        
      body: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defultTextFormFiled(controller: controller,
             obscureText: false,
              labelText: "Email",
              hintText: "Enter the recovery email",
               icon: Icon(Icons.email,color: Colors.black,)),
               SizedBox(height: height*.08,),
                InkWell(
                  onTap: () {
                   resetPassword();
                    
                  },
                  child: Container(
                    child: Center(
                      child: Text("Reset password",style: TextStyle(color: Colors.white),),
                    ),
                
                    height: height*.08,
                    width: width*.7,
                    decoration: BoxDecoration(
                      color:  HexColor('#165a72'),
                      borderRadius: BorderRadius.circular(30)
                    ))),
          ],
    
        ),
      ),
      ),
    );
  }
  Future resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: controller.text.trim()).then((value){
        Utils.showSnackBar("Reset password succesfully", Colors.green[600]);
        Get.to(()=>LoginScreen(),transition: Transition.zoom,duration: Duration(seconds: 1));
       });
    } on FirebaseAuthException catch(e){
      Utils.showSnackBar(e.message, Colors.red);
    }

  }
}