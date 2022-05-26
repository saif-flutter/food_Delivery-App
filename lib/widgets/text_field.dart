import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginTextField extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  const LoginTextField({
    Key? key,
    required this.text, required this.controller,
  }) : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r)
        ),
        child: TextFormField(

          controller: widget.controller,
          validator: (value){
            if (value == null || value.isEmpty) {
            return 'Please Enter the Correct One';
          }
          return null;

          },

          decoration: InputDecoration(


             border: InputBorder.none,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color:  Color(0xffF2F2F2),
              ),
              borderRadius: BorderRadius.circular(25)
            ),
            errorStyle: const TextStyle(
              decoration: TextDecoration.none
              ),

            contentPadding: EdgeInsets.only(
              left: 20.w
            ),

              hintText: widget.text,
              filled: true,
            fillColor: const Color(0xffF2F2F2),

            errorBorder: OutlineInputBorder(
              borderSide:  const BorderSide(color: Color(0xffF2F2F2), ),
              borderRadius: BorderRadius. circular(25.r),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide:  const BorderSide(color: Color(0xffF2F2F2), ),
              borderRadius: BorderRadius. circular(25.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:  const BorderSide(color: Color(0xffF2F2F2), ),
              borderRadius: BorderRadius. circular(25.r),
            ),



              ),


          ),
      ),
    );
  }
}
