import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/Auth/view/HomePage.dart';
import 'package:gym/Widget/BackButtonWidet.dart';
import 'package:gym/Widget/EditTextWidget.dart';

import '../../../Auth/controller/login_controller.dart';
import '../../../FontStyle.dart';
import '../../../Widget/circlewidget.dart';
import '../../../mathod/AppContest.dart';
import '../../Controller/homepage_controller.dart';
class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  LoginController logincontroller=Get.put(LoginController());
  @override
  HomePageController controller=Get.find();
  String gender = "male";
  int male = 0;
  // HomePageController controller=Get.put(HomePageController());




  @override
  Widget build(BuildContext context)
  {


    logincontroller.setEtDataController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Edit Profile",style: smallTextStyle.copyWith(fontSize: 18.sp),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Image.asset("assets/images/back.png",height: 25.h,width:25.w,),),
      ),
        body: FadeInUp(
          delay: Duration(milliseconds: 450),
          child: SingleChildScrollView(

            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:24.w,right: 24.w,),

                    child:
                       Column(

                        children: [

                          SizedBox(height: 25.h,),
                         Form(
                           key: logincontroller.formKey,
                             child: Column(
                              children: [

                             EditTextWidget(controller: logincontroller.etName,
                               hint: 'Name',
                               validator: (value)
                               {
                                 if(value.toString().isEmpty){
                                   return "Plese Enter Name";
                                 }
                                 return null;
                               },
                             ),
                             SizedBox(height: 15,),
                             EditTextWidget(controller: logincontroller.etEmail,hint: 'Email',
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

                             SizedBox(height: 15,),
                             EditTextWidget(controller:logincontroller.etAge,hint: 'Age',
                               validator: (value){
                                 if(value.toString().isEmpty){
                                   return "Please Enter Age";
                                 }
                                 return null;
                               },
                               type: TextInputType.text,

                               length: 10,
                             ),
                             SizedBox(height:8.h,),
                             EditTextWidget(controller: logincontroller.etWiegth,hint: 'Wieght',
                               validator: (value){
                                 if(value.toString().isEmpty){
                                   return "Please Enter Wieght";
                                 }
                                 return null;
                               },
                               type: TextInputType.text,
                             ),
                             SizedBox(height: 8.h,),
                             EditTextWidget(controller: logincontroller.etHeight,hint: 'Height',
                               validator:  (value)
                               {
                                 if(value.toString().isEmpty)
                                 {
                                   return "Please Enter Height";
                                 }
                                 return null;
                               },
                               type: TextInputType.text,
                             ),
                           ],
                         )),

                          SizedBox(height: 35.h,),

                          Row(
                            children: [
                              Radio(
                                key: logincontroller.formKey,
                                  value: 1,
                                  groupValue: male,
                                  activeColor: Colors.blue,
                                  onChanged: (value) {
                                    setState(() {
                                      male = value!;
                                      gender="Female";
                                    });
                                  }
                              ),
                              Text("Male",style: bodyText2Style.copyWith(color: Colors.grey),),
                              Radio(
                                  value: 2,
                                  groupValue: male,
                                  activeColor: Colors.blue,
                                  onChanged: (value)
                                  {
                                    setState(() {
                                      male = value!;
                                      gender="Female";
                                    });
                                  }
                              ),
                              Text("Female",style: bodyText2Style.copyWith(color: Colors.grey),),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child:
                                CButton(onPress: () {
                                  if(GetStorage().read(AppConstant.stafflogin).toString()=="1")
                                  {
                                    logincontroller. UpdateProfilStaffNetworkApi(male);
                                    print("staff1");
                                  }
                                  else
                                  {
                                    logincontroller.UpdateProfileNetworkApi(male);
                                    print("user2");
                                  }
                                },),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                ]
            ),
          ),
        )
    );
  }

  void EditBottomChanged() {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.1),
        isScrollControlled: true,
        backgroundColor: Colors.white70,
        builder: (context) {
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
                             Container(
                               height: 300.h,
                               width: 300.w,
                               child: Image.asset("assets/images/check2.gif"),
                             ),
                            Text("your Profile has been change!",style: smallText1Style.copyWith(fontSize: 19.sp),)
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
