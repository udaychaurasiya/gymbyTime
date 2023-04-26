import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/AppConstant/APIConstant.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Auth/view/Splash_Screen.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Profile/PaymenRefound.dart';
import 'package:gym/Dashboard/view/Profile/Profile_Edit.dart';
import 'package:gym/FontStyle.dart';
import 'package:gym/Widget/ButtonWidget.dart';
import 'package:gym/mathod/AppContest.dart';
import 'package:image_picker/image_picker.dart';

import 'ScanHstory.dart';
class staffProfile extends StatefulWidget {
  const staffProfile({Key? key}) : super(key: key);

  @override
  State<staffProfile> createState() => _image_pickerState();
}

class _image_pickerState extends State<staffProfile> {
  @override
  final HomePageController controller=Get.find();
  LoginController logincontroller=Get.put(LoginController());
  File? selectedImage;
  String base64Image = "";
  String gender = "male";
  int male = 0;

  // Future<void> choiceImage(type) async {
  //   var image;
  //   if (type == 'camara') {
  //     image = await ImagePicker()
  //         .pickImage(source: ImageSource.camera);
  //   } else {
  //     image = await ImagePicker()
  //         .pickImage(source: ImageSource.gallery);
  //   }
  //   if (image != null) {
  //     setState(() {
  //       selectedImage = File(image.path);
  //       base64Image = base64Encode(selectedImage!.readAsBytesSync());
  //     });
  //   }
  // }
  List<String> coin= ['100','200','300','400','500','600'
  ];
  List<String> tempArray = [];
  @override
  Widget build(BuildContext context) {

   print("object");
    return Scaffold
      (
        appBar: AppBar(
          elevation: 0,
          title: Text("Profile",style:bodyText4Style.copyWith(fontSize: 22.sp),),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: <Color>[Colors.greenAccent, Colors.orangeAccent]),
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: FadeInUp(
          delay: const Duration(milliseconds: 450),
          child: Padding(
            padding: EdgeInsets.only(left: 22.w,right: 22.w,top: 40.h),
            child: Column(
              children: [
                Container(
                  height: 104.h,
                  width: 104.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 25.0,
                        spreadRadius: -5.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(10.0, 5.0),
                        blurRadius: 50.0,
                        spreadRadius: 13.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Stack(
                    children: [

                      Obx(() =>logincontroller.rxPath.value.isEmpty
                          ?
                      Container(
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                          image:  DecorationImage(
                              image: NetworkImage(BASE_URL+"/"+controller.image),fit: BoxFit.fill
                          ),
                        ),
                        child: Container(

                        ),
                      ): Container(
                        decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(),
                          image:  DecorationImage(
                              image: FileImage(File(logincontroller.rxPath.value)),fit: BoxFit.fill
                          ),
                        ),

                      ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        right: 0,
                        left: 67.w,
                        child: InkWell(onTap: ()
                        {
                          showOptionDailog(context);
                        },child: Container(
                            height: 30.h,
                            width: 40.w,
                            child: Image.asset("assets/images/cam.png",
                              color: Colors.white.withOpacity(.8),)
                        ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 8.h,),
                Text(logincontroller.etName.text,style: bodyText1Style.copyWith(fontSize: 18.sp),),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    IconButton(onPressed: ()
                    {

                    },
                        icon: Image.asset(
                          "assets/images/Group 3082.png", height: 17.h,)),
                    SizedBox(width: 20.w,),
                    TextButton(onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProfileEdit()));
                    },
                        child: Text(
                          "Profile", style: bodyText2Style.copyWith(fontSize: 17.sp),
                        ))
                  ],
                ),
                SizedBox(height: 8.h,),
                Row(
                  children: [
                    IconButton(onPressed: ()
                    {

                    },
                        icon: Image.asset(
                          "assets/images/history.png", height: 17.h,)),
                    SizedBox(width: 20.w,),
                    TextButton(onPressed: ()
                    {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ScanHistory()));
                    },
                        child: Text(
                          "Scan history", style: bodyText2Style.copyWith(fontSize: 17.sp),
                        ))
                  ],
                ),
                SizedBox(height: 8.h,),

                Row(
                  children: [
                    IconButton(onPressed: () {

                    },
                        icon: Image.asset("assets/images/logout.png", height: 20.h,)),
                    SizedBox(width: 20.w,),
                    TextButton(onPressed: (){
                      showAlertBox();
                    },
                        child: Text(
                          "Logout", style: bodyText2Style.copyWith(fontSize: 17.sp),))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  showOptionDailog(BuildContext context)
  {
    return showDialog(context: context, builder: (context) =>
        SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          backgroundColor: Theme
              .of(context)
              .dialogBackgroundColor
              .withOpacity(0.9),
          children: [
            SimpleDialogOption(
              onPressed: () {
                logincontroller.chooseImage(false);
                Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.image,color: Colors.blue,),
                  Text("   Gallery", style:smallTextStyle)
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {  logincontroller.chooseImage(true);

              Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.camera_alt,color: Colors.blue,),
                  Text("   Camera", style:smallTextStyle)
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Get.back(),
              child: Row(
                children: [
                  Icon(Icons.clear,color: Colors.red,),
                  Text("  Cancel", style: smallTextStyle)
                ],
              ),
            ),
          ],
        ));
  }

  void WalletBottom() {
    final double h = MediaQuery
        .of(context)
        .size
        .height;
    final double w = MediaQuery
        .of(context)
        .size
        .width;
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.1),
        isScrollControlled: true,
        backgroundColor: Colors.white70,
        builder: (context) {
          GetStorage _storage=GetStorage();
          return StatefulBuilder(builder: (context,setState){
            return SingleChildScrollView(
              child: Padding(padding: EdgeInsets.only(bottom: MediaQuery
                  .of(context)
                  .viewInsets
                  .bottom),
                  child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          height: Get.height / 1.5,
                          padding: EdgeInsets.all(10),
                          // height: h * 0.45,
                          width: double.infinity,
                          //
                          child: Column(
                            children: [
                              SizedBox(height: 10,),
                              Container(
                                width: 40,
                                height: 6,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5, color: Colors.black12),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Available coins",style: smallText1Style.copyWith(fontSize: 22.sp),),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Container(
                                      height:20.h,
                                      width: 20.h,
                                      child: Image(image: AssetImage("assets/images/coin.png"))),
                                  SizedBox(width: 10.w,),
                                  Text(_storage.read(AppConstant.wallet_amount).toString().trim(),
                                    style: smallText1Style.copyWith(fontSize: 22.sp),)
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 28.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("CHOOSE ONE OF THESE....",style: smallText1Style,),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                // margin: co3nst EdgeInsets.only(top: 7),
                                width: MediaQuery.of(context).size.width,
                                height:110.h,
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount:coin.length,
                                    itemBuilder: (ctx, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap:(){
                                            setState(() {
                                              if(tempArray.contains(coin[index].toString())){
                                                (tempArray.remove(coin[index].toString()));
                                              }else{
                                                (tempArray.add(coin[index].toString()));
                                              }
                                            });
                                          },
                                          child: Container(
                                            height: 50.h,
                                            width: 80.w,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 35.h,
                                                  width: 70.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(4.r),
                                                      border: Border.all(
                                                        color:tempArray.contains(coin[index].toString())
                                                            ? Colors.black :Colors.grey.shade400,
                                                      )
                                                  ),
                                                  child:Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 16.h,
                                                        width: 16.w,
                                                        child: Image.asset(
                                                          "assets/images/coin.png", color: Colors.green,),
                                                      ),
                                                      SizedBox(width: 2.w,),
                                                      Text( coin[index].toString(),style: smallTextStyle.copyWith(fontSize: 17.sp),)
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(height: 30.h,),
                              Center(
                                child: Text("100",style: bodyText1Style.copyWith(fontSize: 30.sp,decoration: TextDecoration.underline),),
                              ),
                              Center(child: Text("1 coin is equal to 1 rupees",
                                style: smallTextStyle.copyWith(color: Colors.red),)),
                              SizedBox(height: 30.h,),
                              Center(child: ButtonWidget(onPress: () {
                                Get.back();
                              }, text: 'Purchase',))
                            ],
                          ),

                        )
                    ),

                  )
              ),
            );
          });
        }
    );
  }

  void showAlertBox()
  {
    Get.defaultDialog(
        title: 'Are you sure !',
        titleStyle: bodyText1Style.copyWith(fontSize: 22.sp,color: Theme.of(context).canvasColor),
        middleText: 'if you want to logout please press Yes otherwise No',middleTextStyle: smallTextStyle,
        backgroundColor: Theme.of(context).backgroundColor,
        radius:5,
        textCancel: 'No',
        textConfirm: 'yes',
        onCancel: (){},
        onConfirm: ()
        {
          controller.logout();
        }
    );
  }
}
