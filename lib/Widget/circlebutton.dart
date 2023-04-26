import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback onPress;

  const CircularButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
                height: 48,
                width: 48,
                child: CircularProgressIndicator(
                  strokeWidth: 2,color: Colors.white,))),
        RawMaterialButton(
          onPressed: onPress,
          child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 18.sp,),
          padding: EdgeInsets.all(12.w),
          shape: CircleBorder(),
          splashColor: Colors.white,
          focusColor: Colors.white,
          fillColor: Colors.white,
          constraints: BoxConstraints(maxHeight: 40,maxWidth: 40),
        ),

      ],
    );
  }
}
