import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Controller/data_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Current Locaiton"), value: "Current Location"),
      const DropdownMenuItem(child: Text("Peshawar"), value: "peshawar"),
      const DropdownMenuItem(child: Text("Pabbi"), value: "Pabbi"),
      const DropdownMenuItem(child: Text("Nowshera"), value: "Nowshera"),
      const DropdownMenuItem(child: Text("Mardan"), value: "Mardan"),
      const DropdownMenuItem(child: Text("Attock"), value: "Attock"),
      const DropdownMenuItem(child: Text("Swabi"), value: "Swabi"),
    ];
    return menuItems;
  }

  String selectedValue = "Current Location";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 51.h),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Text(
                  'Good morning Akila!',
                  style: TextStyle(fontSize: 20.sp),
                )),
            Expanded(
              child: SizedBox(
                  height: 20.h,
                  width: 22.h,
                  child: Image.asset('assets/shopping_cart.png')),
            )
          ],
        ),
      ),
      //BottomNavigationScreen(),
      SizedBox(
        //color: Colors.orange,
        height: 40.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Delivering to",
                  style: TextStyle(fontSize: 11.sp),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: DropdownButton(
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff7C7D7E)),
                            iconSize: 0.0,
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: dropdownItems)),
                    // child: Text('Current Location',style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: const Color(0xff7C7D7E)),)),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xffFC6011),
                            ))
                        //  child: Icon(Icons.keyboard_arrow_down,color: Color(0xffFC6011),)
                        )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff7C7D7E),
              size: 30,
            ),
            hintText: 'Search Food',
            hintStyle:
                TextStyle(fontSize: 14.sp, color: const Color(0xffB6B7B7)),
            filled: true,
            fillColor: const Color(0xffF2F2F2),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffF2F2F2),
              ),
              borderRadius: BorderRadius.circular(25.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xffF2F2F2),
              ),
              borderRadius: BorderRadius.circular(25.r),
            ),
          ),
        ),
      ),
      SizedBox(
        // color: Colors.red,
        height: 160.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: DataController.getAllMenu().length,
            itemBuilder: (context, index) {
              var menus = DataController.getAllMenu()[index];
              return Padding(
                padding: EdgeInsets.only(top: 15.h, left: 21.w),
                child: Column(
                  children: [
                    Expanded(child: Image.asset(menus.image)),
                    Expanded(
                        child: Text(menus.title.toString(),
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold)))
                  ],
                ),
              );
            }),
      ),

      Container(
        padding: EdgeInsets.only(left: 21.w, right: 13.w),
        height: 30.h,
        //  color: Colors.orange,
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Text(
                'Popular Restaurents',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.sp),
              ),
            ),
            Expanded(
              //  flex: 0,
              child: Text(
                'view all',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                    color: const Color(0xffFC6011)),
              ),
            ),
          ],
        ),
      ),

      SizedBox(
        height: 14.h,
      ),

      ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: DataController.getMostPopular().length,
          itemBuilder: (context, index) {
            var mostPopular = DataController.getMostPopular()[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10.sp),
              height: 200.h,
              // color: Colors.red,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 6,
                      child: Image.asset(
                        mostPopular.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 21.sp),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          mostPopular.title,
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                      child: Container(
                    //   color: Colors.white,
                    padding: EdgeInsets.only(left: 21.w),
                    // color: Colors.red,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xffFC6011),
                                ),
                              )),
                          const Expanded(
                              flex: 1,
                              child: Text(
                                '4.9  ',
                                style: TextStyle(color: Color(0xffFC6011)),
                              )),
                          Expanded(
                              flex: 10,
                              child: Text(
                                '(124 ratings) Café     Western Food',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xffB6B7B7)),
                              ))
                        ],
                      ),
                    ),
                  )),

                  // Spacer(flex: 1,),
                ],
              ),
            );
          }),

      Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Container(
          padding: EdgeInsets.only(left: 21.w, right: 13.w),
          height: 30.h,
          //       color: Colors.orange,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  'Most Popular',
                  style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 20.sp),
                ),
              ),
              Expanded(
                child: Text(
                  'view all',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13.sp,
                      color: const Color(0xffFC6011)),
                ),
              ),
            ],
          ),
        ),
      ),

      SizedBox(
        // color: Colors.yellow,
        height: 225.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: DataController.getPopular().length,
            itemBuilder: (context, index) {
              var popular = DataController.getPopular()[index];
              return Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 21.w),
                  child: SizedBox(
                      //  color: Colors.red,
                      // height: 200.h,
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r)),
                            // height: 150.h,
                            // width: 280.w,
                            child: Image.asset(
                              popular.image,
                              fit: BoxFit.cover,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 6.h,
                          ),
                          child: Text(
                            popular.title,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: Text(
                                ' Café     Western Food',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xffB6B7B7)),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            const Expanded(
                                flex: 0,
                                child: Icon(
                                  Icons.star,
                                  color: Color(0xffFC6011),
                                )),
                            const Expanded(
                                flex: 0,
                                child: Text(
                                  '4.9  ',
                                  style: TextStyle(color: Color(0xffFC6011)),
                                )),
                          ],
                        ),
                      )
                    ],
                  )));
            }),
      ),
      Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: Container(
          padding: EdgeInsets.only(left: 21.w, right: 13.w),
          height: 30.h,
          //       color: Colors.orange,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  'Recent Items',
                  style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 20.sp),
                ),
              ),
              Expanded(

                child: Text(
                  'view all',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13.sp,
                      color: const Color(0xffFC6011)),
                ),
              ),
            ],
          ),
        ),
      ),

      SizedBox(
        height: 370,
        //color: Colors.yellow,
        child: ListView.builder(
          primary: false,
          itemCount: DataController.getRecent().length,
          itemBuilder: (context, index) {
            var recentItem = DataController.getRecent()[index];
            return SizedBox(
                height: 120.h,
                //    color: Colors.orange,
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 21.w),
                      child: Image.asset(
                        recentItem.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.only(
                            left: 10.w,
                          ),
                          // color: Colors.orange,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 14.h),
                                    child: Text(
                                      recentItem.title,
                                      style: TextStyle(
                                          color: const Color(0xff4A4B4D),
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 6.h, bottom: 4.h),
                                      // color: Colors.red,
                                      child: Text(
                                        'Café     Western Food',
                                        style: TextStyle(
                                            color: const Color(0xffB6B7B7),
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 29.h),
                                  child: Container(
                                    padding: EdgeInsets.zero,
                                    //   color: Colors.black,
                                    child: Row(
                                      children: [
                                        const Expanded(

                                            child: Icon(
                                              Icons.star,
                                              color: Color(0xffFC6011),
                                            )),
                                        const Expanded(

                                            child: Text(
                                              '4.9  ',
                                              style: TextStyle(
                                                  color: Color(0xffFC6011)),
                                            )),
                                        Expanded(
                                          flex: 6,
                                          child: Text(
                                            '(124 Ratings)',
                                            style: TextStyle(
                                                color: const Color(0xffB6B7B7),
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ])))
                ]));
          },
        ),
      )
    ]));
  }
}
