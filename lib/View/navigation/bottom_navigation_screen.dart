import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/Controller/cubit/bottom_navigation_bar_cubit.dart';
import 'package:task/View/navigation/home_screen.dart';
import 'package:task/View/navigation/more_screen.dart';
import 'package:task/View/navigation/profile_screen.dart';

import 'offer_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
        return SafeArea(
      child: BlocProvider(
        create: (context) => BottomNavigationBarCubit(0),
        child: Scaffold(
            floatingActionButton: SizedBox(
              height: 60.h,
              width: 60.w,
              child: FloatingActionButton(
                backgroundColor: const Color(0xffFC6011),
                onPressed: () {},
                child: const Icon(Icons.home),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: PageView(
                controller: controller,
                onPageChanged: (x) {},
                children: const [
                  HomeScreen(),
                  OfferScreen(),
                  ProfileScreen(),
                  MoreScreen()
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 50.h,
              color: Colors.white,
              child: BlocBuilder<BottomNavigationBarCubit, int>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              controller.jumpToPage(0);
                              context
                                  .read<BottomNavigationBarCubit>()
                                  .getIndex(index: 0);

                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.home,
                                  color: state == 0
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )),
                          Expanded(
                            child: Text(
                              "Menu",
                              style: TextStyle(
                                  color: state == 0
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              controller.jumpToPage(1);

                              context
                                  .read<BottomNavigationBarCubit>()
                                  .getIndex(index: 1);
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.shopping_bag_outlined,
                                  color: state == 1
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )),
                          Expanded(
                            child: Text(
                              "Offers",
                              style: TextStyle(
                                  color: state== 1
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              controller.jumpToPage(2);
                              context
                                  .read<BottomNavigationBarCubit>()
                                  .getIndex(index: 2);
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.person,
                                  color: state == 2
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )),
                          Expanded(
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                  color: state == 2
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )
                        ]),
                      ),
                      Expanded(
                        child: Column(children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              controller.jumpToPage(3);
                              context
                                  .read<BottomNavigationBarCubit>()
                                  .getIndex(index: 3);
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(Icons.read_more,
                                  color: state == 3
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )),
                          Expanded(
                            child: Text(
                              "More",
                              style: TextStyle(
                                  color: state == 3
                                      ? Colors.red
                                      : const Color(0xffB6B7B7)),
                            ),
                          )
                        ]),
                      ),
                    ],
                  );
                },
              ),
            )),
      ),
    );
  }
}
