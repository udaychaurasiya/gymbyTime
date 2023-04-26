import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym/FontStyle.dart';

/*
class AppTheme{
   final lightTheme = ThemeData(
    scrollbarTheme: ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all( Color(0xff2a63a1)),
    ),
    primaryColorLight: Color(0xff494b4b),// Sidebar color
    shadowColor: Colors.white,
    canvasColor: Colors.white,

    dialogBackgroundColor:Colors.white,
    focusColor: Colors.grey.shade50.withOpacity(.5),
    textSelectionTheme:TextSelectionThemeData(
      selectionColor: Colors.grey.withOpacity(.2),
    ),
    appBarTheme: AppBarTheme(
    brightness: Brightness.light,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.white,
        ),),
    iconTheme: IconThemeData(
        color:Colors.white.withOpacity(0.87)
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary:Colors.black,
      primary:  Colors.black87,
      onPrimary: Colors.white,
      surfaceVariant: Color(0xff2a63a1),
      onSurface: Color(0xff2a63a1),
      secondaryContainer: Color(0xff09214b),//Side bar Background
      inversePrimary:Colors.grey.withOpacity(.1),
      surface: Colors.white,// Time Picker
      background: Color(0xffeeeeee),
      onSecondary: Color(0xff5BC0F8),
      scrim: Color(0xff2978B5),//gridHeader
    ),
    textTheme:  TextTheme(
      bodyText1: GoogleFonts.beVietnamPro(
        textStyle:smallTextStyle.copyWith(fontSize: 11.sp),
      ),//for Hint Text
      bodyText2: GoogleFonts.beVietnamPro(
          textStyle: TextStyle(color: Color(0xFFEEEEEE),fontSize: 14,fontWeight: FontWeight.w400)),
      headline4:GoogleFonts.beVietnamPro(
        textStyle: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),
      ),
    ),
  );

  final darkTheme = ThemeData(
    scrollbarTheme: ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all( Color(0xff2a63a1)),
    ),
    textSelectionTheme:TextSelectionThemeData(
      selectionColor: Colors.grey.withOpacity(.2),
    ),
    canvasColor: Colors.black,
    shadowColor: Colors.black,
    buttonColor: Color(0xff005c4b),
    focusColor: Colors.grey.shade50.withOpacity(.5),
    appBarTheme: AppBarTheme(
        brightness: Brightness.light,
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
            color: Colors.white
        )
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary:Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.grey,
      secondaryContainer: Color(0xff09214b),//Side bar Background
      background: Color(0xffeeeeee),//service part
      surfaceVariant: Color(0xFF5BC0F8),
      surface: Colors.white,// Time Picker
    ),
    textTheme:  TextTheme(
      bodyText1: GoogleFonts.beVietnamPro(
        textStyle:smallTextStyle.copyWith(fontSize: 11.sp,color: Colors.white),
      ),
      bodyText2:GoogleFonts.beVietnamPro(
        textStyle:smallTextStyle.copyWith(fontSize: 15.sp,color: Colors.white),
      ),
      headline4:GoogleFonts.beVietnamPro(
        textStyle: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400),
      ),
    ),
  );

}
*/
/*class AppTheme{
  final lightTheme=ThemeData();
  final darkTheme=ThemeData();
}*/
class ThemeClass{

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      shadowColor: Colors.black,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
      )
  );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.dark(),
      shadowColor: Colors.blue,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      )
  );
}

