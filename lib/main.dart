import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/routes/routes.dart';
import 'package:u_learning/common/values/colors.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/firebase_options.dart';
import 'package:u_learning/pages/application/applicaiton_page.dart';
// import 'package:u_learning/pages/welcome/welcome.dart';
// import 'package:u_learning/pages/application/applicaiton_page.dart';
// import 'package:u_learning/common/routes/pages.dart';
import 'package:u_learning/pages/welcome/welcome.dart';

// import 'common/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}
/*
  In bloc everything happens through the states and events
*/
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppPages.allBlocProviders(context) ,
      child: ScreenUtilInit(
      builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(
                  color: AppColors.primaryText
                ),
                elevation: 0,
                backgroundColor: Colors.white
              )
            ),
            onGenerateRoute: AppPages.GenerateRouteSettings,
          );
        },
      )
    );
  }
}