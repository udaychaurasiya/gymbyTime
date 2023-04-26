import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CButton extends StatelessWidget {
  final VoidCallback onPress;

  const CButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onPress,
          child: Container(
              height: 38.h,
              width: 38.h,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, width: .5),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 20.0,
                    spreadRadius: -12.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(10.0, 5.0),
                    blurRadius: 40.0,
                    spreadRadius: -10.0,
                  ), //BoxShadow
                ],
              ),
              child: Icon(
                Icons.arrow_forward, color: Colors.blue,
                weight: .1,)),
        )

      ],
    );
  }
}
