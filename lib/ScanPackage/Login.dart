import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Auth/view/Otp.dart';

import '../../FontStyle.dart';
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  LoginController _controller=Get.put(LoginController());

  final _keyForm=GlobalKey<FormState>();
  late String deviceId;
  late String deviceEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h,),
            FadeInUp(
              delay: const Duration(milliseconds: 450),
              child: Container(
                height: 100.h,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Image.asset("assets/images/Logo.png")),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding:  EdgeInsets.only(left:13.w,bottom: 13.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Sign In",style: bodyText1Style.copyWith(fontSize: 22.sp,)),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text("Enter your mobile number",style: smallTextStyle,),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 18.w),
                    child:

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Expanded(flex:2,
                            child: TextFormField(
                                readOnly: true,
                                initialValue: "+91",
                                decoration:const InputDecoration(

                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                    ),
                                    isDense: true,
                                    fillColor: Colors.white
                                ),
                                style: titleStyle)),
                        SizedBox(width: 8,),
                        Expanded(flex:7,child: Form(
                          key: _keyForm,
                          child: TextFormField(
                              controller: _controller.etMobile,
                              keyboardType: TextInputType.number,

                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                counter: Offstage(),
                                hintText: "0000000000",
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),

                              ),
                              validator: (value){
                                if(value.toString().isEmpty)
                                {
                                  return "Please enter mobile No.";
                                }
                                if(value!.length!=10)
                                {
                                  return "Please enter 10 digits mobile number";
                                }
                              },
                              maxLength: 10,

                              style: titleStyle),
                        )),
                        Expanded(
                          flex: 5,
                          child: InkWell(
                            onTap: (){
                              if(_keyForm.currentState!.validate()){

                                _controller.staffLoginNetworkApi();

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
                                      offset: const Offset(5.0, 5.0,),
                                      blurRadius: 15.0,
                                      spreadRadius: -2.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: const Offset(10.0, 5.0),
                                      blurRadius: 30.0,
                                      spreadRadius: 10.0,
                                    ), //BoxShadow
                                  ],
                                ),
                                child: Icon(Icons.arrow_forward,color: Colors.blue,weight: .1,)),
                          ),)
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30.h,
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
