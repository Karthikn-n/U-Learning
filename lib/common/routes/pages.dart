// one route one bloc is best practice.
// unify BlocProvider and routes pages
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/common/routes/names.dart';
import 'package:u_learning/pages/register/bloc/register_bloc.dart';
import 'package:u_learning/pages/register/register.dart';
import 'package:u_learning/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:u_learning/pages/sign_in/sign_in.dart';
import 'package:u_learning/pages/welcome/bloc/welcome_bloc.dart';
import 'package:u_learning/pages/welcome/welcome.dart';

class AppPages{
  static List<PageEntity> routes (){
    return [
      PageEntity(
      route: AppRoutes.INITIAL, 
      page: const Welcome(), 
      bloc: BlocProvider(create: (context)=>WelcomeBloc(),)
    ),
      PageEntity(
      route: AppRoutes.SING_IN, 
      page: const SignInPage(), 
      bloc: BlocProvider(create: (context)=>SignInBlocs(),)
    ),
      PageEntity(
      route: AppRoutes.REGISTER, 
      page: const Register(), 
      bloc: BlocProvider(create: (context)=>RegisterBlocs(),)
    ),
    ];
  }


// return all the bloc providers
   static List<BlocProvider> allBlocProviders(BuildContext context){
    List<BlocProvider> blocProviders = <BlocProvider>[];
    for(var blocs in routes()){
      if(blocs.bloc != null){
        blocProviders.add(blocs.bloc!);
      }
    }
    return blocProviders;
  }


  // model that cover entire screen as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name !=null){
      // check for route name matching when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if(result.isNotEmpty){
        return MaterialPageRoute(builder: (_)=> result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_)=> const SignInPage(), settings: settings);
  }
}


class PageEntity{
  String route;
  Widget page;
  BlocProvider? bloc;

  PageEntity({required this.route, required this.page,  this.bloc});
}