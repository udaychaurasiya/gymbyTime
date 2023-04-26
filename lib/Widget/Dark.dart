//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../Auth/application_constatnt.dart';
// import 'Colors.dart';
//
// GetStorage storage= GetStorage();
//
// class AppTheme{
//  static final lightTheme=ThemeData.light().copyWith(
//
//      scaffoldBackgroundColor:storage.read(ApplicationConstant.backgroundColorLight)!=null?storage.read(ApplicationConstant.backgroundColorLight).toString().toColor():backgroundColorLight,
//       appBarTheme: AppBarTheme(
//           backgroundColor:storage.read(ApplicationConstant.appBarLight)!=null? storage.read(ApplicationConstant.appBarLight).toString().toColor():Colors.teal,
//           centerTitle:false,
//           titleTextStyle: TextStyle(
//               color:storage.read(ApplicationConstant.fontColorTitleLight)!=null? storage.read(ApplicationConstant.fontColorTitleLight).toString().toColor():Colors.black,
//               fontWeight: FontWeight.w600,
//               fontSize: storage.read(ApplicationConstant.fontsizeHeadingDark)??20
//           ),
//           elevation:1.0,
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor:storage.read(ApplicationConstant.appBarLight)!=null?storage.read(ApplicationConstant.appBarLight).toString().toColor():Colors.teal,
//             statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
//             statusBarBrightness: Brightness.light, // For iOS (dark icons)
//           ),
//
//           iconTheme: IconThemeData(color:storage.read(ApplicationConstant.iconColorLight)!=null?storage.read(ApplicationConstant.iconColorLight).toString().toColor():Colors.black)
//       ),
//       colorScheme: ColorScheme.fromSwatch().copyWith(
//           secondary:storage.read(ApplicationConstant.secondaryLight)!=null? storage.read(ApplicationConstant.secondaryLight).toString().toColor():Colors.white,
//           primary:  storage.read(ApplicationConstant.primaryLight)!=null? storage.read(ApplicationConstant.primaryLight).toString().toColor():Colors.black,
//           onPrimaryContainer:storage.read(ApplicationConstant.secondaryLight)!=null? storage.read(ApplicationConstant.secondaryLight).toString().toColor(): Colors.white
//       ),
//       dialogBackgroundColor:storage.read(ApplicationConstant.dailogColorLight)!=null?storage.read(ApplicationConstant.dailogColorLight).toString().toColor():Colors.white,
//       textTheme: TextTheme(
//         bodyText1:TextStyle(
//             fontSize:storage.read(ApplicationConstant.fontsizeTitleLight)??16.0,
//             color:storage.read(ApplicationConstant.fontColorTitleLight)!=null? storage.read(ApplicationConstant.fontColorTitleLight).toString().toColor(): Colors.black),
//         bodyText2:TextStyle(
//             fontSize:storage.read(ApplicationConstant.fontsizeSubTitleLight)?? 14.0,
//             color:storage.read(ApplicationConstant.fontColorTitleSubtitleLight)!=null? storage.read(ApplicationConstant.fontColorTitleSubtitleLight).toString().toColor(): Colors.black),
//         headline4: TextStyle
//           (
//             fontSize:storage.read(ApplicationConstant.fontsizeHeadingLight)??20.0,
//             fontWeight: FontWeight.w500,
//             color:storage.read(ApplicationConstant.fontColorTitleLight)!=null? storage.read(ApplicationConstant.fontColorTitleLight).toString().toColor():Colors.white),
//       )
//   );
//
//   static final darkTheme=ThemeData.dark().copyWith(
//
//       scaffoldBackgroundColor:  storage.read(ApplicationConstant.backgroundColorDark)!=null?storage.read(ApplicationConstant.backgroundColorDark).toString().toColor():backgroundColor,
//
//       //themeController.backgroundColorDark.value,
//       appBarTheme: AppBarTheme(
//           backgroundColor:storage.read(ApplicationConstant.appBarDark)!=null? storage.read(ApplicationConstant.appBarDark).toString().toColor():Colors.teal,
//           centerTitle:false,
//           titleTextStyle: TextStyle(
//               color:storage.read(ApplicationConstant.fontColorTitleDark)!=null? storage.read(ApplicationConstant.fontColorTitleDark).toString().toColor():Colors.black,
//               fontWeight: FontWeight.w600,
//               fontSize: storage.read(ApplicationConstant.fontsizeHeadingDark)??20
//           ),
//           elevation:1.0,
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor:storage.read(ApplicationConstant.appBarDark)!=null?storage.read(ApplicationConstant.appBarDark).toString().toColor():Colors.teal,
//             // Status bar brightness (optional)
//             statusBarIconBrightness: Brightness.light, // For Android (dark icons)
//             statusBarBrightness: Brightness.dark,  // For iOS (dark icons)
//           ),
//
//           iconTheme: IconThemeData(color:storage.read(ApplicationConstant.iconColorDark)!=null?storage.read(ApplicationConstant.iconColorDark).toString().toColor():Colors.black)
//       ),
//       colorScheme: ColorScheme.fromSwatch().copyWith(
//           secondary:storage.read(ApplicationConstant.secondaryDark)!=null? storage.read(ApplicationConstant.secondaryDark).toString().toColor():Colors.white,
//           primary:  storage.read(ApplicationConstant.fontColorTitleDark)!=null? storage.read(ApplicationConstant.fontColorTitleDark).toString().toColor():Colors.black,
//           onPrimaryContainer:storage.read(ApplicationConstant.secondaryDark)!=null? storage.read(ApplicationConstant.secondaryDark).toString().toColor(): Colors.white
//       ),
//       dialogBackgroundColor:storage.read(ApplicationConstant.dailogColorDark)!=null?storage.read(ApplicationConstant.dailogColorDark).toString().toColor():Colors.red,
//       textTheme: TextTheme(
//         bodyText1:TextStyle(
//             fontSize:storage.read(ApplicationConstant.fontsizeTitleDark)??16.0,
//             color:storage.read(ApplicationConstant.fontColorTitleDark)!=null? storage.read(ApplicationConstant.fontColorTitleDark).toString().toColor(): Colors.black),
//         bodyText2:TextStyle(
//             fontSize:storage.read(ApplicationConstant.fontsizeSubTitleDark)?? 14.0,
//             color:storage.read(ApplicationConstant.fontColorTitleSubtitleDark)!=null? storage.read(ApplicationConstant.fontColorTitleSubtitleDark).toString().toColor(): Colors.black),
//         headline4: TextStyle
//           (
//             fontSize:storage.read(ApplicationConstant.fontsizeHeadingDark)??20.0,
//             fontWeight: FontWeight.w500,
//             color:storage.read(ApplicationConstant.fontColorTitleDark)!=null? storage.read(ApplicationConstant.fontColorTitleDark).toString().toColor():Colors.white),
//       )
//
//   );
//
//
//
// }
// extension ColorExtension on String {
//   toColor() {
//     var hexColor = this.replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF" + hexColor;
//     }
//     if (hexColor.length == 8) {
//       return Color(int.parse("0x$hexColor"));
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class AppTheme2 {
  static final lightTheme = ThemeData(
    scrollbarTheme: ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all( Color(0xff2a63a1)),
    ),
    backgroundColor: Colors.white,
    // primaryColorLight: Colors.white70,// Sidebar color
    primaryColorLight: Color(0xff202830),// Sidebar color
    cardColor: Colors.black,
    shadowColor: Colors.black,
    canvasColor: Colors.white,
    dialogBackgroundColor:Colors.white,
    focusColor: Colors.grey.shade50.withOpacity(.5),
    buttonColor: Colors.blue,
    textSelectionTheme:TextSelectionThemeData(
      selectionColor: Colors.grey.withOpacity(.2),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor:  Colors.blue,// App bar color

        // backgroundColor:  Color(0xff09856e),
        //backgroundColor: Color(0xff005c4b),
        titleTextStyle: TextStyle(
            color: Colors.white
        )
    ),
    iconTheme: IconThemeData(
        color:Colors.white.withOpacity(0.87)
    ),

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary:Colors.black,
      //storage.read(AppConstant.fontColorTitleDark)!=null? storage.read(AppConstant.fontColorTitleDark).toString().toColor()
      primary:  Colors.black87,
      onPrimary: Colors.white,
      surfaceVariant: Color(0xff2a63a1),
      onSurface: Color(0xff2a63a1),
      //secondaryContainer: Color(0xFF212332),
      // secondaryContainer: Color(0xFF004E77),
      secondaryContainer: Color(0xff09214b),//Side bar Background
      inversePrimary:Colors.grey.withOpacity(.1),
      surface: Colors.white,// Time Picker
      background: Color(0xffeeeeee),
      onSecondary: Color(0xff5BC0F8),
      scrim: Color(0xff2978B5),//gridHeader
      //storage.read(AppConstant.secondaryDark)!=null? storage.read(AppConstant.secondaryDark).toString().toColor():
    ),
    textTheme:  TextTheme(
      bodyText1: GoogleFonts.beVietnamPro(
        textStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400),
      ),//for Hint Text
      bodyText2: GoogleFonts.beVietnamPro(
          textStyle: TextStyle(color: Color(0xFFEEEEEE),fontSize: 14,fontWeight: FontWeight.w400)),
      headline4:GoogleFonts.beVietnamPro(
        textStyle: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w500),
      ),
    ),
  );

  /// colors for dark mode
  static final darkTheme = ThemeData(
    scrollbarTheme: ScrollbarThemeData().copyWith(
      thumbColor: MaterialStateProperty.all( Color(0xff2a63a1)),
    ),
    textSelectionTheme:TextSelectionThemeData(
      selectionColor: Colors.grey.withOpacity(.2),
    ),
    backgroundColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.black,
    primaryColorLight:Colors.blue,// Sidebar color
    shadowColor: Colors.white70,
    buttonColor: Color(0xff005c4b),
    dialogBackgroundColor:Colors.white,// Date Picker Background
    focusColor: Colors.grey.shade50.withOpacity(.5),
    appBarTheme: AppBarTheme(
        backgroundColor:  Colors.white,// App bar color
        titleTextStyle: TextStyle(
            color: Colors.white
        )
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary:Colors.white,
      //storage.read(AppConstant.fontColorTitleDark)!=null? storage.read(AppConstant.fontColorTitleDark).toString().toColor()
      primary:  Colors.blue,
      onPrimary: Colors.white,
      onSurface: Colors.grey,
      inversePrimary:Colors.blue,
      secondaryContainer: Color(0xff09214b),//Side bar Background
      background: Color(0xffeeeeee),//service part
      surfaceVariant: Color(0xFF5BC0F8),
      surface: Colors.white,// Time Picker
      //storage.read(AppConstant.secondaryDark)!=null? storage.read(AppConstant.secondaryDark).toString().toColor():
    ),
    textTheme:  TextTheme(
      bodyText1: GoogleFonts.beVietnamPro(
        textStyle: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),
      ),//for Hint Text
      bodyText2: GoogleFonts.beVietnamPro(
          textStyle: TextStyle(color: Color(0xFFEEEEEE),fontSize: 15,fontWeight: FontWeight.w400)),
      headline4:GoogleFonts.beVietnamPro(
        textStyle: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400),
      ),
    ),
  );
}
extension ColorExtension on String {
  toColors() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
