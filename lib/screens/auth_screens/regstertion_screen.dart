import 'package:akhbark/components/components.dart';
import 'package:akhbark/screens/app_screens/bottomnavbar.dart';
import 'package:akhbark/screens/app_screens/home_screen.dart';
import 'package:akhbark/screens/auth_screens/login_screen.dart';
import 'package:akhbark/utilities/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class RegestrtionScreen extends StatefulWidget {
  const RegestrtionScreen({super.key});

  @override
  State<RegestrtionScreen> createState() => _RegestrtionScreenState();
}

class _RegestrtionScreenState extends State<RegestrtionScreen> {
  double? height;
  double? width;
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  final formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Form(
      key: formkey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 100,horizontal: 30
              ),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text(
                    "Akhbark",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#134b5f')),
                  ),
                  SizedBox(height: height!*.05,),
                  Text(
                    "A news platfrom cover local news",
                    style: TextStyle(fontSize: 20, color: HexColor('#134b5f')),
                  ),
                  SizedBox(height: height!*.1,),
                  // The Email Container
                  defultTextFormFiled(controller: email_controller,
                   obscureText: false,
                    labelText: "Email",
                     icon: Icon(Icons.email,color: Colors.black,)),
                  SizedBox(height: height!*.05,),
          
                  //The password Container
                  defultTextFormFiled(controller: password_controller
                , obscureText: true,
                 labelText: "Password", 
                 hintText: "please enter more than 6 char",
                 icon: Icon(Icons.lock,color: Colors.black,)),
                  SizedBox(height: height!*.07,),
                  InkWell(
                    onTap: () {
          
                      signUp();
                      
                    },
                    child: Container(
                  
                      height: height!*.08,
                      width: width!*.7,
                      decoration: BoxDecoration(
                        color:  HexColor('#165a72'),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      
                      
                      
                      child:const Center(child: Text("Sign up",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold
                      ),))),
                  ),
                  SizedBox(height: height!*.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Text("Already have an account ?"),
                      SizedBox(width: width!*.05,),
                      TextButton(onPressed: (() {
                        print("login");
                        Get.to(()=>LoginScreen(),transition: Transition.zoom,duration: Duration(seconds: 1));
                      }), child:const Text("login",style: TextStyle(color: Colors.blue),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future signUp()async{
    if(!formkey.currentState!.validate()) return;

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email_controller.text.trim(),
 password: password_controller.text.trim()).then((value){
  Get.to(()=>BottomNavBar(),transition: Transition.zoom,duration: Duration(seconds: 2));
 });
    }on FirebaseAuthException catch (e){
      Utils.showSnackBar(e.message,Colors.red);
    }

  }
}
