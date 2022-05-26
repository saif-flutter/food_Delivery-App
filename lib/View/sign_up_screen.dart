import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/Controller/cubit/eye_icon_button_cubit.dart';
import 'package:task/View/login_screen.dart';
import 'package:task/widgets/button_widgets.dart';
import 'package:task/widgets/confirm_password_field.dart';
import 'package:task/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emaillController = TextEditingController();
  final mobileController = TextEditingController();
  final addresController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  CollectionReference userData = FirebaseFirestore.instance.collection('Data');
  void addData() async {
    await userData.add({
      "userName": nameController.text,
      "Email": emaillController.text,
      "Password": passwordController.text,
    }).whenComplete(
        () => Fluttertoast.showToast(msg: 'User Successfully Added'));
  }
  @override
  Widget build(BuildContext context) {
    //  User? user =FirebaseAuth.instance.currentUser;
    return BlocProvider(
      create: (context) => EyeIconButtonCubit(true),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Center(
                  child: Text(
                    'Add your details to sign up',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36.h),
                  child: LoginTextField(
                    text: 'Name',
                    controller: nameController,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                LoginTextField(
                  text: 'Email',
                  controller: emaillController,
                ),
                SizedBox(
                  height: 14.h,
                ),
                LoginTextField(text: 'Mobile No', controller: mobileController),
                SizedBox(
                  height: 14.h,
                ),
                LoginTextField(text: 'Address', controller: addresController),
                SizedBox(
                  height: 14.h,
                ),
                ConfirmPasswordField(
                    text: 'Password', passwordController: passwordController),
                SizedBox(
                  height: 14.h,
                ),
                ConfirmPasswordField(
                    text: 'Confirm Password',
                    passwordController: confirmController),
                SizedBox(
                  height: 14.h,
                ),
                Button(
                    titleName: 'Sign Up',
                    onpressed: () async {
                      var password = passwordController.text.trim();
                      var confirmPassword = confirmController.text.trim();
                      if (password != confirmPassword) {
                        Fluttertoast.showToast(msg: 'Both are not same');
                      }
                      if (_formKey.currentState!.validate()) {}
                      try {
                        UserCredential userCrediential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: emaillController.text,
                                password: passwordController.text);

                        CollectionReference ref =
                            FirebaseFirestore.instance.collection('data');

                        ref.doc(userCrediential.user!.uid).set({
                          'name': nameController.text,
                          'email': emaillController.text,
                        });

                        if (userCrediential != null) {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const LoginScreen();
                          // }));
                          addData();
                        }
                      } catch (e) {
                        nameController.text = '';
                        emaillController.text = '';
                        mobileController.text = '';
                        addresController.text = '';
                        passwordController.text = '';
                        confirmController.text = '';
                      }
                    },
                    color: const Color(0xffFC6011),
                    textStyle: TextStyle(color: Colors.white, fontSize: 16.sp)),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(left: 70.w),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Don't have an Account?",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LoginScreen();
                              }));
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Login ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xffFC6011),
                                ),
                              ),
                            )))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}