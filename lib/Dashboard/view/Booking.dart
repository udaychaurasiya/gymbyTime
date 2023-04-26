import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Home/home_deatails.dart';
import 'package:gym/FontStyle.dart';
import 'package:http/http.dart' as http;
import '../../AppConstant/APIConstant.dart';
class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}


class _detailsState extends State<details> {
  HomePageController controller=Get.put(HomePageController());
  var gmail,date,time,bookingId,image;
  @override
  Widget build(BuildContext context) {

    controller.getBookNetworkApi();
    return Scaffold(
      body: FadeInUp(
        delay: const Duration(milliseconds: 450),
        child: SingleChildScrollView(
          child: Obx(()=>controller.booksModel.value.data!=null
              ?
            Column(
              children: [
                ListView.builder(
                itemCount: controller.booksModel.value.data!.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder:
                (context, int index){
                  final datas=controller.booksModel.value.data![index];

                  Uint8List bytes= base64.decode(datas.qrimage.toString());
                  return Padding(
                    padding:  EdgeInsets.only(left: 8.0,right: 8,top: 8.h),
                    child: Card(
                      elevation: .3,
                      shadowColor: Colors.blue,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5.w),
                            height: 85.h,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left:5.w,right: 5.w),
                                  height: 80.h,
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(datas.zymName.toString(),style:bodyText2Style.copyWith(color: Colors.blue) ,),
                                          Spacer(),
                                          Text("Check-In",style: bodyText2Style.copyWith(color: Colors.green)),
                                        ],
                                      ),
                                     SizedBox(height: 6.h,),
                                      Text(datas.date.toString(),style: smallTextStyle.copyWith(fontSize: 12),),
                                      Text(datas.time.toString(),style: smallTextStyle.copyWith(fontSize: 12),),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap:(){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                                  home_deatails(datas.id.toString())));
                                              controller.gym_id.value=datas.id.toString();
                                            },
                                            child: Container(
                                              height: 25.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.only(
                                                    bottomRight:Radius.circular(20),
                                                    topRight:Radius.circular(20),
                                                  )
                                              ),
                                              child: Center(child: Text("ReBook",style:smallTextStyle)),
                                            ),
                                          ),
                                          Spacer(),
                                          Text("BOOKING ID ",style:bodyText2Style.copyWith(fontSize: 12,color: Colors.grey),),
                                          Text(datas.bookingNo.toString(),style:bodyText2Style.copyWith(fontSize: 12))
                                        ],
                                      ),
                                      Row(

                                        children: [


                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: (){
                                    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                                    gmail=datas.zymName.toString();
                                    image=datas.qrimage.toString();
                                    time=datas.addDate.toString();
                                    bookingId=datas.bookingNo.toString();
                                    qrmodelbottom(gmail,date,time,bookingId,image);
                                    print(datas.qrimage.toString().replaceAll(exp, "")+"fiji");
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 55.h,
                                        width: MediaQuery.of(context).size.width/6,
                                        decoration: BoxDecoration(
                                        ),
                                        child: Image.memory(
                                          bytes,
                                          fit: BoxFit.cover,
                                        )
                                      ),
                                    ],
                                  ) ,
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  //   Padding(
                  //   padding: const EdgeInsets.only(left: 10.0,right: 10,top: 10),
                  //   child: Card(
                  //     elevation: 1,
                  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  //     shadowColor: Colors.blue,
                  //     child: Container(
                  //     height: 75.h,
                  //     width: MediaQuery.of(context).size.width,
                  //     decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.blue),
                  //     borderRadius: BorderRadius.circular(10)
                  //     ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                Row(
                  //                  mainAxisAlignment: MainAxisAlignment.start,
                  //                  crossAxisAlignment: CrossAxisAlignment.start,
                  //                  children: [
                  //                    Column(
                  //                      crossAxisAlignment: CrossAxisAlignment.start,
                  //                      mainAxisAlignment: MainAxisAlignment.start,
                  //                      children: [
                  //                        Text("Fitness Pro Gym",style: bodyText1Style,),
                  //                            Text("22 march 2023",style: smallTextStyle.copyWith(fontSize: 10)),
                  //                            Row(
                  //                              children: [
                  //                                Text("06:00 am",style: smallTextStyle.copyWith(fontSize: 10),),
                  //
                  //                              ],
                  //                            ),
                  //                           // Row(
                  //                           //   children: [
                  //                           //     Text("BOOKING ID"),
                  //                           //     Text("98754336864")
                  //                           //   ],
                  //                           // )
                  //                      ],
                  //                    ),
                  //                    SizedBox(width: 70.w,),
                  //                    Text("Check-In",style: bodyText1Style.copyWith(color: Colors.green,),),
                  //                  ],
                  //                ),
                  //
                  //                 Spacer(),
                  //                 Padding(
                  //                   padding: const EdgeInsets.only(left: 8.0,right: 8),
                  //                   child: Container(
                  //                     height: 53.h,
                  //                     width:53.w,
                  //                     child: Image.asset("assets/images/qrcode.png"),
                  //                   ),
                  //                 )
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // );
                 }


                ),
                SizedBox(height: 60.h,)
              ],
            ):Container()
          ),
        ),
      ),
    );
  }

  void qrmodelbottom(gmail,date,time,bookingId,image) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.1),
        isScrollControlled: true,
        backgroundColor: Colors.white70,
        builder: (context,) {
          Uint8List bytes= base64.decode(image.toString());
          print("djkfuygyf  $bytes");
          return
                 SingleChildScrollView(
                child: Padding(padding: EdgeInsets.only(bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom),
                    child: ClipRRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            height: Get.height / 1.7,
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
                                      border: Border.all(
                                          width: 0.5, color: Colors.black12),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                 SizedBox(height: 35.h,),
                                FadeInUp(
                                  delay: Duration(milliseconds: 450),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(gmail,style: smallTextStyle.copyWith(fontSize: 18.sp),),
                                        SizedBox(height: 10.h,),
                                        Text("22 March, 2023",style: smallTextStyle,),
                                        Text("06:00 am",style: smallTextStyle,),
                                        SizedBox(height: 20.h,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Booking ID  ",style: smallTextStyle.copyWith(color: Colors.grey),),
                                            Text(bookingId,style: smallTextStyle,)
                                          ],
                                        ),
                                        SizedBox(height: 30.h,),
                                        Container(
                                          height: 130.h,
                                          width: 130.h,
                                          child: Image.memory(
                                            bytes,
                                            fit: BoxFit.cover,
                                          )
                                        )

                                      ],
                                    ),
                                  ),
                                )
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
