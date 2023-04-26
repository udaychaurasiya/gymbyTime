import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/Auth/controller/login_controller.dart';
import 'package:gym/Auth/model/BookModel.dart';
import 'package:gym/Auth/model/CategaryModel.dart';
import 'package:gym/Auth/model/GymListmodel.dart';
import 'package:gym/Auth/model/HomeDetailsModel.dart';
import 'package:gym/Auth/model/OfferModel.dart';
import 'package:gym/Auth/model/TransctionModel.dart';
import 'package:gym/Auth/view/Splash.dart';
import 'package:gym/Auth/view/Splash_Screen.dart';

import 'package:gym/Dashboard/Model/ContectUsModel.dart';
import 'package:gym/mathod/AppContest.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../AppConstant/APIConstant.dart';
import '../../AppConstant/ScanAppConstant.dart';
import '../../Auth/model/FaqModel.dart';
import '../../Auth/model/GymBookModel.dart';
import '../../FontStyle.dart';
import '../../ScanPackage/Model/ScanerModelData.dart';
import '../../ScanPackage/Model/ScannerModel.dart';
import '../../Widget/BaseController.dart';
import '../../mathod/BaseClient.dart';
import '../Model/BannerModel.dart';

class HomePageController extends GetxController{
  late  GlobalKey<FormState> formKey2=GlobalKey<FormState>();
  RxBool _isLightTheme = false.obs;

  var bannerModel = BannerModel().obs;
  var contectModel=ContectUsModel().obs;
  var faqModel=FaqModel().obs;
  var categryModel=CategryModel().obs;
  var transctionModel=TransctionModel().obs;
  var offerModel=OfferModel().obs;
  var homedetailsModel=HomeDetailsModel().obs;
  var booksModel=BookingModel().obs;
  var gymListModel=GymListModel().obs;
  var gymbookModel=GymBookModel().obs;
  var amountController = TextEditingController();
  RxInt male = 0.obs;

  GetStorage _storage = GetStorage();
  String userName = "";
  String email = "";
  String image = "";
  int CategaryId=0;
  var bookid="";
  var id="";
  var walletammount="".obs;
  var ArrayCoin="0".obs;
  RxDouble latitude =0.0.obs;
  RxDouble longitude =0.0.obs;
  var address = ''.obs;
  @override
  void onInit()
  {
    userName = _storage.read(AppConstant.userName);
    email = _storage.read(AppConstant.email);
    image = _storage.read(AppConstant.profileImg);
    getBannerNetworkApi();
    super.onInit();
  }

  Category(){
    id=_storage.read(AppConstant.id);
  }

