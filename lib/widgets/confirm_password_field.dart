import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Controller/cubit/eye_icon_button_cubit.dart';

class ConfirmPasswordField extends StatefulWidget {
  final String text;

  const ConfirmPasswordField({
    Key? key,
    required this.text, required this.passwordController,

  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r)
        ),
        child: BlocBuilder<EyeIconButtonCubit, bool>(
          builder: (context, state) {
            return TextFormField(
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please Enter the Correct One';
                }
                return null;
              },
              controller: widget.passwordController,
              textAlignVertical: TextAlignVertical.center,
              textAlign: TextAlign.left,
              obscureText: state,
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
                hintText: widget.text,
                contentPadding: EdgeInsets.only(
                    left: 20.w
                ),
                suffixIcon: IconButton(onPressed: () {
                  if(state == true){
                    context.read<EyeIconButtonCubit>().getIcon(test: false);
                  }
                  else{
                    context.read<EyeIconButtonCubit>().getIcon(test: true);
                  }
                  // setState(() {
                  //   _isObscure = !_isObscure;
                  // });
                }, icon: Icon(state ? Icons.visibility : Icons
                    .visibility_off)),





                filled: true,
                fillColor: const Color(0xffF2F2F2),


                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffF2F2F2),),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide:  const BorderSide(color: Color(0xffF2F2F2), ),
                  borderRadius: BorderRadius. circular(25.r),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffF2F2F2),),
                  borderRadius: BorderRadius.circular(25.r),
                ),


              ),
            );
          },
        ),
      ),
    );
  }
}