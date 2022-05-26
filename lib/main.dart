
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:task/View/home_page.dart';






 Future <void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () =>
          MaterialApp(
            debugShowCheckedModeBanner: false,

            builder: (context, widget) {

              ScreenUtil.setContext(context);
              return MediaQuery(

                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            theme: ThemeData(
              textTheme: const TextTheme(

              ),
            ),
            home:  const HomePage(),
          ),
    );
  }
}