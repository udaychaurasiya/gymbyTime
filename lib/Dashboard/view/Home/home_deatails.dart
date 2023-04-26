import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/AppConstant/APIConstant.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Home/Home_offer.dart';
import 'package:gym/FontStyle.dart';
import 'package:gym/Widget/ButtonWidget.dart';
import 'package:gym/mathod/AppContest.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../Widget/ButtonWidget2.dart';
import 'package:gym/Auth/view/HomePage.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Home/Home_offer.dart';
import 'package:gym/FontStyle.dart';
import 'package:gym/Widget/BackButtonWidet.dart';
import 'package:gym/Widget/ButtonWidget.dart';
import 'package:gym/mathod/AppContest.dart';
import 'package:intl/intl.dart';

import '../../../Widget/ButtonWidget2.dart';
class home_deatails extends StatefulWidget
{  final String id;
const home_deatails(this.id,{Key? key}) : super(key: key);

@override
State<home_deatails> createState() => _home_deatailsState();
}

class _home_deatailsState extends State<home_deatails> {

  late var _razorpay;

  @override
  void initState() {
    // TODO: implement initState
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Done");
    var transection_Id='${response.paymentId}';
    if(response !="PaymentSuccessResponse"){
      controller.getpurchasePointsNetworkApi(transection_Id,"2");

    }else{

    }

    controller.amountController.clear();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
  }
  PageController _pageController = PageController();
  TextEditingController _textDate=TextEditingController();
  TextEditingController _textTime=TextEditingController();
  HomePageController controller=Get.put(HomePageController());
  double currentPage = 0;
  int currentIndex = 0;
  static const _kDuration = const Duration(milliseconds: 360);
  static const _kCurve = Curves.ease;
  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }
  previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context)
  {
    controller.getHomeDetailsNetworkApi(widget.id);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: Image.asset("assets/images/back.png",height: 25.h,width:25.w,color: Colors.grey,),),
        ),
      ),
      floatingActionButton: ButtonWidget2(onPress: () {
        bottomSheetBook();
      }, text: 'Book',

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(()=>controller.homedetailsModel.value.data!= null
          ?
      SingleChildScrollView(
        child: FadeInUp(
          delay: const Duration(milliseconds: 450),
          child: Padding(
            padding:  EdgeInsets.only(left: 18,right: 18),
            child: Column(
              children: [
                Container(
                    height: 170.h,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider.builder(
                      itemCount:controller.homedetailsModel.value.data!.imageList!.length,
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
                        final dataa=controller.homedetailsModel.value.data!.imageList![index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            height: 180.h,
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: BASE_URL+"/"+dataa.image.toString(),
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
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 90.h,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(controller.homedetailsModel.value.data!.zymName.toString(), style:bodyText1Style,),
                          Spacer(),
                          Text("Apporox 200 mtr", style: smallTextStyle.copyWith(fontSize: 13.sp,),)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text("76/334 south Eve Sev Deago",style: smallTextStyle.copyWith(fontSize: 11.sp),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Container(
                            height: 16.h,
                            width: 16.w,
                            child: Image.asset(
                              "assets/images/coin.png", color: Colors.green,),
                          ),
                          Text(
                            "  2.21 C/min", style: smallTextStyle.copyWith(fontSize: 11.sp,color: Colors.blue),)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("Open 6:00 am ",style: smallTextStyle.copyWith(fontSize: 11.sp),),
                          Text(" Close 10:00 pm",style: smallTextStyle.copyWith(fontSize: 11.sp),),

                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 10.h,),
                Row(
                  children: [
                    Text("Amenities",
                      style: smallTextStyle.copyWith(fontSize: 16.sp),),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Container(
                        height: 1.h,
                        width: 80.w,
                        color: Colors.greenAccent,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GridView.count(
                    physics: ScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 3.0,
                    childAspectRatio: 3.4 / 4,
                    shrinkWrap: true,
                    children: List.generate(controller.homedetailsModel.value.data!.amanities.length, (index) {
                      final data2=controller.homedetailsModel.value.data!.amanities[index];
                      var image=BASE_URL+"/"+data2.image.toString();
                      print("jjegdyugfr"+image);
                      return Card(
                        shadowColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 50.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(BASE_URL+"/"+data2.image.toString()),fit:BoxFit.fill
                                  )
                              ),
                            ),
                            SizedBox(height: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data2.title.toString(),style: smallTextStyle.copyWith(),maxLines: 2,),
                              ],
                            )
                          ],

                        ),
                      );
                    },),
                  ),
                ),
                SizedBox(height: 20.h,),],
            ),
          ),
        ),
      ):Container()
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
          GetStorage _storage=GetStorage();
          controller.postcurrentaddressNetworkApi();
          return  SingleChildScrollView(
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
                            SizedBox(height: 10,),
                            Container(
                              width: 40.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5, color: Colors.black12),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(height: 10,),
                            FadeInUp(
                              delay: Duration(milliseconds: 450),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  Text("Gym",style: smallTextStyle,),
                                  Row(
                                    children: [
                                      Text(controller.homedetailsModel.value.data!.zymName.toString(),style: bodyText1Style.copyWith(fontSize:19.sp),),
                                      Spacer(),
                                      Container(
                                          height: 20.h,
                                          width: 20.w,
                                          child:
                                          Image(image: AssetImage("assets/images/coin.png"))),
                                      Text(" 2.00 C/min",style: smallTextStyle.copyWith(fontSize:18.sp)),
                                    ],
                                  ),
                                  SizedBox(height: 20.h,),
                                  Text("Date Time",style: smallText1Style,),
                                  SizedBox(height: 10.h,),
                                  Container(
                                    height:40.h,
                                    width: 300.w,
                                    child: Form(
                                      key: controller.formKey2,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40.h,
                                            width: 140.w,
                                            child:  TextFormField(
                                              controller: _textDate,
                                              decoration: InputDecoration(
                                                enabledBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Color(
                                                      0x4DFFFFFF)),
                                                ),
                                                focusedBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                errorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedErrorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                fillColor: Colors.white,
                                                hintText: "DD/MM/YYYY",
                                                errorStyle: TextStyle(fontSize: 6.sp),
                                                hintStyle: smallText1Style.copyWith(fontSize: 15.sp),
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if(value.toString().isEmpty)
                                                {
                                                  return "Please Enter Date";
                                                }
                                                return null;
                                              },
                                              readOnly: true,
                                              onTap: () async{
                                                final Datet = await
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2050));
                                                if(Datet !=null){
                                                  String formattedDate=
                                                  DateFormat('d MMMM y').format(Datet);
                                                  setState(() {
                                                    _textDate.text=formattedDate;
                                                    controller.date.value=formattedDate;
                                                  });
                                                }
                                              },
                                              style: bodyText1Style.copyWith(fontSize:17.sp ),
                                            ),
                                          ),
                                          Container(
                                            height: 40.h,
                                            width: 140.w,
                                            child: TextFormField(
                                              controller: _textTime,
                                              decoration: InputDecoration(
                                                enabledBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Color(
                                                      0x4DFFFFFF)),
                                                ),
                                                focusedErrorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                errorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                hintText: "00:00",
                                                errorStyle: TextStyle(fontSize: 6.sp),
                                                hintStyle: smallText1Style.copyWith(fontSize:15.sp),
                                                border: OutlineInputBorder(
                                                ),
                                              ),
                                              validator: (value) {
                                                if(value.toString().isEmpty)
                                                {
                                                  return "Please Enter Time";
                                                }
                                                return null;
                                              },
                                              readOnly: true,
                                              onTap: () async{
                                                final time = await
                                                showTimePicker(
                                                    context: context,
                                                    initialTime: TimeOfDay.now()
                                                );
                                                setState(() {
                                                  if(time !=null){
                                                    _textTime.text=time.format(context);
                                                    controller.time.value=time.format(context);
                                                  }
                                                });
                                              },
                                              style:bodyText1Style.copyWith(fontSize:17.sp ) ,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  InkWell( onTap: (){

                                  },
                                    child: Container(
                                      height: 50.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.deepOrange)
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Container(
                                            height: 40.h,
                                            width: 40.w,
                                            child: Image.network("https://i.gifer.com/ZKZu.gif",height: 30,width: 30,) ,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text("Apply Offer",style: smallTextStyle,),
                                          Spacer(),
                                          IconButton(onPressed: (){
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeOffer()));
                                          }, icon: Icon(Icons.arrow_forward_ios_outlined))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.blue),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset("assets/images/wallet.png"),
                                      ),
                                      SizedBox(width: 10.w,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Available coins",style: smallTextStyle.copyWith(fontSize: 15.sp),),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: 18.h,
                                                  width: 18.w,
                                                  child: Image(image: AssetImage("assets/images/coin.png"))),
                                              SizedBox(width: 4.w,),
                                              Obx(()=>
                                                  Text(controller.walletammount.value.toString(),
                                                    style:smallTextStyle.copyWith(fontSize: 15.sp),))
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.h,),
                                  Obx(
                                        ()=> Column(
                                      children: [
                                        int.parse(controller.walletammount.value.toString())<60? Center(
                                            child: Text("need 60 more coins to book your move",
                                              style: smallTextStyle.copyWith(color: Colors.red),)):Text(""),
                                        SizedBox(height: 30.h,),
                                        int.parse(controller.walletammount.value.toString())<60? Center(
                                          child: ButtonWidget(onPress: () {
                                            ShowDailog();
                                          },
                                            text: 'Purchase',),
                                        ):Center(
                                          child: ButtonWidget(onPress: () async {
                                            if(controller.formKey2.currentState!.validate())
                                            {
                                              bool v= await controller.postgymookNetworkApi(context);
                                              if(v==true)
                                              {
                                                fullsecuse();
                                                Timer(Duration(seconds: 1),()
                                                {
                                                });
                                              }
                                            }

                                          },
                                            text: 'Book',),
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ],
                        ),

                      )
                  ),

                )
            ),
          );
