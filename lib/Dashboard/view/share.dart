import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/FontStyle.dart';
import 'package:gym/Widget/ButtonWidget.dart';
import 'package:intl/intl.dart';
class share extends StatefulWidget {
  const share({Key? key}) : super(key: key);

  @override
  State<share> createState() => _shareState();
}

class _shareState extends State<share> {
  final _controller = PageController();
  TextEditingController _textDate=TextEditingController();
  TextEditingController _textTime=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18,right: 18),
        child: Column(
          children: [
            Container(
                height: 170.h,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    scrollBehavior: ScrollBehavior(),
                    itemBuilder:
                        (context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                            "https://robbreport.com/wp-content/uploads/2022/07/Himat_WeightRoom.jpg?w=1000"),fit: BoxFit.fill,
                          )
                        ),
                      );
                    })
            ),
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
                      Text("Fitness Pro Gym", style:bodyText1Style,),
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
                    //erewre
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
                Text("At a glance",
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
              padding: const EdgeInsets.all(15.0),
              child: GridView.count(
                physics: ScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 3.0,
                childAspectRatio: 3 / 3,
                shrinkWrap: true,
                children: List.generate(3, (index) {
                  return Card(
                    color: Colors.white,
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
                          width: 52.w,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              shape: BoxShape.circle
                          ),
                          child: Image.asset("assets/images/training.png"),
                        ),
                        SizedBox(height: 3.h,),
                        Text("Yoga",style: smallTextStyle,)
                      ],

                    ),
                  );
                },),
              ),
            ),
            SizedBox(height: 20.h,),
            ButtonWidget(onPress: () {
              bottomSheetBook();
            }, text: 'BOOK',),
          ],
        ),
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
                            Column(
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
                                Container(
                                  height:40.h,
                                  width: 300.w,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40.h,
                                        width: 140.w,
                                        child:  TextField(
                                          controller: _textDate,
                                          decoration: InputDecoration(
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(
                                                  0x4DFFFFFF)),
                                            ),
                                            focusedBorder:const UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            hintText: "DD/MM/YYYY",
                                            hintStyle: smallText1Style.copyWith(fontSize: 15.sp),
                                            border: OutlineInputBorder(),
                                          ),
                                          readOnly: true,
                                          onTap: () async{
                                            final Datet = await
                                            showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2050));
                                            if(Datet !=null){
                                              String formattedDate=
                                              DateFormat('d MMMM y').format(Datet);
                                              setState(() {
                                                _textDate.text=formattedDate;
                                              });
                                            }
                                          },
                                          style: bodyText1Style.copyWith(fontSize:17.sp ),
                                        ),
                                      ),
                                      Container(
                                        height: 40.h,
                                        width: 140.w,
                                        child: TextField(
                                          controller: _textTime,
                                          decoration: InputDecoration(
                                            enabledBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(color: Color(
                                                  0x4DFFFFFF)),
                                            ),
                                            focusedBorder:const UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            hintText: "00:00",
                                            hintStyle: smallText1Style.copyWith(fontSize:15.sp),
                                            border: OutlineInputBorder(
                                            ),
                                          ),

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
                                              }
                                            });
                                          },
                                          style:bodyText1Style.copyWith(fontSize:17.sp ) ,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
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
                                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined))
                                    ],
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
                                            Text("  240",style:smallTextStyle.copyWith(fontSize: 15.sp),)
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 20.h,),
                                Center(child: Text("need 60 more coins to book your move",
                                  style: smallTextStyle.copyWith(color: Colors.red),)),
                                SizedBox(height: 30.h,),
                                Center(
                                  child: ButtonWidget(onPress: () {
                                    Get.back();
                                  },
                                    text: 'Purchase',),
                                )
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
    );
  }
}