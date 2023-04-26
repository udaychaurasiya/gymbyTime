import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/FontStyle.dart';
class ButtonWidget2 extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  const ButtonWidget2({Key? key, required this.onPress, required this.text, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 38.h,
        width:130.w,
        decoration: BoxDecoration(
          color: Colors.white54.withOpacity(.6),
          border: Border.all(color: Colors.grey,width: .5),
          borderRadius: BorderRadius.circular(20.w),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 35.0,
              spreadRadius: -8.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(10.0, 5.0),
              blurRadius: 50.0,
              spreadRadius: -13.0,
            ), //BoxShadow
          ],
        ),
        child:Center(child:Text(text,style: smallTextStyle.copyWith(fontSize: 13.sp,color: Colors.blue),)),),
    );
  }
}