/*
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
                            SizedBox(height: 10,),
                            Container(
                              width: 40.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5, color: Colors.black12),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            const SizedBox(height: 10,),
                            FadeInUp(
                              delay: Duration(milliseconds: 450),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                [
                                  Text("Gym",style: smallTextStyle,),
                                Row(
                                  children: [
                                   Text("Fitness Pro Gym",style: bodyText1Style.copyWith(fontSize:19.sp),),
                                   Spacer(),
                                   Container(
                                     height: 20.h,
                                       width: 20.w,
                                       child:
                                       Image(image: AssetImage("assets/images/coin.png"))),
                                   Text(" 2.00 C/min",style: smallTextStyle.copyWith(fontSize:18.sp)),
                                  ],
                                ),
                                  SizedBox(height: 20.h,),
                                  Text("Date Time",style: smallText1Style,),
                                  SizedBox(height: 10.h,),
                                  Container(
                                    height:40.h,
                                    width: 300.w,
                                    child: Form(
                                      key: controller.formKey2,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40.h,
                                            width: 140.w,
                                            child:  TextFormField(
                                              controller: _textDate,
                                              decoration: InputDecoration(
                                                enabledBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Color(
                                                      0x4DFFFFFF)),
                                                ),
                                                focusedBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                errorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedErrorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                fillColor: Colors.white,
                                                hintText: "DD/MM/YYYY",
                                                errorStyle: TextStyle(fontSize: 6.sp),
                                                hintStyle: smallText1Style.copyWith(fontSize: 15.sp),
                                                border: OutlineInputBorder(),
                                              ),
                                              validator: (value) {
                                                if(value.toString().isEmpty)
                                                {
                                                  return "Please Enter Date";
                                                }
                                                return null;
                                              },
                                              readOnly: true,
                                              onTap: () async{
                                                final Datet = await
                                                showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime(2050));
                                                if(Datet !=null){
                                                  String formattedDate=
                                                  DateFormat('d MMMM y').format(Datet);
                                                  setState(() {
                                                    _textDate.text=formattedDate;
                                                    controller.date.value=formattedDate;
                                                  });
                                                }
                                              },
                                              style: bodyText1Style.copyWith(fontSize:17.sp ),
                                            ),
                                          ),
                                          Container(
                                            height: 40.h,
                                            width: 140.w,
                                            child: TextFormField(
                                              controller: _textTime,
                                              decoration: InputDecoration(
                                                enabledBorder: const UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Color(
                                                      0x4DFFFFFF)),
                                                ),
                                                focusedErrorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                errorBorder:const UnderlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                hintText: "00:00",
                                                errorStyle: TextStyle(fontSize: 6.sp),
                                                hintStyle: smallText1Style.copyWith(fontSize:15.sp),
                                                border: OutlineInputBorder(
                                                ),
                                              ),
                                              validator: (value) {
                                                if(value.toString().isEmpty)
                                                {
                                                  return "Please Enter Time";
                                                }
                                                return null;
                                              },
                                              readOnly: true,
                                              onTap: () async{
                                                final time = await
                                                showTimePicker(
                                                    context: context,
                                                    initialTime: TimeOfDay.now()
                                                );
                                                setState(() {
                                                  if(time !=null){
                                                    _textTime.text=time.format(context);
                                                    controller.time.value=time.format(context);
                                                  }
                                                });
                                              },
                                              style:bodyText1Style.copyWith(fontSize:17.sp ) ,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                 SizedBox(
                                   height: 10.h,
                                 ),
                                 InkWell( onTap: (){

                                 },
                                   child: Container(
                                     height: 50.h,
                                     width: MediaQuery.of(context).size.width,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       border: Border.all(color: Colors.deepOrange)
                                     ),
                                     child: Row(
                                       children: [
                                         SizedBox(
                                           width: 10.w,
                                         ),
                                         Container(
                                           height: 40.h,
                                           width: 40.w,
                                           child: Image.network("https://i.gifer.com/ZKZu.gif",height: 30,width: 30,) ,
                                         ),
                                         SizedBox(
                                           width: 10.w,
                                         ),
                                         Text("Apply Offer",style: smallTextStyle,),
                                         Spacer(),
                                         IconButton(onPressed: (){
                                           Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeOffer()));
                                         }, icon: Icon(Icons.arrow_forward_ios_outlined))
                                       ],
                                     ),
                                   ),
                                 ),
                                  SizedBox(height: 20.h,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 50.h,
                                        width: 50.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.blue),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset("assets/images/wallet.png"),
                                      ),
                                      SizedBox(width: 10.w,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("Available coins",style: smallTextStyle.copyWith(fontSize: 15.sp),),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 18.h,
                                                  width: 18.w,
                                                  child: Image(image: AssetImage("assets/images/coin.png"))),
                                              SizedBox(width: 4.w,),
                                              Text(_storage.read(AppConstant.wallet_amount).toString().trim(),style:smallTextStyle.copyWith(fontSize: 15.sp),)
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.h,),
                                  int.parse(_storage.read(AppConstant.wallet_amount).toString().trim())<60? Center(
                                      child: Text("need 60 more coins to book your move",
                                    style: smallTextStyle.copyWith(color: Colors.red),)):Text(""),
                                    SizedBox(height: 30.h,),
                                  int.parse(_storage.read(AppConstant.wallet_amount).toString().trim())<60? Center(
                                    child: ButtonWidget(onPress: () {
                                      controller.getpurchasePointsNetworkApi();
                                      print("hchchghfgf11");
                                    },
                                      text: 'Purchase',),
                                  ):Center(
                                   child: ButtonWidget(onPress: () async {
                                     if(controller.formKey2.currentState!.validate())
                                     {
                                       bool v= await controller.postgymookNetworkApi(context);
                                          if(v==true)
                                            {
                                              fullsecuse();
                                              Timer(Duration(seconds: 1),()
                                              {


                                              });
                                            }



                                     }

                                   },
                                     text: 'Book',),
                                 )
                                ],
                              ),
                            ),
                          ],
                        ),

                      )
                  ),

                )
            ),
          );
*/
        }
    );
  }

  void fullsecuse()
  {
    Timer(Duration(seconds: 2), ()
    {
      Navigator.pop(context);
      ShowModel();

    });
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
                child: FadeInUp(
                  delay: Duration(milliseconds: 250),
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

                  ),
                )
            ),
          );
        }
    );
  }

  void ShowModel()
  {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.black.withOpacity(0.1),
        isScrollControlled: true,
        backgroundColor: Colors.white70,
        builder: (context) {
          Uint8List bytes= base64.decode(controller.gymbookModel.value.data!.qrimage.toString());
          return SingleChildScrollView(
            child: Padding(padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: FadeInUp(
                  delay: Duration(milliseconds: 250),
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
                              Obx(()=>controller.gymbookModel.value.data!=null ?
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    SizedBox(height: 10.h,),
                                    Text(controller.gymbookModel.value.data!.zymName.toString(),style: smallTextStyle.copyWith(fontSize: 20.sp)),
                                    SizedBox(height: 10.h,),
                                    Text(controller.gymbookModel.value.data!.date.toString(),style:smallTextStyle,),
                                    Text(controller.gymbookModel.value.data!.time.toString(),style:smallTextStyle,),
                                    SizedBox(height: 20.h,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("BOOKING ID ",style: smallTextStyle,),
                                        Text(controller.gymbookModel.value.data!.bookingNo.toString(),
                                          style: smallTextStyle,),
                                      ],
                                    ),
                                    SizedBox(height: 10.h,),
                                    Container(
                                        height: 130.h,
                                        width: 130.h,
                                        child: Image.memory(
                                          bytes,
                                          fit: BoxFit.cover,
                                        )
                                    )

                                  ]
                              ):Container()
                              ),
                            ],
                          ),

                        )
                    ),

                  ),
                )
            ),
          );
        }
    );
  }
  void ShowDailog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(10)), //this right here
            child: Container(
              height: 250.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: TextField(
                        style: bodyText1Style.copyWith(fontSize: 30.sp),
                        controller: controller.amountController,
                        keyboardType: TextInputType.number,

                        decoration:
                        InputDecoration(
                          prefixIcon:Container(
                            padding: EdgeInsets.only(top: 8.h),
                            height: 30.h,
                            width: 20.w,
                            child: Text("Rs.",style: bodyText1Style.copyWith(fontSize: 30.sp),),
                          ),
                          hintText: " Enter your Amount",
                          prefixStyle:bodyText1Style.copyWith(fontSize: 30.sp),
                          hintStyle: smallTextStyle.copyWith(fontSize: 18.sp),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(
                                0x4DFFFFFF)),
                          ),
                          focusedBorder:const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          errorBorder:const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder:const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    // CupertinoButton(
                    //     color: Colors.blue,
                    //     child: Text("Pay Amount",style: smallTextStyle.copyWith(fontSize:22.sp,color: Colors.white),),
                    //     onPressed: () {
                    //       var options = {
                    //           'key': "rzp_test_Ujd8385mQjXqFH",
                    //           'amount': (int.parse(amountController.text) * 100)
                    //             .toString(), //So its pay 500
                    //           'name': 'Satya jaisawal',
                    //           'description': 'testing',
                    //           'timeout': 300, // in seconds
                    //           'prefill': {
                    //           'contact': '9876543210',
                    //           'email': 'satyajaisawal@gmail.com'
                    //         }
                    //       };
                    //       _razorpay.open(options);
                    //       Get.back();
                    //     }),
                    ButtonWidget(onPress: ()
                    {
                      var options = {
                        'key': "rzp_test_Ujd8385mQjXqFH",
                        'amount': (int.parse(controller.amountController.text) * 100).toString(), //So its pay 500
                        'name': 'Satya jaisawal',
                        'description': 'testing',
                        'timeout': 300, // in seconds
                        'prefill': {
                          'contact': '9876543210',
                          'email': 'satyajaisawal@gmail.com'
                        }
                      };
                      _razorpay.open(options);
                      Get.back();
                    }, text: "Pay Amount")
                  ],
                ),
              ),
            ),
          );
        });
  }
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
}