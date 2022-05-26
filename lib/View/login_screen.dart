import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/Controller/cubit/eye_icon_button_cubit.dart';
import 'package:task/View/IntroScreen/intro_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task/widgets/button_widgets.dart';
import 'package:task/widgets/confirm_password_field.dart';
import 'package:task/widgets/text_field.dart';
import 'sign_up_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => EyeIconButtonCubit(true),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 40.0.h),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30.sp),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Center(
                  child: Text(
                    'Add your details to login',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                LoginTextField(text: 'Your Email', controller: emailController),
                SizedBox(
                  height: 20.h,
                ),

                ConfirmPasswordField(text: 'Password', passwordController: passwordController),
                SizedBox(
                  height: 27.h,
                ),
                Button(

                  titleName: 'Login',
                  onpressed: () async {
                    if(_formKey.currentState!.validate())
                    {

                    }
                    UserCredential userCrediential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(email: emailController.text,
                        password: passwordController.text);


                    if (userCrediential != null) {

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const IntroducitonScreens();
                          }));



                    }

                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return const IntroducitonScreens();
                    // }));
                  },
                  color: const Color(0xffFC6011),
                  textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Text(
                    'or Login With',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: SizedBox(
//    padding:  EdgeInsets.symmetric(vertical: 30.h,),
                    width: 315.w,
                    height: 55.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff367FC0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            )),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset('assets/facebook.png'))),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Login with Facebook',
                                      style: TextStyle(fontSize: 12.sp),
                                    ))),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: SizedBox(
                    // padding:  EdgeInsets.symmetric(vertical: 30.h,),
                    width: 315.w,
                    height: 55.h,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffDD4B39),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            )),
                        onPressed: () async {
                          await signInWithGoogle();
                          Fluttertoast.showToast(
                            msg: 'Welcome', textColor: const Color(0xffFC6011),);
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) {
                            return const IntroducitonScreens();
                          }));
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        'assets/google_plus.png'))),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Login with Google',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),

                                )),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Don't have an Account?",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          )),
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return  const SignUp();
                                    }));
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color(0xffFC6011),
                                  ),
                                ),
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;


    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    userEmail = googleUser!.email;
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}


