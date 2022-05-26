import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatefulWidget {

  final String titleName;
  final VoidCallback onpressed;
  final Color color;
  final TextStyle textStyle;


   const Button({
    Key? key,
    required this.titleName, required this.onpressed,required this.color ,
     required this.textStyle,

  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
   late VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 34.w),
      child: SizedBox(
        // padding:  EdgeInsets.symmetric(vertical: 30.h, ),
        width: 307.w,
        height: 56.h,
        child: ElevatedButton(

            style: ElevatedButton.styleFrom(
                primary: widget.color,
                side: const BorderSide(
                  color: Color(0xffFC6011)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                )),

            onPressed: widget.onpressed,
            child: Text(widget.titleName,style: widget.textStyle,)
            ),
      ),
    );
  }
}