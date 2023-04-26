import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../FontStyle.dart';
class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPress;
  const BackButtonWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      onPress();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 20.h,
          width: 15.w,
          child: Image.asset(("assets/images/back.png")),
        ),
      ),
    );
  }
}
