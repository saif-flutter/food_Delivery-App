import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Controller/cubit/introduction_screen_cubit.dart';
import 'package:task/View/navigation/bottom_navigation_screen.dart';

final List<String> imagesList = [
  'assets/find_food.png',
  "assets/delivery.png",
  'assets/live_tracking.png',
];

final List<String> titles = [
  'Find Food You Loved',
  'Fast Delivery',
  'Live Tracking',
];

final List<String> description = [
  'Discover the best foods from over 1,000 ',
  'Fast food delivery to your home, office ',
  'Real time tracking of your food on the app ',
];
final List<String> description2 = [
  'restaurants and fast delivery to your doorstep',
  'wherever you are',
  'once you placed the order',
];
class IntroducitonScreens extends StatefulWidget {
  const IntroducitonScreens({Key? key}) : super(key: key);
  @override
  State<IntroducitonScreens> createState() => _IntroducitonScreensState();
}
class _IntroducitonScreensState extends State<IntroducitonScreens> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IntroductionScreenCubit(0),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(top: 100.sp),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BlocBuilder<IntroductionScreenCubit, int>(
                    builder: (context, state) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          height: 500.sp,
                          autoPlay: false,
                          // enlargeCenterPage: true,
                          //scrollDirection: Axis.vertical,
                          onPageChanged: (state, reason) {
                            if (_currentIndex < 2) {
                              _currentIndex++;
                        //      context.read<IntroductionScreenCubit>().getIntroduction(index: 1);
                            } else {
                              _currentIndex = 0;
                            }
                            setState(
                                  () {},
                            );

                           // context.read<IntroductionScreenCubit>().getIntroduction(index: 0);
                            // context.read<IntroductionScreenCubit>().getIntroduction(index: 1);
                            // context.read<IntroductionScreenCubit>().getIntroduction(index: 2);
                          },
                        ),
                        items: [Image.asset(imagesList[_currentIndex],
                        )
                        ],

                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagesList.map((urlOfItem) {
                    int index = imagesList.indexOf(urlOfItem);
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: 10.w,
                      height: 10.h,
                      margin:  EdgeInsets.symmetric(
                          vertical: 10.sp, horizontal: 2.sp),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                        // ? Color.fromRGBO(0, 0, 0, 0.8)
                            ? const Color(0xffFC6011)
                            : const Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          titles[_currentIndex],
                          style: TextStyle(
                              fontSize: 28.sp, color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          description[_currentIndex],
                          style: TextStyle(
                              fontSize: 13.sp, color: const Color(0xff7C7D7E)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          description2[_currentIndex],
                          style: TextStyle(
                              fontSize: 13.sp, color: const Color(0xff7C7D7E)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        width: 307.w,
                        height: 56.h,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(

                              side: const BorderSide(
                                color: Colors.transparent,
                              ),
                              primary: const Color(0xffFC6011),

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.r))),
                          onPressed: _currentIndex < 2
                              ? () {

                            _currentIndex++;
                            imagesList[_currentIndex];
                             setState(() {});
                      //     context.read<IntroductionScreenCubit>().getIntroduction(index: 0);
                            // context.read<IntroductionScreenCubit>().getIntroduction(index: 1);
                            // context.read<IntroductionScreenCubit>().getIntroduction(index: 2);
                          }
                              : () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  return const BottomNavigationScreen();

                                }));
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white,
                                fontSize: 15.sp),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 7,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}







