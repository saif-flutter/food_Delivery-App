import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/View/sign_up_screen.dart';
import 'package:task/widgets/button_widgets.dart';

import 'login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -20.sp,
                left: -35.sp,
                right: -35.sp,
                child: Image.asset(
                  "assets/organe_top_shape.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -115.h,
                right: 40.w,
                left: 40.w,
                child: SizedBox(
                    height: 160.h,
                    width: 160.w,
                    child: Image.asset("assets/logo.png")),
              )
            ],
          )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 135.h,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          '    Discover the best foods from over 1,000\n'
                          'restaurants and fast delivery to your doorstep',
                          style:
                              TextStyle(color: Colors.black, fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Button(
                  titleName: 'Login',
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  },
                  color: const Color(0xffFC6011),
                  textStyle: const TextStyle(color: Colors.white),
//               ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                child: Button(
                  titleName: 'Create an Account ',
                  onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const SignUp();
                    }));
                  },
                  color: const Color(0xffFFFFFF),
                  textStyle: const TextStyle(color: Color(0xffFC6011)),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
