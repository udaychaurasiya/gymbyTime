import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym/Dashboard/view/music_Page/page1.dart';
import 'package:gym/Dashboard/view/music_Page/page2.dart';
import 'package:gym/Dashboard/view/music_Page/page3.dart';
import 'package:gym/FontStyle.dart';
class music extends StatefulWidget {
  const music({Key? key}) : super(key: key);

  @override
  State<music> createState() => _musicState();
}

class _musicState extends State<music> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 3,
      child: Scaffold(
        body: FadeInUp(
          delay: Duration(milliseconds: 450),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(height: 50.h,),
                TabBar(
                  // indicatorColor: Colors.white,
                  indicatorWeight: 2.0,
                  // indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(),
                   labelColor: Colors.blue,
                  labelStyle: TextStyle(),
                  labelPadding: EdgeInsets.only(top: 10.0),

                  unselectedLabelColor: Colors.purple,

                  unselectedLabelStyle: TextStyle(color: Colors.green),
                  isScrollable: false,
                  tabs: [
                    Container(
                        child:
                        Text("CONTACT US",style: smallText1Style,)),
                        Text("FAQ",style: smallText1Style,),
                       Text("RAISE TICKET",style: smallText1Style,),
                  ],
                ),
                Expanded(
                    child: TabBarView(
                      children: [
                        page1(),
                        page2(),
                        page3(),

                      ],
                    ))
              ],

            ),
          ),
        ),
      ),
    );
  }
}
