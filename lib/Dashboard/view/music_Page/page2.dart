import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gym/Dashboard/Controller/homepage_controller.dart';

import '../../../FontStyle.dart';
class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  HomePageController controller=Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    controller.getFaqNetworkApi();
    return Scaffold(
      body:
         Obx(()=> controller.faqModel.value.data!= null
             ?
             FadeInUp(
               delay: Duration(milliseconds: 450),
               child: SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(height: 30.h,),
                   ListView.builder(
                       itemCount: controller.faqModel.value.data!.length,
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder:
                       (context,index){
                         RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
                         final data=controller.faqModel.value.data![index];
                     return Padding(
                       padding: const EdgeInsets.only(left: 1.0,right: 1,top: 10),
                       child: Container(
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey.shade400,width: .5),
                           borderRadius: BorderRadius.circular(10)
                         ),
                         child: ExpansionTile(
                           trailing: Icon(Icons.add,color: Colors.white,),
                           title: Text(data.title.toString(),style: bodyText4Style.copyWith(fontSize: 16.sp),),
                           children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 15, right: 15,bottom: 10),
                               child: Text(data.description.toString().replaceAll(exp, ""),
                                 style: smallTextStyle,textAlign: TextAlign.justify,
                             ),
                             )
                           ],
                         ),
                       ),
                     );

                     //   Container(
                     //   height: 70.h,
                     //   margin: EdgeInsets.all(8),
                     //   width: MediaQuery.of(context).size.width,
                     //   decoration: BoxDecoration(
                     //     color: Colors.white,
                     //    borderRadius: BorderRadius.circular(5),
                     //    boxShadow: [
                     //      BoxShadow(
                     //        color: Colors.grey,
                     //        blurRadius: 1,
                     //      ),
                     //    ]
                     //   ),
                     //   child: Column(
                     //     mainAxisAlignment: MainAxisAlignment.center,
                     //     crossAxisAlignment: CrossAxisAlignment.center,
                     //     children: [
                     //       InkWell(
                     //         onTap:(){
                     //
                     //         },
                     //         child: Container(
                     //             padding:EdgeInsets.all(8.w),
                     //             child: Text("What Attrection in Montreal is one of "
                     //                 "the largest in the World?",style: bodyText4Style.copyWith(fontSize: 14.sp),)),
                     //       ),
                     //     ],
                     //   ),
                     // );
                   })
                 ],
               ),
        ),
             ):Container()
         ),

    );
  }
}
