
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../AppConstant/APIConstant.dart';
import '../Dashboard/Controller/homepage_controller.dart';
import '../FontStyle.dart';
import '../mathod/AppContest.dart';

class ScanHistory extends StatelessWidget {
   ScanHistory({Key? key}) : super(key: key);
  HomePageController controller=Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    controller. getMyscanListNetworkApi();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          elevation: 0,
          flexibleSpace:  Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: <Color>[Colors.orangeAccent, Colors.greenAccent]),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: IconButton(
              onPressed: (){
                Get.back();
              },icon: Image.asset("assets/images/back.png"),
            ),
          ),
          leadingWidth: 45.w,
          title: Row(
            children: [

              Column(
                children: [
                  Text(GetStorage().read(AppConstant.userName).toString(),style: smallTextStyle.copyWith(fontSize: 18.sp)
                    ,overflow: TextOverflow.ellipsis,maxLines: 1,),
                ],
              )
            ],
          ),
          actions:
          [
            /* FadeInRight(
                delay: const Duration(milliseconds: 450),
                child: Container(
                    height: 20.h,
                    width: 20.w,
                    child: Image(image: AssetImage("assets/images/Group 12.png"))),),*/
            SizedBox(width: 30.w,)
          ],
        ),
      ),
      body: FadeInUpBig(
        delay: Duration(milliseconds: 450),
        child: Container
              (
              child: Obx(() => controller.scanerModelData.value.data!=null?
              ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:controller.scanerModelData.value.data!.length,
                  itemBuilder: (ctx, index)
                  {final data=controller.scanerModelData.value.data![index];

                    return
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10,top:5),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          elevation: 1,
                          shadowColor: Colors.orange,
                          child: Container(
                            height: 140.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange,width: 2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("Name:",style:bodyText1Style ), SizedBox(width: 10,),
                                      Text(data.username.toString()),

                                    ],
                                  ), SizedBox(height: 10,),
                                  Row(
                                    children:
                                    [
                                      Text("Booking No: ",style:bodyText1Style ), SizedBox(width: 10,),
                                      Text(data.bookingNo.toString()),

                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Text("Date & Time:",style:bodyText1Style ), SizedBox(width: 10,),
                                      Text(data.date.toString() ),


                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                      Text("Checked In :",style:bodyText1Style ), SizedBox(width: 10,),
                                      Text(data.checkInByName.toString()),


                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children:
                                    [
                                      Text("Checked Out:",style:bodyText1Style, ), SizedBox(width: 10,),
                                      Text(data.checkOutByName.toString() ),


                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                  })
                  :
              Container()),
               ),
      ),
    );
  }
}
