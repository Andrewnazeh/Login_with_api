import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'Login_screen/LoginScreen.dart';
import 'Login_screen/cubit/login_cubit.dart';
import 'helper/DioHelper.dart';

void main() {
  // Bloc.observer = AppBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: GetMaterialApp(
        home:  LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


