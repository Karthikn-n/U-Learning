import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/pages/application/application_widget.dart';

class ApplicaitonPage extends StatefulWidget {
  const ApplicaitonPage({super.key});

  @override
  State<ApplicaitonPage> createState() => _ApplicaitonPageState();
}

class _ApplicaitonPageState extends State<ApplicaitonPage> {
  int _index =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1
                )
              ]
            ),
            child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                _index =value;
                });
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourthElementText,
              items: [
                BottomNavigationBarItem(
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/home.png", color: AppColors.primaryElement,),
                  ),
                  // Image.asset("assets/icons/home.png", color: AppColors.primaryElement,),
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/home.png"),
                  ),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/search2.png"),
                  ),
                  label: 'Search',
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/search2.png", color: AppColors.primaryElement,),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/play-circle1.png"),
                  ),
                  label: 'Course',
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/play-circle1.png", color: AppColors.primaryElement,),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/message-circle.png"),
                  ),
                  label: 'Chat',
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/message-circle.png", color: AppColors.primaryElement,),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/person2.png"),
                  ),
                  label: 'Profile',
                  activeIcon:SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset("assets/icons/person2.png", color: AppColors.primaryElement,),
                  ),
                ),
              ]
            ),
          ),
        )
      ),
    );
  }
}