  getBannerNetworkApi() async {
    var response = await BaseClient()
        .get(getbannerApi + "?lng=eng")
        .catchError(BaseController().handleError);

    if (jsonDecode(response)["status"] == 1) {
      bannerModel.value = bannerModelFromJson(response);
      // print("dnjggud");
      // print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }
  logout() {
    _storage.remove(AppConstant.id);
    _storage.remove(AppConstant.userId);
    _storage.remove(AppConstant.userName);
    _storage.remove(AppConstant.profileImg);
    _storage.remove(AppConstant.email);
    _storage.remove(AppConstant.phone);
    _storage.remove(AppConstant.age);
    _storage.remove(AppConstant.height);
    _storage.remove(AppConstant.stafflogin);
    Get.delete<LoginController>();
    Get.offAll(() => Splash());
  }

  getCategaryNetworkApi() async {
    var response = await BaseClient()
        .get(getcategaryApi + "?lng=eng")
        .catchError(BaseController().handleError);
    // print(response);
    if (jsonDecode(response)["status"] == 1) {
      categryModel.value = categryModelFromJson(response);
      // print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }

 /* getGymListNetworkApi(String latitude,String longitude) async
  {
    var response = await BaseClient()
        .get(getgymListApi + "?lng=eng&category_id=$CategaryId&latitude=${latitude}&longitude=${longitude}")
        .catchError(BaseController().handleError);
    if (jsonDecode(response)["status"] == 1) {
      gymListModel.value = gymListModelFromJson(response);
      // print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }*/

  getGymListNetworkApi() async
  {
    var response = await BaseClient()
        .get(getgymListApi + "?lng=eng&category_id=$CategaryId")
        .catchError(BaseController().handleError);
    if (jsonDecode(response)["status"] == 1) {
      gymListModel.value = gymListModelFromJson(response);
      // print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }


  getContectNetworkApi() async{
    var response = await BaseClient()
        .get(getcontectApi +"/lng=eng").
    catchError(BaseController().handleError);
    if(jsonDecode(response)["status"]==1) {
      contectModel.value = contectUsModelFromJson(response);
      print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);

  }

  getOfferNetworkApi() async{
    var response = await BaseClient()
        .get(getOfferListApi +"/lng=eng${
        _storage.read(AppConstant.offerId,).toString().trim()

    }").
    catchError(BaseController().handleError);
    // print("ehuigiygf"+ response);
    if(jsonDecode(response)["status"]==1) {
      offerModel.value = offerModelFromJson(response);
      // print("dbgyigiguf");
      print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);

  }
  getHomeDetailsNetworkApi(String id) async{

    print("hjmgvjxbchgjhfbghfchvbjhv"+id);
    var response = await BaseClient()
        .get(getHomeDetailsListApi +"?gym_id=${id}").
    catchError(BaseController().handleError);
    // print("ehuigiyjihfigf"+ response);
    if(jsonDecode(response)["status"]==1) {
      homedetailsModel.value = homeDetailsModelFromJson(response);
      // print("jjdhfjufgug");
      print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);

  }

  getFaqNetworkApi() async{
    var response = await BaseClient()
        .get(getFaqApi +"?lng=eng&limit=10&page=0").
    catchError(BaseController().handleError);
    // print("ehuigiggirguig7"+response);
    if(jsonDecode(response)["status"]==1) {
      faqModel.value = faqModelFromJson(response);
      // print("hugugui76r57");
      print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);

  }


  getBookNetworkApi() async{
    // print("fjhugf+$getBookApi?user_id=${_storage.read(AppConstant.id)}&limit=50&page=0");
    var response = await BaseClient()
        .get(getBookApi +"?user_id=${_storage.read(AppConstant.id)}&limit=400&page=0").
    catchError(BaseController().handleError);
    print("======"+response);
    if(jsonDecode(response)["status"]==1) {
      booksModel.value = bookingModelFromJson(response);
      // print("wdngfyfd  $booksModel.value");

      // print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);

  }


  getTransctionNetworkApi() async{
    var response = await BaseClient()
        .get(getTransctionApi +"?user_id=${_storage.read(AppConstant.id)}&limit=50&page=0").
    catchError(BaseController().handleError);
    // print("efhu7feriutfr"+response);
    if(jsonDecode(response)["status"]==1) {
      transctionModel.value = transctionModelFromJson(response);
      // print("dsfkkhuugih  $transctionModel.value");
      print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);

  }


  Future<bool> postRaiseTicketNetworkApi(String message,subject) async {
    var bodyRequest = {
      "lng": language,
      "user_id":_storage.read(AppConstant.id),
      "subject": subject,
      "description": message
    };
    // print("edjuigfiygyub");
    // print(bodyRequest);

    Get.context!.loaderOverlay.show();
    var response = await BaseClient()
        .post(getRaiseTicketApi, bodyRequest)
        .catchError(BaseController().handleError);
    Get.context!.loaderOverlay.hide();
    // print("ddhuif86df");
    print(response);
    if (jsonDecode(response)["status"] == 1) {
      BaseController().successSnack(jsonDecode(response)["message"]);
      return true;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
    return false;
  }



  var gym_id=''.obs;
  var date=''.obs;
  var time=''.obs;
  var coupon_id=''.obs;
  var coupon_code=''.obs;

  Future<bool> postgymookNetworkApi(context) async {
    /* var bodyRequest = {
      "lng": language,
      "user_id":_storage.read(AppConstant.id),
      "gym_id":gym_id,
      "coupon_id":coupon_id,
      "coupon_code":coupon_code,
      "date":"11/12/2022",
      "time":''
    };*/
    var bodyRequest = {
      "user_id":_storage.read(AppConstant.id),
      "gym_id":gym_id.toString(),
      "coupon_id":coupon_id.toString(),
      "coupon_code":coupon_code.toString(),
      "date":date.toString(),
      "time":time.toString()
    };
    print("book send data $bodyRequest");
    Get.context!.loaderOverlay.show();
    var response = await BaseClient()
        .post(getgymBookApi, bodyRequest)
        .catchError(BaseController().handleError);
    Get.context!.loaderOverlay.hide();
    print(response);
    if (jsonDecode(response)["status"] == 1) {
      gymbookModel.value=gymBookModelFromJson(response);
      print("djihof8  $jsonDecode(response)[status] == 1");
      // BaseController().successSnack(jsonDecode(response)["message"]);
      getBookNetworkApi();
      Navigator.pop(context);

      /* showModalBottomSheet(
            context: context,
            barrierColor: Colors.black.withOpacity(0.1),
            isScrollControlled: true,
            backgroundColor: Colors.white70,
            builder: (context) {
              GetStorage _storage=GetStorage();
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
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("Congratulations!",style: smallTextStyle.copyWith(fontSize: 20.sp),),
                                    Container(
                                      child: Image.asset("assets/images/check2.gif"),
                                    ),
                                    Text("gym Booked!",style: smallTextStyle.copyWith(fontSize: 18.sp),)
                                  ],
                                ),

                              ],
                            ),

                          )
                      ),

                    )
                ),
              );
            }
        );*/
      return true;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
    gymbookModel.value=gymBookModelFromJson(response);
    return false;
  }
  Future<bool> postcurrentaddressNetworkApi() async {
    var bodyRequest = {
      "user_id":_storage.read(AppConstant.id),
      "latitude":latitude.toString(),
      "longitude":longitude.toString(),
      "address":address.toString(),
    };
  print("fghfhf $bodyRequest");
    Get.context!.loaderOverlay.show();
    var response = await BaseClient()
        .post(getcurrentaddressApi, bodyRequest)
        .catchError(BaseController().handleError);
    Get.context!.loaderOverlay.hide();
    print(response);
    print("kdjkjhiygfvh"+response);
    if (jsonDecode(response)["status"] == 1) {
      walletammount.value=jsonDecode(response)["Data"]["wallet_amount"]??"0";
      // walletammount.value="500";
      // _storage.write(AppConstant.wallet_amount,jsonDecode(response)["Data"]["wallet_amount"]??"0");
      _storage.write(AppConstant.wallet_amount,jsonDecode(response)["Data"]["wallet_amount"]??"0");
      return true;
    }
    return false;
  }


  var amount=''.obs;
  var txt_id=''.obs;
  var status=''.obs;
  Future<bool>getpurchasePointsNetworkApi(transection_Id,String status) async {
    var bodyRequest = {
      "user_id":_storage.read(AppConstant.id),
      "coupon_id":coupon_id.toString(),
      "coupon_code":coupon_code.toString(),
      "amount":amountController.text.toString(),
      "txn_id":transection_Id.toString(),
      "status":status.toString(),
    };
    print("cdhui7gd  $bodyRequest");
    /* Future<bool> getpurchasePointsNetworkApi() async {
    var bodyRequest = {
      "user_id":_storage.read(AppConstant.id),
      "coupon_id":coupon_id,
      "coupon_code":coupon_code,
      "amount":amount,
      "txn_id":txt_id,
      "status":status,
    };*/

    Get.context!.loaderOverlay.show();
    var response = await BaseClient()
        .post(getpurchasePoints, bodyRequest)
        .catchError(BaseController().handleError);
    Get.context!.loaderOverlay.hide();
    print(response);
    print("kdjkjhiygfvh"+response);
    if (jsonDecode(response)["status"] == 1) {
      _storage.write(AppConstant.wallet_amount,jsonDecode(response)["Data"]["wallet_amount"]);
      return true;
      BaseController().successSnack(jsonDecode(response)["message"]);
    }
    return false;
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }
  var scanerModelData=ScanerModelData().obs;

  getMyscanListNetworkApi()
  async{


    var response = await BaseClient()
        .get(getMyscanList +"?staff_id=${_storage.read(AppConstant.id)}&limit=10&page=0&searchkey").
    catchError(BaseController().handleError);
    print("zxvvdfgg  $response");
    if(jsonDecode(response)["status"]==1)
    {
      scanerModelData.value = scanerModelDataFromJson(response);
      print("zvdfgg  $response");
      print(response);
      return;
    }
    else
    {
      scanerModelData.value = scanerModelDataFromJson(response);
      BaseController().errorSnack(jsonDecode(response)["message"]);
    }

  }

  var scanerData=ScanerData().obs;
  Future<bool> getMyscanDataNetworkApi(String bookingNo) async
  {
    var bodyRequest =
    {
      "staff_id":_storage.read(AppConstant.id),
      "booking_no":bookingNo,
    };
    print("djfgjh"+bodyRequest.toString());
    Get.context!.loaderOverlay.show();
    var response = await BaseClient()
        .post(getMyscanData, bodyRequest)
        .catchError(BaseController().handleError);
    Get.context!.loaderOverlay.hide();

    print("dgfghfhjj"+response);
    if (jsonDecode(response)["status"] == 1)
    {
      scanerData.value=scanerDataFromJson(response);
      BaseController().successSnack(jsonDecode(response)["message"]);
      return true;
    }
    else
    {
      print("dfgfmdgjkdfhg");
      BaseController().successSnack(jsonDecode(response)["message"]);
      scanerData.value=scanerDataFromJson(response);

      return false;
    }
  }
}


