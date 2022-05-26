
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodImages extends StatefulWidget {
  final Image image;
  final String text;

  const FoodImages({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  State<FoodImages> createState() => _FoodImagesState();
}

class _FoodImagesState extends State<FoodImages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: widget.image),
        Expanded(
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
