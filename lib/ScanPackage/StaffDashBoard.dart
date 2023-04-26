import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../AppConstant/APIConstant.dart';
import '../Auth/controller/login_controller.dart';
import '../Dashboard/Controller/homepage_controller.dart';
import '../Dashboard/view/Profile/profile.dart';
import '../FontStyle.dart';
import '../mathod/AppContest.dart';
import 'StaffProfile.dart';

class StaffDashboard extends StatefulWidget {
  const StaffDashboard({Key? key}) : super(key: key);

  @override
  State<StaffDashboard> createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard>
{
  HomePageController controller=Get.put(HomePageController());
  LoginController controller1=Get.put(LoginController());
  //String _scanBarcode = 'Unknown';

 /* @override
  void initState() {
    super.initState();
  }*/

  /*Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }*/



 /* Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }*/
  String _scanBarcode = '';

  @override
  void initState()
  {
    super.initState();
  }



  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(barcodeScanRes.isNotEmpty)
        {

          String str1 = barcodeScanRes;
          List<String> str2 = str1.split(':');
          String st1 = str2.isNotEmpty ? str2[0] : '';
          String  st3= str2.length > 1 ? str2[1] : '';

          List<String> str4=st3.split(',');
          String bookingId=str4.isNotEmpty ? str4[0] : '';
          if(bookingId.isNotEmpty)
            {
              print("djfh"+bookingId);
             controller.getMyscanDataNetworkApi(bookingId);
            }

        }
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: AppBar(
            // backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: <Color>[Colors.orangeAccent, Colors.greenAccent]),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: FadeInLeftBig(
                delay: const Duration(milliseconds: 450),
                child: InkWell(
                  onTap: ()
                  {
                   Get.to(staffProfile());
                  },
                  child: CircleAvatar(
                      radius: 10.w,
                      backgroundColor: Colors.pink.withOpacity(0.1),
                      backgroundImage: NetworkImage(BASE_URL+"/"+controller.image.toString())),
                ),
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
            body:
            FadeInUp(
              delay: Duration(milliseconds: 450),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 60.h,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          height: 70.h,
                          width: 200.w,
                          child:  Column(
                            children: [
                              Text(" GYM NAME ",style: bodyText1Style.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800
                              ),),
                              SizedBox(height: 10,),
                              Text( GetStorage().read(AppConstant.gym_name).toString()+"",style: bodyText1Style.copyWith(fontSize: 16.sp),),
                            ],
                          )
                        ),
                      ),
                    ),
                    Center(
                      child:
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                        onPressed: ()
                        {
                          scanQR();
                          controller.scanerData.value.data=null;
                          controller.scanerData.refresh();
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.orangeAccent, Colors.greenAccent]),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                            child:  Text('   Scan Barcode  ',style: bodyText4Style, textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                   Obx(() =>controller.scanerData.value.data!=null?

                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Container(
                       height: 250.h,
                       width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(
                           border: Border.all(color: Colors.orange),
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
                                 Text(controller.scanerData.value.data!.userName.toString()),

                               ],
                             ), SizedBox(height: 10,),
                             Row(
                               children:
                               [
                                 Text("Booking No:",style:bodyText1Style ), SizedBox(width: 10,),
                                 Text(controller.scanerData.value.data!.bookingNo.toString()),

                               ],
                             ),

                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Text("Date & Time:",style:bodyText1Style ), SizedBox(width: 10,),
                                 Text(controller.scanerData.value.data!.date.toString() + " "+controller.scanerData.value.data!.time.toString()),


                               ],
                             ),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Text("Age:",style:bodyText1Style ), SizedBox(width: 10,),
                                 Text(controller.scanerData.value.data!.age.toString() ),


                               ],
                             ),
                             SizedBox(height: 10,),
                             Row(
                               children:
                               [
                                 Text("Height:",style:bodyText1Style ), SizedBox(width: 10,),
                                 Text(controller.scanerData.value.data!.height.toString() ),
                               ],
                             ),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Text("Weight:",style:bodyText1Style ), SizedBox(width: 10,),
                                 Text(controller.scanerData.value.data!.weight.toString() ),


                               ],
                             ),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Text("Gender:",style:bodyText1Style ), SizedBox(width: 10,),
                                 Text(controller.scanerData.value.data!.gender.toString()==1?"Male":"Female"),


                               ],
                             ),
                             SizedBox(height: 10,),
                             Row(
                               children: [
                                 Text("Gym Name:",style:bodyText1Style ), SizedBox(width: 10,),
                                 Text(controller.scanerData.value.data!.zymName.toString()),


                               ],
                             ),


                           ],
                         ),
                       ),
                     ),
                   ):Container() ) ,


                  ],
                ),
              ),
            ) ,

    );
  }

  /*Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      //_scanBarcode = barcodeScanRes;
    });
  }*/
}
