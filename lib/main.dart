import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/Auth/view/HomePage.dart';
import 'package:gym/Auth/view/Splash.dart';
import 'package:gym/Auth/view/Splash_Screen.dart';
import 'package:gym/Widget/Dark.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ScanPackage/StaffDashBoard.dart';
import 'Widget/dthemes.dart';
import 'mathod/AppContest.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print("jdshfjdsfjggdjfhg   "+GetStorage().read(AppConstant.stafflogin).toString());
    return ScreenUtilInit(

      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child){
        return  GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayOpacity: 0.1,
          overlayWidget: Center(
            child: Container(
                height: 41,
                width: 41,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 3.5,
                )
            ),
          ),
          child: GetMaterialApp(
            themeMode:ThemeMode.system,
            theme: ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            home: GetStorage().read(AppConstant.stafflogin).toString()=="1"?
            GetStorage().read(AppConstant.userName)!=null?
            GetStorage().read(AppConstant.userName).toString().isNotEmpty?StaffDashboard():
            Splash():Splash():
            GetStorage().read(AppConstant.userName)!=null? GetStorage().
             read(AppConstant.userName).toString().isNotEmpty?bottomNavigation():
            Splash():Splash(),
            debugShowCheckedModeBanner: false,
          ),
        );
      }
    );
  }
}
