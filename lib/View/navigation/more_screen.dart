import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/View/home_page.dart';
import 'package:task/widgets/button_widgets.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Button(titleName: 'Logout', onpressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return const HomePage();
              }));
        }, color:const  Color(0xFFFC6011), textStyle: TextStyle(
          fontSize: 18.sp
        )),
      ),


    );
  }
}
