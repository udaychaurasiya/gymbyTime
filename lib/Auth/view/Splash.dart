import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Auth/view/Splash_Screen.dart';
import 'package:gym/Widget/circlebutton.dart';

import '../../FontStyle.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Splash.gif"),fit: BoxFit.cover
              )
            ),
          ),
          Positioned(
            right: 10.w,
              bottom: 120.h,
              child: CircularButton(onPress: () {
                Get.to(()=>Spalshscreen());
              },)),

          Container(
            child: Column(
              children: [
                SizedBox(height: 380.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w,right: 140.w),
                  child: Text("Nothing",style: bodyText3Style.
                  copyWith(fontSize: 40.sp,letterSpacing:2,foreground: Paint()..style=PaintingStyle.stroke
                    ..color=Colors.white
                    ..strokeWidth=1
                  ),),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.w),
                  child: Container(
                    margin: EdgeInsets.only(left: 40.w,right: 10.w),
                    child: Text("Will Work",style: bodyText3Style.
                    copyWith(fontSize: 40.sp,letterSpacing:2,foreground: Paint()..style=PaintingStyle.stroke
                      ..color=Colors.white
                      ..strokeWidth=1
                    ),),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 128.w,right: 5.w),
                  child: Text("UNLESS",style: bodyText3Style.
                  copyWith(fontSize: 40.sp,letterSpacing:2,foreground: Paint()..style=PaintingStyle.stroke
                    ..color=Colors.white
                    ..strokeWidth=1
                  ),),
                ),
                SizedBox(height: 10.h,),
                Padding(
                  padding:  EdgeInsets.only(right:60.w),
                  child: Text("YOU DO ..",style: bodyText3Style.
                  copyWith(fontSize: 45.sp,letterSpacing:2,foreground: Paint()..style=PaintingStyle.stroke
                    ..color=Colors.white
                    ..strokeWidth=1
                  ),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
