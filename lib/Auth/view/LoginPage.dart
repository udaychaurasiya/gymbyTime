import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/AppConstant/APIConstant.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Auth/view/HomePage.dart';
import 'package:gym/Widget/BackButtonWidet.dart';
import 'package:gym/Widget/EditTextWidget.dart';

import '../../Dashboard/view/Home/Home.dart';
import '../../FontStyle.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _controller=Get.find();
  String gender = "male";
  int male=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create an Acount",style: bodyText1Style.copyWith(fontSize: 23.sp),),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Image.asset("assets/images/back.png",height: 25.h,width:25.w,),),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding:  EdgeInsets.only(left:28.w,right: 28),
            child: Form(
              key: _controller.formKey,
              child: Column(
              children: [
                SizedBox(height: 25.h,),
                EditTextWidget(
                  controller:_controller.etName,hint: 'Name',
                  validator: (value){
                  if(value.toString().isEmpty)
                  {
                    return "Please Enter Name";
                  }
                  return null;
                  },

                ),
                EditTextWidget( controller: _controller.etEmail,hint: 'Email',
                  validator: (value){
                    if(value.toString().isEmpty)
                    {
                      return "Please Enter Email";
                    }
                    if(!GetUtils.isEmail(value))
                    {
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                  type: TextInputType.emailAddress,
                ),

                EditTextWidget(
                  controller: _controller.etAge,hint: 'Age',
                  validator: (value){
                  if(value.toString().isEmpty)
                    {
                      return "Please Enter Age";
                    }
                  return null;
                  },
                  type: TextInputType.number,
                  length:3,
                ),
                EditTextWidget(hint: 'Wieght',
                  controller: _controller.etWiegth,
                  validator: (value){
                  if(value.toString().isEmpty)
                    {
                      return "Please Enter Wiegth";
                    }
                  return null;
                  },
                  type: TextInputType.number,
                  length: 4,
                ),
                EditTextWidget(
                  hint: 'Height',
                  controller: _controller.etHeight,
                  validator: (value) {
                  if(value.toString().isEmpty)
                  {
                    return "Please Enter Height";
                  }
                  return null;
                  },
                  type: TextInputType.number,
                  length: 4,
                ),
                SizedBox(height: 35.h,),
                Row(
                  children: [
                    Radio(

                        value: 1,
                        groupValue: male,
                        activeColor:Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            male = value!;
                            _controller.gender.value=male.toString();
                            gender="Male";
                          });
                        }
                    ),
                    Text("Male",style: smallTextStyle.copyWith(fontSize: 12.sp),),
                    Radio(
                        value: 2,
                        groupValue: male,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            male = value!;
                            print("fjif $male");
                            _controller.gender.value=male.toString();
                            gender="Female";
                          });
                        }
                    ),
                    Text("Female",style: smallTextStyle.copyWith(fontSize: 12.sp),),
                  ],
                ),
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 18.w),
                      child: InkWell(
                        onTap: (){
                          if(_controller.formKey.currentState!.validate())
                          {
                            _controller.signUpNetworkApi();
                          }


                        },
                        child: Container(
                            height: 38.h,
                            width: 38.h,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey,width: .5),
                              shape: BoxShape.circle,
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
                                  spreadRadius: 13.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Icon(Icons.arrow_forward,color: Colors.blue,weight: .1,)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35,),
                Column(
                  children: [
                    Text("By Singing in or creating an account you agree with our",
                      style: smallTextStyle.copyWith(fontSize: 11.sp)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       InkWell(
                           onTap:(){
                             TermAndCondition();
                             },
                           child: Text("Term And condition",style: smallTextStyle.copyWith(fontSize:11,
                               color: Colors.blue,decoration: TextDecoration.underline),)),
                        Text(" and ",style: smallTextStyle.copyWith(fontSize: 11)),
                        InkWell(
                            onTap: (){
                              PrivacyAndPolicyshowmodel();
                            },
                            child: Text("Privacy nad policy",style:smallTextStyle.copyWith(fontSize: 11,
                                color: Colors.blue,decoration: TextDecoration.underline) ,))
                      ],
                    )
                  ],
                )
              ],
        ),
            ),
          ),
    ]
    ),
      )
    );
  }

    void PrivacyAndPolicyshowmodel() {
      showModalBottomSheet(
          context: context,
          barrierColor: Colors.black.withOpacity(0.1),
          isScrollControlled: true,
          backgroundColor: Colors.white70,
          builder: (context) {
            RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
            // var description=data.description.toString().replaceAll(exp, "");
            _controller.getPrivacyNetworkApi();
            return
              FadeInUp(
                delay: Duration(seconds: 1),
                child: Obx(()=>_controller.privacyModel.value.data!=null
                    ?
                  SingleChildScrollView(
                    child: ClipRRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 10),
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
                                SizedBox(height: 30.h,),
                                Text(_controller.privacyModel.value.data!.title.toString(),
                                  style: smallTextStyle.copyWith(fontSize: 22.sp),),
                                Obx(()=>_controller.privacyModel.value.data!.image!=""
                                    ?
                                   Container(
                                    height: 100.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl:BASE_URL+"/"+_controller.privacyModel.value.data!.image.toString(),
                                      height: 76.h,
                                      width: 76.w,
                                      placeholder: (context, url) =>
                                          Center(child: const CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                    ),
                                  ):Container()
                                ),

                                Html(data:_controller.privacyModel.value.data!.description.toString(),
                                  style:{
                                  "body":Style(textAlign: TextAlign.justify)
                                  }),
                                  // style: smallTextStyle,textAlign: TextAlign.justify,
                              ],
                            ),
                          )
                      ),

                    ),
            ):Container()
                ),
              );
          }
      );
    }

  void TermAndCondition() {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.1),
        isScrollControlled: true,
        backgroundColor: Colors.white70,
        builder: (context) {
          RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
          // var description=data.description.toString().replaceAll(exp, "");
          _controller.getTermConditionNetworkApi();
          return
            FadeInUp(
              delay: Duration(seconds: 1),
              child: Obx(()=>_controller.termConditionModel.value.data!=null
                  ?
                 SingleChildScrollView(
                  child: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                        child: Container(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
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
                              SizedBox(height: 30.h,),
                              Text(_controller.termConditionModel.value.data!.title.toString(),
                                style: smallTextStyle.copyWith(fontSize: 22.sp),),
                              Obx(()=>_controller.termConditionModel.value.data!.image!=""
                                  ?
                              Container(
                                height: 100.h,
                                width: MediaQuery.of(context).size.width,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl:BASE_URL+"/"+_controller.termConditionModel.value.data!.image.toString(),
                                  height: 76.h,
                                  width: 76.w,
                                  placeholder: (context, url) =>
                                      Center(child: const CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ):Container()
                              ),

                              Html(data:_controller.termConditionModel.value.data!.description.toString(),
                                  style:{
                                    "body":Style(textAlign: TextAlign.justify)
                                  }),
                              // style: smallTextStyle,textAlign: TextAlign.justify,
                            ],
                          ),
                        )
                    ),

                  ),
                ):Container()
              ),
            );
        }
    );
  }
}
