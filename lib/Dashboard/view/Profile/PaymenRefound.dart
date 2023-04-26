import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/FontStyle.dart';
import 'package:gym/Widget/BackButtonWidet.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  HomePageController controller=Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    controller.getTransctionNetworkApi();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Image.asset("assets/images/back.png",height: 25.h,width:25.w,color: Colors.grey,),),
          title: Text(
            'Payments',style: smallTextStyle.copyWith(fontSize:20.sp),),
          backgroundColor: Colors.white12,
          elevation: 0,
        ),
      ),
      body: FadeInUp(
        delay: Duration(milliseconds: 450),
        child: SingleChildScrollView(
          child: Obx(()=>controller.transctionModel.value.data!=null
              ?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h,),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text("24 April 2023",style: bodyText4Style.copyWith(color: Colors.blue,
                      fontWeight: FontWeight.bold,fontSize: 19.sp),),
                ),
                ListView.builder(
                    itemCount:controller.transctionModel.value.data!.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                      final data= controller.transctionModel.value.data![index];
                      return Container(
                        height: 70.h,
                        margin: EdgeInsets.all(5),
                        width: Get.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: index == 1 || index == 3 ? Colors.orange : Colors.green,
                                    ),
                                  ),
                                  child: index==1||index== 3? Text("REFERAL",style:smallTextStyle.copyWith(fontSize: 8.sp),)
                                      :Text("BONUS",style: TextStyle(fontSize: 8.sp),),
                                ),
                                SizedBox(width: 8.w,),
                                Container(
                                  width:MediaQuery.of(context).size.width/1.7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      index==1||index==3? Text(data.description.toString(),
                                        style: smallTextStyle.copyWith(fontSize: 14.sp,overflow: TextOverflow.ellipsis),maxLines: 1,
                                      ):Text(data.description.toString(),style: smallTextStyle.copyWith(fontSize: 14.sp,height: 1.2.h),),
                                      index==1||index==3?Text("18:46, 6 february,2022",style: smallTextStyle.copyWith(fontSize: 12.sp,
                                          color:Colors.grey,height:1.2.h,),maxLines: 2,)
                                          :Text("17:10, 6 february,2022",style: smallTextStyle.copyWith(fontSize: 10.sp,color: Colors.grey),)
                                    ],
                                  ),
                                ),
                                Spacer(),
                                index==1||index==3? Text(data.amount.toString(),
                                    style: bodyText4Style):Text(data.amount.toString(),
                                    style: bodyText4Style.copyWith(color: Colors.red)),
                                Container(
                                    padding: EdgeInsets.only(left: 5.w),
                                    height: 50.h,
                                    width: 50.w,
                                    child: Image(image: AssetImage("assets/images/dollor.png")))
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ):Container()
          )
        ),
      )
      // ListView.builder(
      //     itemCount: 10,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         padding: EdgeInsets.symmetric(horizontal: 10),
      //         margin: EdgeInsets.only(bottom: 10),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               'March, 2022',
      //               style: TextStyle(
      //                 fontSize: 18.sp,
      //                 fontWeight: FontWeight.w400,
      //                 color: Colors.blueAccent.shade700,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 8.h,
      //             ),
      //             Row(
      //               children: [
      //                 Container(
      //                   height: 60.h,
      //                   width: 60.h,
      //                   alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                    shape: BoxShape.circle,
      //                     border: Border.all(
      //                       width: 2,
      //                       color: index == 1 || index == 3 ? Colors.orange : Colors.green,
      //                     ),
      //                   ),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text(
      //                         'COIN',
      //                         style: TextStyle(
      //                           color: Colors.black87,
      //                           fontSize: 10.sp,
      //                         ),
      //                       ),
      //                       Text(
      //                         'PURCHASE',
      //                         style: TextStyle(
      //                           color: Colors.black87,
      //                           fontSize: 10.sp,
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 10.w,
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Container(
      //                       width: 250.w,
      //                       child: Stack(
      //                         children: [
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text(
      //                                 'Coin Purchase',
      //                                 style: TextStyle(
      //                                   fontSize: 13.sp,
      //                                   fontWeight: FontWeight.w400,
      //                                   color: Colors.black87,
      //                                 ),
      //                               ),
      //                               SizedBox(
      //                                 height: 2.h,
      //                               ),
      //                               Text(
      //                                 '18:46, 6 March 2022',
      //                                 style: TextStyle(
      //                                   fontSize: 12.sp,
      //                                   fontWeight: FontWeight.w400,
      //                                   color: Colors.grey.shade400,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           Positioned(
      //                             right: 0,
      //                             top: 5,
      //                             child: Row(
      //                               children: [
      //                                 Text(
      //                                   '+1000',
      //                                   style: TextStyle(
      //                                     color: Colors.green.shade800,
      //                                     fontWeight: FontWeight.w600,
      //                                   ),
      //                                 ),
      //                                 SizedBox(
      //                                   width: 8.w,
      //                                 ),
      //                                 Image.asset(
      //                                   'assets/images/dollor.png',
      //                                   height: 30.h,
      //                                 )
      //                               ],
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 2.h,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Text(
      //                           'Purchase status: ',
      //                           style: TextStyle(
      //                             fontSize: 12.sp,
      //                             fontWeight: FontWeight.w400,
      //                             color: Colors.grey.shade400,
      //                           ),
      //                         ),
      //                         Text(
      //                           'Success ',
      //                           style: TextStyle(
      //                             fontSize: 12.sp,
      //                             fontWeight: FontWeight.w400,
      //                             color: Colors.green,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           width: 20.w,
      //                         ),
      //                         Text(
      //                           'CLAME REFUND',
      //                           style: TextStyle(
      //                             fontSize: 12.sp,
      //                             fontWeight: FontWeight.w500,
      //                             color: Colors.blue.shade700,
      //                           ),
      //                         )
      //                       ],
      //                     )
      //                   ],
      //                 )
      //               ],
      //             ),
      //             SizedBox(
      //               height: 8.h,
      //             ),
      //             Row(
      //               children: [
      //                 Container(
      //                   height: 60.h,
      //                   width: 60.w,
      //                   alignment: Alignment.center,
      //                   decoration: BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     border: Border.all(
      //                       width: 2,
      //                       color: index==1 || index ==3 ? Colors.blueAccent : Colors.red.shade700,
      //                     ),
      //                   ),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text(
      //                         'REFUND',
      //                         style: TextStyle(
      //                           color: Colors.black87,
      //                           fontSize: 10.sp,
      //                         ),
      //                       ),
      //                       Text(
      //                         'PURCHASE',
      //                         style: TextStyle(
      //                           color: Colors.black87,
      //                           fontSize: 10.sp,
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: 10.w,
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Container(
      //                       width: 250.w,
      //                       child: Stack(
      //                         children: [
      //                           Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text(
      //                                 'Withdrawal to Bank Transfer',
      //                                 style: TextStyle(
      //                                   fontSize: 13.sp,
      //                                   fontWeight: FontWeight.w400,
      //                                   color: Colors.black87,
      //                                 ),
      //                               ),
      //                               SizedBox(
      //                                 height: 2.h,
      //                               ),
      //                               Text(
      //                                 '17:10, 6 March 2022',
      //                                 style: TextStyle(
      //                                   fontSize: 12.sp,
      //                                   fontWeight: FontWeight.w400,
      //                                   color: Colors.grey.shade400,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           Positioned(
      //                             right: 0,
      //                             top: 0,
      //                             child: Row(
      //                               children: [
      //                                 Text(
      //                                   '-1000',
      //                                   style: TextStyle(
      //                                     color: Colors.green.shade800,
      //                                     fontWeight: FontWeight.w600,
      //                                   ),
      //                                 ),
      //                                 SizedBox(
      //                                   width: 8.w,
      //                                 ),
      //                                 Image.asset(
      //                                   'assets/images/dollor.png',
      //                                   height: 30.h,
      //                                 )
      //                               ],
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                     SizedBox(
      //                       height: 2.h,
      //                     ),
      //                     Row(
      //                       children: [
      //                         Text(
      //                           'Withdrawal status: ',
      //                           style: TextStyle(
      //                             fontSize: 12.sp,
      //                             fontWeight: FontWeight.w400,
      //                             color: Colors.grey.shade400,
      //                           ),
      //                         ),
      //                         Text(
      //                           'Failure ',
      //                           style: TextStyle(
      //                             fontSize: 12.sp,
      //                             fontWeight: FontWeight.w400,
      //                             color: Colors.red.shade700,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           width: 20.w,
      //                         ),
      //                         Text(
      //                           'CLAME REFUND',
      //                           style: TextStyle(
      //                             fontSize: 12.sp,
      //                             fontWeight: FontWeight.w500,
      //                             color: Colors.blue.shade700,
      //                           ),
      //                         )
      //                       ],
      //                     )
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       );
      //     }),
    );
  }
}
