import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/AppConstant/APIConstant.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:gym/Dashboard/view/Profile/PaymenRefound.dart';
import 'package:gym/Dashboard/view/Profile/Profile_Edit.dart';
import 'package:gym/FontStyle.dart';
import 'package:gym/Widget/ButtonWidget.dart';
import 'package:gym/Widget/dthemes.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
class image_picker extends StatefulWidget {
  const image_picker({Key? key}) : super(key: key);

  @override
  State<image_picker> createState() => _image_pickerState();
}

class _image_pickerState extends State<image_picker> {
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
  @override
  final HomePageController controller=Get.find();
  LoginController logincontroller=Get.put(LoginController());
  File? selectedImage;
  String base64Image = "";
  String gender = "male";
  int male = 0;

  // Future<void> choiceImage(type) async {
  //   var image;
  //   if (type == 'camara') {
  //     image = await ImagePicker()
  //         .pickImage(source: ImageSource.camera);
  //   } else {
  //     image = await ImagePicker()
  //         .pickImage(source: ImageSource.gallery);
  //   }
  //   if (image != null) {
  //     setState(() {
  //       selectedImage = File(image.path);
  //       base64Image = base64Encode(selectedImage!.readAsBytesSync());
  //     });
  //   }
  // }
  List<String> coin= ['100','200','300','400','500','600'
  ];
  List<String> tempArray = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FadeInUp(
          delay: const Duration(milliseconds: 450),
          child: Padding(
            padding: EdgeInsets.only(left: 22.w,right: 22.w),
            child: Column(
              children: [
                // Center(
                //   child: Stack(
                //     alignment: Alignment.bottomCenter,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           Container(
                //             width: 120.w,
                //             height: 120.w,
                //             decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               image: DecorationImage(
                //                 image: AssetImage('assets/images/pp1.png'),
                //                 fit: BoxFit.fill,
                //               ),
                //             ),
                //             margin: EdgeInsets.symmetric(horizontal: 8.0),
                //           ),
                //         ],
                //       ),
                //       Positioned(
                //           right: 13.h,
                //           top:70.w,
                //           child: Container(
                //             height: 30.h,
                //             width: 30.w,
                //             child: IconButton(
                //               onPressed: () {
                //
                //               },
                //               icon: Image.asset("assets/images/Subtraction 1.png",),
                //             ),
                //           )
                //       ),
                //       SizedBox(height: 25.h,),
                //       SizedBox(height: 25.h,),
                //       Text("Rebecca Jaaz",
                //           style: bodyText2Style.copyWith(fontSize: 17.sp))
                //     ],
                //   ),
                //
                // ),

              Container(
              height: 104.h,
              width: 104.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
                image: DecorationImage(
                  image: AssetImage("assets/images/pro.jpg")
                ),
                boxShadow: [
                  BoxShadow(
                    color:ThemeClass.darkTheme.shadowColor,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 25.0,
                    spreadRadius: -5.0,
                  ), //BoxShadow
                  BoxShadow(
                    color:ThemeClass.darkTheme.shadowColor,
                    offset: const Offset(10.0, 5.0),
                    blurRadius: 50.0,
                    spreadRadius: 13.0,
                  ), //BoxShadow
                ],
              ),
              child: Stack(
                children: [

                  Obx(() =>logincontroller.rxPath.value.isEmpty
                      ?
                  Container(
                    decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      image:  DecorationImage(
                          image: NetworkImage(BASE_URL+"/"+controller.image),fit: BoxFit.fill
                      ),
                    ),
                    child: Container(

                    ),
                  ): Container(
                    decoration:  BoxDecoration(
                     shape: BoxShape.circle,
                      border: Border.all(),
                      image:  DecorationImage(
                          image: FileImage(File(logincontroller.rxPath.value)),fit: BoxFit.fill
                      ),
                    ),

                  ),
                  ),
                  Positioned(
                      bottom: 10.h,
                      right: 0,
                      left: 67.w,
                      child: InkWell(onTap: (){
                        showOptionDailog(context);
                      },child: Container(
                          height: 30.h,
                          width: 40.w,
                          child: Image.asset("assets/images/cam.png",
                            color: Colors.grey.withOpacity(.8),)),),),

                ],
              ),
            ),
                SizedBox(height: 8.h,),
                Text(logincontroller.etName.text,style: bodyText1Style.copyWith(fontSize: 18.sp),),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Image.asset(
                          "assets/images/Group 3082.png", height: 17.h,)),
                    SizedBox(width: 20.w,),
                    TextButton(onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProfileEdit()));
                    },
                        child: Text(
                          "Profile", style: bodyText2Style.copyWith(fontSize: 17.sp),
                        ))
                  ],
                ),
                SizedBox(height: 8.h,),
                Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Image.asset(
                          "assets/images/wallet-line.png", height: 15.h,)),
                    SizedBox(width: 20.w,),
                    TextButton(onPressed: () {
                      WalletBottom();
                    },
                        child: Text(
                          "Wallet", style: bodyText2Style.copyWith(fontSize: 17.sp),))
                  ],
                ),
                SizedBox(height: 8.h,),
                Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Image.asset(
                          "assets/images/arrow-loop.png", height:15.h,)),
                    SizedBox(width: 20.w,),
                    TextButton(onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PaymentMethod()));
                    },
                        child: Text("Payment & Refund",
                          style: bodyText2Style.copyWith(fontSize: 17.sp),))
                  ],
                ),
                SizedBox(height: 100.h,),
                Row(
                  children: [
                    IconButton(onPressed: () {

                    },
                        icon: Image.asset("assets/images/logout.png", height: 20.h,)),
                    SizedBox(width: 20.w,),
                    TextButton(onPressed: (){
                      showAlertBox();
                         },
                        child: Text(
                          "Logout", style: bodyText2Style.copyWith(fontSize: 17.sp),))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  showOptionDailog(BuildContext context) {
    return showDialog(context: context, builder: (context) =>
        SimpleDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          backgroundColor: Theme
              .of(context)
              .dialogBackgroundColor
              .withOpacity(0.9),
          children: [
            SimpleDialogOption(
              onPressed: () {
                logincontroller.chooseImage(false);
                Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.image,color: Colors.blue,),
                  Text("   Gallery", style:smallTextStyle)
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {  logincontroller.chooseImage(true);

              Get.back();
              },
              child: Row(
                children: [
                  Icon(Icons.camera_alt,color: Colors.blue,),
                  Text("   Camera", style:smallTextStyle)
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Get.back(),
              child: Row(
                children: [
                  Icon(Icons.clear,color: Colors.red,),
                  Text("  Cancel", style: smallTextStyle)
                ],
              ),
            ),
          ],
        ));
  }
  int SelectCoin=0;
  void WalletBottom() {
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
         return StatefulBuilder(builder: (context,setState){
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
                             const SizedBox(height: 10,),
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text("Available coins",style: smallText1Style.copyWith(fontSize: 22.sp),),
                                 SizedBox(
                                   width: 40.w,
                                 ),
                                 Container(
                                     height:20.h,
                                     width: 20.h,
                                     child: Image(image: AssetImage("assets/images/coin.png"))),
                                 SizedBox(width: 10.w,),
                           Obx(()=> Text(controller.walletammount.value.toString(),style:smallTextStyle.copyWith(fontSize: 15.sp),))
                               ],
                             ),
                             Padding(
                               padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 28.h),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text("CHOOSE ONE OF THESE....",style: smallText1Style,),
                                 ],
                               ),
                             ),
                             SizedBox(height: 10.h,),
                             Container(
                               // margin: co3nst EdgeInsets.only(top: 7),
                               width: MediaQuery.of(context).size.width,
                               height:35.h,
                               child: ListView.builder(
                                   physics: const BouncingScrollPhysics(),
                                   scrollDirection: Axis.horizontal,
                                   itemCount: coin.length,
                                   itemBuilder: (context, index) {
                                     return GestureDetector(
                                       onTap: () {
                                         setState(() {
                                           SelectCoin = index;
                                           controller.ArrayCoin.value=coin[index].toString();
                                           controller.amountController.text=coin[index].toString();
                                         });
                                       },
                                       child: Container(
                                         width: 70.w,
                                         height: 20.w,
                                         margin: EdgeInsets.only(left: 10),
                                         decoration: BoxDecoration(
                                           border: Border.all(
                                               color: SelectCoin == index
                                                   ? Colors.black
                                                   : Colors.grey.shade400,
                                               width: Colors.blue == index ? 1 : 1),
                                           borderRadius: BorderRadius.circular(3),
                                         ),
                                         child: Center(
                                          child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Container(
                                               height: 20.h,
                                               width: 20.w,
                                             child: Image(image: AssetImage("assets/images/coin.png"))),
                                             SizedBox(width: 5.w,),
                                             Text(coin[index].toString(),style: smallTextStyle,),
                                           ],
                                         )),
                                       ),
                                     );
                                   }),
                             ),
                             SizedBox(height: 30.h,),
                             Obx(
                               ()=> Center(
                                 child: Text( controller.ArrayCoin.value,style: bodyText1Style.copyWith(fontSize: 30.sp,
                                     decoration: TextDecoration.underline),),
                               ),
                             ),
                             Center(child: Text("1 coin is equal to 1 rupees",
                               style: smallTextStyle.copyWith(color: Colors.red),)),
                             SizedBox(height: 30.h,),
                             Center(child: ButtonWidget(onPress: () {
                               PurceshPointModel();
                             }, text: 'Purchase',))
                           ],
                         ),

                       )
                   ),
                 )
             ),
           );
         });
        }
    );
  }

  void showAlertBox()
  {
    Get.defaultDialog(
        title: 'Are you sure !',
        titleStyle: bodyText1Style.copyWith(fontSize: 22.sp),
        middleText: 'if you want to logout please press Yes otherwise No',middleTextStyle: smallTextStyle,
        backgroundColor: Colors.white,
        radius:5,
        textCancel: 'No',
        textConfirm: 'yes',
        onCancel: (){},
        onConfirm: ()
        {
          controller.logout();
        }
    );
  }

  void PurceshPointModel()  {
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
