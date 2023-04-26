import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Auth/view/HomePage.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Home/Home.dart';
import 'package:readmore/readmore.dart';

import '../../../FontStyle.dart';
class HomeOffer extends StatefulWidget {
  const HomeOffer({Key? key}) : super(key: key);

  @override
  State<HomeOffer> createState() => _HomeOfferState();
}

class _HomeOfferState extends State<HomeOffer> {
  HomePageController controller=Get.put(HomePageController());
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOfferNetworkApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white12,
          title: Text("Offers",style: bodyText1Style.copyWith(fontSize: 14.sp),),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Image.asset("assets/images/back.png",height: 25.h,width:25.w,color: Colors.grey,),),
        ),
      ),
      body: Obx(()=>controller.offerModel.value.data!= null
          ?
         SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Great deal you're missing out on!",style:bodyText1Style,),
                ),
                SizedBox(height: 15.h,),
                FadeInUp(
                  delay: const Duration(milliseconds: 450),
                  child: ListView.builder(
                      itemCount:controller.offerModel.value.data!.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context,index){
                        final datas=controller.offerModel.value.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 143.h,
                        width: Get.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 140.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8))
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RotatedBox(
                                    quarterTurns: -1,
                                    child: Text("30% OFF",style:bodyText1Style.copyWith(fontSize: 20.sp,color: Colors.grey) ,),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 140.h,
                             width: Get.width/1.2,
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Text(datas.title.toString(),style: smallTextStyle.copyWith(fontSize: 18.sp),),
                                       Spacer(),
                                       InkWell(
                                           onTap: (){
                                             controller.coupon_id.value=datas.id.toString();
                                             controller.coupon_code.value=datas.couonCode.toString();
                                             Get.back();
                                           },
                                           child: Text("APPLY",style: smallTextStyle,))
                                     ],
                                   ),
                                   SizedBox(height: 9.h,),
                                   Text(datas.description.toString(),style: smallText1Style.copyWith(color: Colors.green),maxLines: 2,),
                                   Divider(),
                                   Column(
                                     children: [
                                       Text(
                                         "Use Code proGym & get 30% off on orders abobe rs.150.Maximum discount rs.75",style: smallTextStyle.copyWith(fontSize: 11.sp,),maxLines: 3,

                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                            ),

                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
        ),
          ):Container()
      ),
    );
  }
}
