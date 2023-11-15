import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_state.dart';
import 'package:u_learning/pages/sign_in/sign_in_controller.dart';
// import 'package:u_learning/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:u_learning/pages/common_widgets.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInState>(
      builder: (context, state) {
          return Container(
              color: Colors.white,
              child:  SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: buildAppBar("Log In"),
                  body: SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(child: reusableText('or use your email account to login')),
                    Container(
                      margin: EdgeInsets.only(top: 38.h),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Email'),
                        SizedBox(height: 5.h,),
                        buildTextField('Enter your email address', 'email', "user",
                          (value){
                            context.read<SignInBlocs>().add(EmailEvent(value));
                          }
                        ),
                        reusableText('Password'),
                        SizedBox(height: 5.h,),
                        buildTextField('Enter your password', 'password', "lock",
                         (value){
                            context.read<SignInBlocs>().add(PasswordEvent(value));
                          }
                        ),
                        forgotPassWord(),
                        buildLogInAndSignInButton("Log In", 'login', 
                          (){
                            SignInController(context: context).handleSignIn("email");           
                            print('Login button');
                          }),
                        buildLogInAndSignInButton("Sign up", 'register',
                        (){
                          Navigator.of(context).pushNamed("/register");
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      );  
     },
    );
  }
}

