import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gym/AppConstant/APIConstant.dart';
import 'package:gym/Auth/model/PrivacyModel.dart';
import 'package:gym/Auth/model/TermConditionModel.dart';
import 'package:gym/Auth/view/HomePage.dart';
import 'package:gym/Auth/view/LoginPage.dart';
import 'package:gym/Auth/view/Otp.dart';
import 'package:gym/Widget/BaseController.dart';
import 'package:gym/mathod/AppContest.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../AppConstant/ScanAppConstant.dart';
import '../../ScanPackage/OtpNumberVeryfy.dart';
import '../../ScanPackage/StaffDashBoard.dart';
import '../../mathod/BaseClient.dart';
class LoginController extends GetxController
{
  var privacyModel = PrivacyModel().obs;
  var termConditionModel = TermConditionModel().obs;
  TextEditingController etMobile=TextEditingController();
  RxString rxPath="".obs;
  TextEditingController etName=TextEditingController();
  TextEditingController etEmail=TextEditingController();
  TextEditingController etAdd=TextEditingController();
  TextEditingController etAge=TextEditingController();
  TextEditingController etWiegth=TextEditingController();
  TextEditingController etHeight=TextEditingController();
  final formKey=GlobalKey<FormState>();
   late  GlobalKey<FormState> formKey2=GlobalKey<FormState>();
  RxString gender="".obs;
  GetStorage _storage=GetStorage();

    loginNetworkApi()async{
      var bodyRequest={
        "lng":language,
        "mobile":etMobile.text,

      };
      Get.context!.loaderOverlay.show();
      var response=await BaseClient().post(SignIn, bodyRequest).catchError(BaseController().handleError);
      Get.context!.loaderOverlay.hide();
      print("vsdfbfd");
      print(response);
      if(jsonDecode(response)["status"]==1)
      {
        BaseController().successSnack(jsonDecode(response)["message"]+" "+jsonDecode(response)["Data"]["otp"]);
        Get.to(()=>OtpVerify(id: jsonDecode(response)["Data"]["id"],otp:jsonDecode(response)["Data"]["otp"] ,));
        return;
      }
      BaseController().errorSnack(jsonDecode(response)["message"]);
    }


    Timer? _timer;
  RxInt start = 25.obs;

  void startTimer() {
    const oneSec =  Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }


