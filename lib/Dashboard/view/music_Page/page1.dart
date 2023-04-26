import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../FontStyle.dart';
class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);
  @override
  State<page1> createState() => _page1State();
}
class _page1State extends State<page1> {
  HomePageController controller=Get.put(HomePageController());
  _launchURLApp() async {
    const url = 'https://animationmedia.org/gymnew/admin';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  _twitterURLApp() async {
    const url = 'https://animationmedia.org/gymnew/admin';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  _FaceBookURLApp() async {
    const url = 'https://animationmedia.org/gymnew/admin';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    controller.getContectNetworkApi();
    return Scaffold(
      body:Obx(()=>controller.contectModel.value.data!=null ?
         FadeInUp(
           delay: Duration(milliseconds: 450),
           child: SingleChildScrollView(
             child: Padding(
              padding:  EdgeInsets.only(left: 8.w,right: 8.w,top: 13.h),
              child: Column(
                children: [
                  SizedBox(height: 40.h,),
                  Text(controller.contectModel.value.data!.shortDescription.toString(),style: smallTextStyle,textAlign: TextAlign.justify,),
                  SizedBox(height: 30.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(Icons.location_on,color: Color(0xF506A895),),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(controller.contectModel.value.data!.title.toString(),style:bodyText1Style.copyWith(fontSize: 18.sp) ,),
                            SizedBox(height:
                              5.h,),
                            Text(controller.contectModel.value.data!.address.toString(),style: smallTextStyle.copyWith(fontSize: 15.sp),)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:20.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(Icons.email,color: Color(0xF506A895)),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(controller.contectModel.value.data!.email.toString(),style:smallTextStyle,),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Icon(Icons.phone,color: Color(0xF506A895),),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(controller.contectModel.value.data!.mobile.toString(),style:smallTextStyle,),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(34.0),
                    child: Row(
                      children: [
                        IconButton(onPressed: _launchURLApp,
                            icon: Image.asset("assets/images/circleinstagram.png",height: 30.h,width: 30.w,color: Colors.pink,)),
                        IconButton(onPressed: _twitterURLApp,
                            icon: Image.asset("assets/images/circletwitter.png",height: 30.h,width: 30.w,color: Colors.lightBlue,)),
                        IconButton(onPressed: _FaceBookURLApp,
                            icon: Image.asset("assets/images/facebook.png",height: 30.h,width: 30.w,color: Colors.lightBlue,)),
                      ],
                    ),
                  )

                ],
              ),
        ),
           ),
         ):Container()
      )
    );
  }

}
