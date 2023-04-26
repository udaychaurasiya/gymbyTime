import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/Auth/view/SignUp_Login.dart';
import 'package:page_transition/page_transition.dart';
class Spalshscreen extends StatefulWidget {
  const Spalshscreen({Key? key}) : super(key: key);

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen>
{
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
      children: [
        Image.asset("assets/images/Logo.png",height: 200,width: 200,),
      ],
    ),
      backgroundColor: Colors.white,
      nextScreen: SignUp_Login(),
      splashIconSize: 250.h,
    );
  }
}