  verifyNetworkApi(String id,String otp)async{
    var bodyRequest={
      "lng":language,
      "id":id,
      "otp":otp,
    };
    print("guggy $bodyRequest");
      Get.context!.loaderOverlay.show();
    var response=await BaseClient().post(Verify, bodyRequest).catchError(BaseController().handleError);
    print(response+"khdiogu");
       Get.context!.loaderOverlay.hide();
    if(jsonDecode(response)["status"]==1) {
      if (jsonDecode(response)["Data"].isNotEmpty) {
        if(jsonDecode(response)["Data"]["id"].toString().isNotEmpty && jsonDecode(response)["Data"]
        ["email"].toString().isNotEmpty)
        {
          _storage.write(AppConstant.id, jsonDecode(response)["Data"]["id"]??"");
          _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
          _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
          _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["name"]??"");
          _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
          _storage.write(AppConstant.email, jsonDecode(response)["Data"]["email"]??"");
          _storage.write(AppConstant.age, jsonDecode(response)["Data"]["age"]??"");
          _storage.write(AppConstant.height, jsonDecode(response)["Data"]["height"]??"");
          _storage.write(AppConstant.weight, jsonDecode(response)["Data"]["weight"]??"");
          Get.offAll(() => bottomNavigation());
        }
        else{
          _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
          _storage.write(AppConstant.id,jsonDecode(response)["Data"]["id"]??"");
          Get.to(() =>LoginPage());
        }
        BaseController().successSnack(jsonDecode(response)["message"]);

      }
    }
    else{
      BaseController().errorSnack(jsonDecode(response)["message"]);
    }

  }

  chooseImage(bool isCamera)async{
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source:isCamera?
      ImageSource.camera:ImageSource.gallery,imageQuality: 60);
      if(image!=null)
      {
        rxPath.value=image.path;
      }
    } on Exception catch (e) {
      print("cxjkbjvkbsdjv"+e.toString());
    }

  }




  signUpNetworkApi()async{
    var bodyRequest={
      "lng":language,
      "name":etName.text,
      "email":etEmail.text,
      "mobile":_storage.read(AppConstant.phone).toString().trim(),
      "age":etAge.text,
      "zip_code":"",
      "state_id":"",
      "city_id":"",
      "height":etHeight.text,
      "weight":etWiegth.text,
      "gender":gender.value,
      "id":_storage.read(AppConstant.id).toString().trim(),
      "profile":""
    };
    print("vbdsjsjkbsdvjbvds   $bodyRequest");
    print(bodyRequest);
    Get.context!.loaderOverlay.show();
    var response=await BaseClient().post(updateProfile, bodyRequest).catchError(BaseController().handleError);
    print(response);
    print("digfud");
    Get.context!.loaderOverlay.hide();
    if(jsonDecode(response)["status"]==1)
    {
      BaseController().successSnack(jsonDecode(response)["message"]);
      _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
      _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["name"]??"");
      _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
      _storage.write(AppConstant.email, jsonDecode(response)["Data"]["email"]??"");
      _storage.write(AppConstant.age, jsonDecode(response)["Data"]["age"]??"");
      _storage.write(AppConstant.height, jsonDecode(response)["Data"]["height"]??"");
      _storage.write(AppConstant.weight, jsonDecode(response)["Data"]["weight"]??"");
      _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
      Get.offAll(() => bottomNavigation());
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }
  setEtDataController()
  {
     etName.text=_storage.read(AppConstant.userName);
     etEmail.text=_storage.read(AppConstant.email);
     etMobile.text=_storage.read(AppConstant.phone);
     etAge.text=_storage.read(AppConstant.age);
     etWiegth.text=_storage.read(AppConstant.weight);
     etHeight.text=_storage.read(AppConstant.height);
  }

  getPrivacyNetworkApi() async{
    var response = await BaseClient()
        .get(getPrivacyApi + "?lng=eng/").
    catchError(BaseController().handleError);
    print("======"+response);
    if(jsonDecode(response)["status"]==1) {
      privacyModel.value = privacyModelFromJson(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }
  getTermConditionNetworkApi() async{
    var response = await BaseClient()
        .get(getTermConditionApi + "?lng=eng/").
    catchError(BaseController().handleError);
    print("======"+response);
    if(jsonDecode(response)["status"]==1) {
      termConditionModel.value = termConditionModelFromJson(response);
      print("dfjhiugfd  $termConditionModel.value");
      print(response);
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }

  UpdateProfileNetworkApi(int value)async
  {

    var bodyRequest={
      "lng":language,
      "name":etName.text.toString(),
      "email":etEmail.text.toString(),
      "mobile":_storage.read(AppConstant.phone).toString().trim(),
      "age":etAge.text.toString(),
      "zip_code":"",
      "state_id":"",
      "city_id":"",
      "height":etHeight.text.toString(),
      "weight":etWiegth.text.toString(),
      "gender":value.toString(),
      "id":_storage.read(AppConstant.id).toString().trim(),

    };
    print("vbdsjsjkbsdvjbvds"+bodyRequest.toString());
    print(bodyRequest);
    Get.context!.loaderOverlay.show();
    var response=await BaseClient().profileUpdate(rxPath.value,bodyRequest,updateProfile)
        .catchError(BaseController().handleError);
    print("@@resxvcxcvccvxbcvbcvponse"+response);
    print(response);
    Get.context!.loaderOverlay.hide();
    if(jsonDecode(response)["status"]==1)
    {
      print("sdnbhdb${jsonDecode(response)["Data"]["profile"]??""}");
      BaseController().successSnack(jsonDecode(response)["message"]);
      _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
      _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["name"]??"");
      _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
      _storage.write(AppConstant.email, jsonDecode(response)["Data"]["email"]??"");
      _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
      _storage.write(AppConstant.height, jsonDecode(response)["Data"]["height"]??"");
      _storage.write(AppConstant.weight, jsonDecode(response)["Data"]["weight"]??"");
      _storage.write(AppConstant.age, jsonDecode(response)["Data"]["age"]??"");
      _storage.write(AppConstant.gender, jsonDecode(response)["Data"]["gender"]??"");
      _storage.write(AppConstant.wallet_amount, jsonDecode(response)["Data"]["wallet_amount"]??"");
      Get.offAll(() => bottomNavigation());
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }




  UpdateProfilStaffNetworkApi(int value)async
  {

    var bodyRequest={
      "name":etName.text,
      "email":etEmail.text,
      "mobile":_storage.read(AppConstant.phone).toString().trim(),
      "zip_code":"",
      "state_id":"",
      "city_id":"",
      "gender":value.toString(),
      "id":_storage.read(AppConstant.id).toString().trim(),
    };

    Get.context!.loaderOverlay.show();
    var response=await BaseClient().profileUpdate(rxPath.value,bodyRequest,updateStaffProfile).catchError(BaseController().handleError);
    /*  "id": "1",
  "admin_master_id": "2",
  "user_login": "0",
  "name": "Krishna nand patel",
  "gender": "2",
  "email": "rrrrrrr.up5@gmail.com",
  "mobile": "6394002151",
  "state_id": "1",
  "city_id": "0",
  "zip_code": "0",
  "address": "",
  "description": "hjfv dshv cxhv dsv chvkrish  nand oatel village manikpur kote karanda ghazipur village manikpur kote karanda ghazipur name krishna nand ram kumar patel utkarsh ku",
  "latitude": "26.80027075241294",
  "longitude": "26.800024847587064",
  "status": "1",
  "add_date": "2023-04-20 06:24:08",
  "gym_name": "Run Fitness Gym",
  "profile": "uploads/staffs/6691681997048.png"

    */


    Get.context!.loaderOverlay.hide();
    if(jsonDecode(response)["status"]==1)
    {
      print("sdnbhdb${jsonDecode(response)["Data"]["profile"]??""}");
      BaseController().successSnack(jsonDecode(response)["message"]);
      _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
      _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["name"]??"");
      _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
      _storage.write(AppConstant.email, jsonDecode(response)["Data"]["email"]??"");
      _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
      _storage.write(AppConstant.gender, jsonDecode(response)["Data"]["gender"]??"");

      Get.offAll(() => StaffDashboard());
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }






  staffLoginNetworkApi()async{
    var bodyRequest={
      "lng":language,
      "mobile":etMobile.text,

    };
    Get.context!.loaderOverlay.show();
    var response=await BaseClient().post(signInAsStaff, bodyRequest).catchError(BaseController().handleError);
    Get.context!.loaderOverlay.hide();
    print("vsfddfgfgdfbfd");
    print(response);
    if(jsonDecode(response)["status"]==1)
    {
      BaseController().successSnack(jsonDecode(response)["message"]+" "+jsonDecode(response)["Data"]["otp"]);
      print(jsonDecode(response)["Data"]["id"]);
      print(jsonDecode(response)["Data"]["otp"] );
      Get.to(()=>OtpNumberVeryfy(id: jsonDecode(response)["Data"]["id"],otp:jsonDecode(response)["Data"]["otp"] ,));
      return;
    }
    BaseController().errorSnack(jsonDecode(response)["message"]);
  }

  staffOtpVerifyNetworkApi(String id,String otp)async{
    var bodyRequest={
      "lng":language,
      "id":id,
      "otp":otp,
    };
    print("guggy $bodyRequest");
    Get.context!.loaderOverlay.show();
    var response=await BaseClient().post(otpverifyApi, bodyRequest).catchError(BaseController().handleError);
    print(response+"khdiogu");
    Get.context!.loaderOverlay.hide();
    if(jsonDecode(response)["status"]==1) {
      if (jsonDecode(response)["Data"].isNotEmpty) {
        if(jsonDecode(response)["Data"]["id"].toString().isNotEmpty && jsonDecode(response)["Data"]
        ["email"].toString().isNotEmpty)
        {
          _storage.write(AppConstant.id, jsonDecode(response)["Data"]["id"]??"");
          _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
          _storage.write(AppConstant.userId, jsonDecode(response)["Data"]["user_login"]??"");
          _storage.write(AppConstant.userName, jsonDecode(response)["Data"]["name"]??"");
          _storage.write(AppConstant.profileImg, jsonDecode(response)["Data"]["profile"]??"");
          _storage.write(AppConstant.email, jsonDecode(response)["Data"]["email"]??"");
          _storage.write(AppConstant.age, jsonDecode(response)["Data"]["age"]??"");
          _storage.write(AppConstant.height, jsonDecode(response)["Data"]["height"]??"");
          _storage.write(AppConstant.weight, jsonDecode(response)["Data"]["weight"]??"");
          _storage.write(AppConstant.gym_name, jsonDecode(response)["Data"]["gym_name"]??"");
          _storage.write(AppConstant.stafflogin,"1");
           Get.offAll(() => StaffDashboard());
            }
          else
          {
          _storage.write(AppConstant.phone, jsonDecode(response)["Data"]["mobile"]??"");
          _storage.write(AppConstant.id,jsonDecode(response)["Data"]["id"]??"");
          BaseController().successSnack("you are not a staff");
           }
          BaseController().successSnack(jsonDecode(response)["message"]);
          }
    }
    else{
      BaseController().errorSnack(jsonDecode(response)["message"]);
    }

  }






}