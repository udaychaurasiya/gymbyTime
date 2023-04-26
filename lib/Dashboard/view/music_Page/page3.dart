import 'dart:async';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Home/Home.dart';
import 'package:gym/Dashboard/view/Home/home_deatails.dart';
import 'package:gym/Dashboard/view/share.dart';
import 'package:gym/FontStyle.dart';
import 'package:gym/Widget/EditTextWidget.dart';

import '../../../Auth/view/HomePage.dart';
class page3 extends StatefulWidget {
  const page3({Key? key}) : super(key: key);

  @override
  State<page3> createState() => _page3State();
}

class _page3State extends State<page3> {
  TextEditingController etmessage = TextEditingController();
  TextEditingController etsubject = TextEditingController();
  HomePageController controller=Get.put(HomePageController());
  LoginController _controller=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        delay: Duration(milliseconds: 450),
        child: SingleChildScrollView(
          child: Form(
            key: _controller.formKey2,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 18.w,right: 18.w,top: 30.h),
                  child: TextFormField(
                    keyboardType:
                    TextInputType.multiline,
                    controller: etsubject,
                    style: smallTextStyle,
                    decoration: InputDecoration(
                    alignLabelWithHint: true,
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color:Colors.blue.shade50
                        )
                    ),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color:Colors.blue
                        )
                    ),
                    errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color:Colors.blue
                        )
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            width: .5,color:Colors.blue
                        )
                    ),

                    labelText: "Write Here.....",
                    labelStyle: smallTextStyle.copyWith(color: Colors.grey),
                  ),
                    validator: (value){
                      if(value.toString().isEmpty)
                      {
                        return "Please Enter subject";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 40.h,),
                Padding(
                padding: EdgeInsets.only(left: 18.w, right: 18.w),
                  child: TextFormField(
                    maxLines: 5,
                    controller: etmessage,
                    keyboardType:
                    TextInputType.multiline,
                    style: smallTextStyle,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color:Colors.blue.shade50
                          )
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color:Colors.blue
                          )
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color:Colors.blue
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                              width: 1,color:Colors.blue
                          )
                      ),

                      labelText: "Write Here.....",
                      labelStyle: smallTextStyle.copyWith(color: Colors.grey),
                    ),
                    validator: (value){
                      if(value.toString().isEmpty)
                      {
                        return "Please Enter Discraption";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 50.h,),
                InkWell(
                  onTap: (){
                    if(_controller.formKey2.currentState!.validate()){
                      controller.postRaiseTicketNetworkApi(etmessage.text,etsubject.text);
                      _controller.formKey2=GlobalKey<FormState>();
                      etsubject.clear();
                      etmessage.clear();
                      bottomSheetBook();
                      Timer(Duration(seconds: 2), () {
                        // 5 seconds over, navigate to Page2.
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => bottomNavigation()));
                        Get.offAll(()=>bottomNavigation());
                      });
                    }
                  },
                  child: Container(
                    height: 38.h,
                    width:120.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: .5),
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 15.0,
                          spreadRadius: -2.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(10.0, 5.0),
                          blurRadius: 30.0,
                          spreadRadius: 13.0,
                        ), //BoxShadow
                      ],
                    ),
                    child:Center(child: Text("SEND".toUpperCase(),style: smallTextStyle.copyWith(color: Colors.blue),
                    )),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void bottomSheetBook()
  {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.1),
        isScrollControlled: true,
        backgroundColor: Colors.white70,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        height: Get.height/1.5,

                        padding: EdgeInsets.all(10),
                        // height: h * 0.45,
                        width: double.infinity,
                        //
                        child: Column(
                          children: [
                            SizedBox(height: 10.h,),
                            Container(
                              width: 40.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5, color: Colors.black12),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                              Container(
                                  height: 400.h,
                                  width: 400.w,
                                  child: Image(image:AssetImage("assets/images/check2.gif"))),
                              ]
                            ),
                          ],
                        ),

                      )
                  ),

                )
            ),
          );
        }
    );
  }
}
