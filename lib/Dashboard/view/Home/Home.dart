import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/Model/BannerModel.dart';
import 'package:gym/Dashboard/view/Home/Home_offer.dart';
import 'package:gym/Dashboard/view/Home/home_deatails.dart';
import 'package:gym/FontStyle.dart';

import '../../../AppConstant/APIConstant.dart';
import '../../../mathod/AppContest.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  GetStorage _storage=GetStorage();
  PageController _pageController = PageController(
      initialPage: 0
  );
  HomePageController controller=Get.put(HomePageController());
  double currentPage = 0;
  int currentIndex = 0;

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  //   Timer.periodic(Duration(seconds: 5), (Timer timer) {
  //     return setState(() {
  //       if (currentIndex <2){
  //         currentIndex++;
  //       } else{
  //         currentIndex=0;
  //       }
  //       _pageController.animateToPage(currentIndex, duration: Duration(milliseconds: 360), curve: Curves.easeIn);
  //     });
  //   });
  // }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context)
  {
    controller.CategaryId=0;
    // controller.getGymListNetworkApi("","");
    controller.getGymListNetworkApi();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(10.w),
            child: FadeInUp(
              delay: const Duration(milliseconds: 450),
              child: Column(
                children: [
                  FadeInUp(
                    child: Card(
                      elevation:4,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Container(
                          height: 20.h,
                          child: TextFormField(
                            style: smallTextStyle,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(40.r)
                                      ),
                                hintText: "find Intrest",
                                hintStyle: smallTextStyle.copyWith(color: Colors.grey),
                                contentPadding: EdgeInsets.only(top: 10.h,left: 30.w),
                                prefixIcon: Icon(Icons.search,color: Colors.grey,size: 17.sp,)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(()=>controller.bannerModel.value.data!=null?
                    /* Container(
                      height: 180.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r)
                      ),
                      width: MediaQuery.of(context).size.width,
                      child:
                      PageView.builder(
                        controller: _pageController,
                        onPageChanged: onChangedFunction,
                        itemCount:controller.bannerModel.value.data!.length,
                        itemBuilder:
                            (context,index){
                              final datas=controller.bannerModel.value.data![index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: BASE_URL+"/"+datas.image.toString(),
                              height: 76.h,
                              width: 76.w,
                              placeholder: (context, url) =>
                                  Center(child: const CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          );


                        },),
                    )*/
                  Container(
                    height: 170.h,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider.builder(
                        itemCount:controller.bannerModel.value.data!.length,
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                        itemBuilder: (ctx, index, realIdx) {
                          final datas=controller.bannerModel.value.data![index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              height: 180.h,
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: BASE_URL+"/"+datas.image.toString(),
                                height: 76.h,
                                width: 76.w,
                                placeholder: (context, url) =>
                                    Center(child: const CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                          );
                        },
                      )) :Container()
                  ),SizedBox(
                    height: 5.h,
                  ),
                  Obx(()=>controller.categryModel.value.data!=null
                      ?
                   Container(
                      // margin: co3nst EdgeInsets.only(top: 7),
                      width: MediaQuery.of(context).size.width,
                      height:110.h,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:controller.categryModel.value.data!.length,
                          itemBuilder: (ctx, index) {
                            final data=controller.categryModel.value.data![index];
                            print(BASE_URL+"/"+data.image.toString()+"dmfvkv");
                            return Padding(
                              padding:  EdgeInsets.all(8.w),
                              child: InkWell(
                                onTap:(){
                                  // _storage.write(AppConstant.CategoryId,data.id??"");
                                  controller.CategaryId=int.parse(data.id.toString());
                                  print( controller.CategaryId);
                                  // controller.getGymListNetworkApi("","");
                                  controller.getGymListNetworkApi();
                                },
                                child: Container(
                                  height: 70.h,
                                  width: 80.w,
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 1,
                                        shadowColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.r)
                                        ),
                                        child: Container(
                                          height: 50.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                            image: NetworkImage(BASE_URL+"/"+data.image.toString()),fit: BoxFit.fill
                                          )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(left: 4.w),
                                        child: Text(
                                         data.title.toString(),style: smallTextStyle.copyWith(fontSize: 13.sp),maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ):Container()
                  ),

                  Container(
                    height: 60.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeOffer()));

                      },
                      child: Row(
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(8.w),
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:NetworkImage("https://i.gifer.com/ZKZu.gif")
                                )
                              ),
                            ),
                          ),
                          Container(
                            height: 70.h,
                            width: 200.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("50% off upto Rs.300",style: bodyText1Style.copyWith(fontSize: 13.sp),),
                                  SizedBox(height: 3.h,),
                                Text("Use GYMBYMIN AboveRs.2000",style: smallTextStyle.copyWith(fontSize: 11.sp),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                     Obx(()=>controller.gymListModel.value.data!=null
                         ?
                       ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:controller.gymListModel.value.data!.length,
                          itemBuilder: (ctx, index) {
                         final   datas=controller.gymListModel.value.data![index];
                            return Padding(
                              padding:  EdgeInsets.only(left: 8.w,right: 8.w),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                      home_deatails(datas.id.toString())));
                                    controller.gym_id.value=datas.id.toString();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 75.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                      ),
                                      child: Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10.r),
                                              child: Container(
                                                height: 57.h,
                                                width: 57.w,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10.r),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.blue,
                                                      offset: const Offset(
                                                        5.0,
                                                        5.0,
                                                      ),
                                                      blurRadius: 25.0,
                                                      spreadRadius: 2.0,
                                                    ), //BoxShadow
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      offset: const Offset(10.0, 15.0),
                                                      blurRadius: 50.0,
                                                      spreadRadius: 13.0,
                                                    ),
                                                  ]
                                                ),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:BASE_URL+"/"+datas.profile.toString(),
                                                  height: 76.h,
                                                  width: 76.w,
                                                  placeholder: (context, url) =>
                                                      Center(child: const CircularProgressIndicator()),
                                                  errorWidget: (context, url, error) =>
                                                  const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 15.w,bottom: 8.h,top: 4.h),
                                            child: Container(
                                              height: 80.h,
                                              width: 130.w,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment:MainAxisAlignment.start,
                                                children: [
                                                  Text(datas.zymName.toString(),style: bodyText1Style,maxLines: 1,),
                                                  Text("Approx 200 mtr.",style: smallText1Style.copyWith(color: Colors.grey.shade500,fontSize: 12.sp),textAlign: TextAlign.justify,),
                                                  Text(datas.description.toString(),maxLines:2,style:smallTextStyle.copyWith(color: Colors.grey.shade500,fontSize: 12.sp),textAlign: TextAlign.justify,),
                                                ],
                                              ),

                                            ),
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text("luxury",style: bodyText1Style),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 16.h,
                                                    width: 16.w,
                                                    child: Image.asset("assets/images/coin.png"),
                                                  ),
                                                  Text(" 2.23 C/min",style: smallTextStyle),
                                                ],
                                              ),
                                              SizedBox(height: 8.h,),
                                              Container(
                                                height: 27.h,
                                                width: 80.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft:Radius.circular(20.w),
                                                    topLeft:Radius.circular(20.w),
                                                  )
                                                ),
                                                child: Center(child: Text("BOOK",style: TextStyle(color: Colors.white,
                                                    fontSize: 13.sp,fontWeight: FontWeight.bold),)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          }):Container(
                     )
                     ),
                  SizedBox(height: 50.h,)
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
