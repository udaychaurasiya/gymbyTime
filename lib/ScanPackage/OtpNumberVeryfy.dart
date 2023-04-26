import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Auth/view/LoginPage.dart';
import 'package:gym/Widget/BackButtonWidet.dart';
import 'package:gym/Widget/ButtonWidget.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../FontStyle.dart';
class OtpNumberVeryfy extends StatelessWidget {
  final String id;
  final String otp;
  OtpNumberVeryfy({Key? key, required this.id, required this.otp,}) : super(key: key);
  LoginController _controller=Get.put(LoginController());
  String etotp="";
  @override
  Widget build(BuildContext context) {
    _controller.startTimer();
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify",style: smallTextStyle.copyWith(fontSize: 23.sp),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Image.asset("assets/images/back.png",height: 25.h,width:25.w,),),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const  SizedBox(height: 40,),
                const  SizedBox(height: 40,),
                Center(child: Text("Enter the verification code we just sent\n you on ${_controller.etMobile.text.toString()}",
                  style: smallTextStyle,)),
                SizedBox(height: 50.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("Code ",style:smallTextStyle.copyWith(fontSize: 18.sp,color: Colors.grey),),
                    ),
                    Container(
                      width: 150.w,
                      height: 40.h,
                      child: OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 30.w,
                        style:TextStyle(
                            fontSize: 17.sp,fontWeight: FontWeight.bold
                        ),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        onCompleted: (pin)
                        {
                           etotp=pin;
                          _controller.staffOtpVerifyNetworkApi(id, pin);
                        },

                      ),
                    ),

                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top:50,right: 15,bottom: 50),
                    width:Get.width,
                    child: Obx(() =>  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_controller.start.value.toString(),style: titleStyle.copyWith(fontSize: 16,color: _controller.start.value!=0? Colors.blue:Colors.grey.withOpacity(0.4)),textAlign: TextAlign.end,),
                        TextButton(child:Text("Resend Code?",style: titleStyle.copyWith(fontSize: 16,decoration: TextDecoration.underline,color: _controller.start.value==0?Colors.blue:Colors.grey.withOpacity(0.4)),textAlign: TextAlign.end,),
                          onPressed:_controller.start.value==0? (){
                            _controller.start.value=120;
                            _controller.startTimer();
                          }:null,
                        ),
                      ],
                    ),
                    )),
                ButtonWidget(onPress: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                  _controller.staffOtpVerifyNetworkApi(id, etotp);
                }, text: 'VERIFY CODE',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
