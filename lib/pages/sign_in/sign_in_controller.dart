import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/widgets/flutter_toast.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController{
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async{
    try{
      if(type =="email"){
        final state = context.read<SignInBlocs>().state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty){
          toastInfo(msg: "You need to fill email");
          return;
        }
        if(password.isEmpty){
          toastInfo(msg: "You need to fill password");
          return;
        }
        try{
          final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress, 
            password: password
          );
          if(credentials.user == null){
            toastInfo(msg: "You don't exist");
            return;
          }
          if(!credentials.user!.emailVerified){
            toastInfo(msg: "You need verify your email account");
            return;
          }
          var user = credentials.user;
          if(user != null){
            toastInfo(msg: "You don't exist");
            return;
          }else{
            toastInfo(msg: "Currently your not the user of app");
            return;
          }
        }on FirebaseAuthException catch(e){
          if(e.code == 'user-not-found'){
            toastInfo(msg: "No user found for that email");
            return;
          }else if(e.code == 'wrong-password'){
            toastInfo(msg: "Wrong password provided fot that user");
            return;
          }else if(e.code == 'invalid-email'){
          toastInfo(msg: "Your email address format is wrong");
          return;
          }
        }
      }
    }catch(e){
      // print(e.toString());
      throw e.toString();
    }
  }
}