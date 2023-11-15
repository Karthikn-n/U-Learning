import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';

AppBar buildAppBar(String type){
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0), 
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // thickeness of line
        height: 1.0,
      )
      ),
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      'Log In',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal
      ),
    ),
  );
}

// context for accessing bloc
Widget buildThirdPartyLogin(BuildContext context){
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 28.h
    ),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons('google'),
        _reusableIcons('apple'),
        _reusableIcons('facebook'),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName){
  return GestureDetector(
    onTap: () {
      
    },
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp
      ),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
  void Function(String value)? func
){
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 28.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourthElementText)
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.w,
          // margin: EdgeInsets.only(left: 17.w),
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration:  InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              disabledBorder:  const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText
              )
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14.sp
            ),
            autocorrect: false,
            obscureText: textType =="password"?true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassWord(){
  return Container(
    // margin: EdgeInsets.only(left: 25.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {
        
      },
      child: Text(
        "Forgot password?",
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp
        ),
      ),
    ),
  );
}

Widget buildLogInAndSignInButton(String buttonName, String buttonType, void Function()? func){
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: buttonType=='login'?30.h:20.h),
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
        color: buttonType=='login'
        ? AppColors.primaryElement
        : AppColors.primaryBackground,
        border: Border.all(
          color: buttonType == 'login'
          ? Colors.transparent
          :AppColors.primaryFourthElementText
        ),
        borderRadius: BorderRadius.circular(15.w),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.1)
          )
        ]
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16.sp,
            color: buttonType =='login'
            ?  AppColors.primaryBackground
            : AppColors.primaryText
          ),
        ),
      )
    ),
  );
}

