import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/AppConstant/APIConstant.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Booking.dart';
import 'package:gym/Dashboard/view/Home/Home.dart';
import 'package:gym/Dashboard/view/Home/home_deatails.dart';
import 'package:gym/Dashboard/view/Profile/profile.dart';
import 'package:gym/Dashboard/view/share.dart';
import 'package:gym/Widget/locationcontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Dashboard/view/Help.dart';
import '../../FontStyle.dart';
import '../../mathod/AppContest.dart';
class bottomNavigation extends StatefulWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  /*void getLocation() async{
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
    controller.longitude.value=position.longitude;
    controller.latitude.value=position.latitude;
   // controller.address.value=position.
  }*/

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong() async {
    Position position = await getLocation();
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);

      controller.longitude.value=position.longitude;
      controller.latitude.value=position.latitude;
      Placemark place = placemarks[0];
      controller.address.value ="${place.subLocality},${place.locality.toString()}";

  }

  DateTime ?currentBackPressTime;
  int _currentIndex=0;
  List employee=[
    home(),
    details(),
    share(),
    music(),
    image_picker(),
  ];
  HomePageController controller=Get.put(HomePageController());
  LoginController _controller=Get.put(LoginController());
  LocationController contrllr=Get.put(LocationController());
  RxBool _isLightTheme = false.obs;

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', _isLightTheme.value);
  }

  _getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    _isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    controller.getCategaryNetworkApi();
    getLocation();
    // controller.getGymListNetworkApi();
    GetAddressFromLatLong();
    return WillPopScope(
      onWillPop: onWillPop,
      child: Stack(
        children: [
          Scaffold(
           // backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: AppBar(
                elevation: 0,
                  backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
                leading: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FadeInLeftBig(
                    delay: const Duration(milliseconds: 450),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          _currentIndex=4;
                        });
                      },
                      child: CircleAvatar(
                        radius: 10.w,
                        backgroundColor: Colors.amber.withOpacity(0.1),
                        //backgroundImage: NetworkImage(BASE_URL+"/"+controller.image.toString())),
                        backgroundImage: NetworkImage(BASE_URL+"/"+GetStorage().read(AppConstant.profileImg).toString())),
                    ),
                  ),
                  ),
                leadingWidth: 45.w,
                title: Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.green,size: 18.sp,),
                    Column(
                      children: [
                        Obx(()=>
                         Text(controller.address.value,style: Theme.of(context).textTheme.bodyText1
                            ,overflow: TextOverflow.ellipsis,maxLines: 1,),
                        ),
                      ],
                    ),

                  ],
                ),
                actions: [
                  FadeInRight(
                    delay: const Duration(milliseconds: 450),
                    child: Container(
                        height: 20.h,
                        width: 20.w,
                        child: Image(image: AssetImage("assets/images/Group 12.png"))),
                  ),
                  ObxValue(
                        (data) => Switch(
                      value: _isLightTheme.value,
                      onChanged: (val) {
                        _isLightTheme.value = val;
                        Get.changeThemeMode(
                          _isLightTheme.value ? ThemeMode.dark : ThemeMode.light,
                        );
                        _saveThemeStatus();
                      },
                    ),
                    false.obs,
                  ),
                ],
                ),
            ),
           /* bottomNavigationBar: Container(
              height: 55.h,
              margin: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: BottomNavigationBar(

                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    mouseCursor: MouseCursor.uncontrolled,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentIndex,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey.withOpacity(.60),
                    selectedFontSize: 14.sp,
                    // type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white54,
                    onTap: (int index) {
                      setState((){
                        _currentIndex=index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset("assets/images/home.png",width: 25.w,)
                      ),
                      BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset("assets/images/book.png",width: 25.w)),
                      BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset("assets/images/share.png",width: 25.w)
                      ),
                      BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset("assets/images/music.png",width: 25.w)
                      ),
                      BottomNavigationBarItem(
                        label: '',
                        icon: Image.asset("assets/images/path.png",width: 25.w)
                      ),
                    ],
                  ),
                ),
              ),
            ),*/
            body: employee[_currentIndex],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50.h,
              margin: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
              child: ClipRRect(
                 borderRadius: BorderRadius.circular(40.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    mouseCursor: MouseCursor.uncontrolled,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _currentIndex,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey,
                    selectedFontSize: 14.sp,
                    // type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white54,
                    onTap: (int index) {
                      setState((){
                        _currentIndex=index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                          label: '',
                          icon: Image.asset("assets/images/home.png",width: 15.w,height: 15.h,)
                      ),
                      BottomNavigationBarItem(
                          label: '',
                          icon: Image.asset("assets/images/book.png",width: 15.w,height: 15.h,)),
                      BottomNavigationBarItem(
                          label: '',
                          icon: Image.asset("assets/images/share.png",width: 15.w,height: 15.h,)
                      ),
                      BottomNavigationBarItem(
                          label: '',
                          icon: Image.asset("assets/images/music.png",width: 15.w,height: 15.h,)
                      ),
                      BottomNavigationBarItem(
                          label: '',
                          icon: Image.asset("assets/images/path.png",width: 15.w,height: 15.h,)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Press again to exit"),
             backgroundColor:Colors.black.withOpacity(.5),
            elevation: 10, //shadow
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 70.h,left: 30.w,right: 30.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
          )
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
