
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  User? user = FirebaseAuth.instance.currentUser;

  // late File  _image;
  // final picker = ImagePicker();
  //
  // Future imagePicker() async
  // {
  //  final pick = await picker.pickImage(source: ImageSource.gallery);
  //
  // setState(() {
  //   if(pick != null)
  //     {
  //       _image = File(pick.path);
  //     }
  // });
  // }



  @override
  Widget build(BuildContext context) {

    return     Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
           // color: Colors.orange,
          //  padding: EdgeInsets.only(top: 50.h),
            margin: EdgeInsets.all(50.sp),
            child: Stack(children: [
            // _image == null
            // ?
            CircleAvatar(
                  radius: 70.r,

                  backgroundImage:  const AssetImage('assets/profile/saif.jpeg')  ),

              //     : CircleAvatar(
              // radius: 70.r,
              //   child: ClipOval(child: Image.file(_image)),
              // ),
              Positioned(
                  bottom: 0,
                  right: -16,
                  child: RawMaterialButton(
                    fillColor: Colors.white12,
                    onPressed: () {
                       //   imagePicker();
                    },
                    elevation: 2.0,
                    shape: CircleBorder(
                      side: BorderSide(
                        width:2.sp,
                        color: Colors.black
                      )
                    ),
                    child:const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.indigo,
                    ),

                    ),
                   // fillColor: const Color.fromARGB(255, 56, 55, 55),



                  ),

            ]),
          ),
        ),
        const SizedBox(
         // color: Colors.red,
          height: 380,


          // child: StreamBuilder(
          //   stream: FirebaseFirestore.instance.collection('data').doc(user!.uid).snapshots(),
          //   builder: (BuildContext context,AsyncSnapshot snapshot)
          //   {
          //
          //     return Text(snapshot.data['name']);
          //  // return ListView.builder(
          //  //     itemCount: snapshot.data!.docs.length,
          //  //     itemBuilder: (BuildContext context, int index)
          //  // {
          //  //   return Padding(
          //  //     padding: const EdgeInsets.all(8.0),
          //  //     child: Column(
          //  //       children: [
          //  //         Container(
          //  //           height: 60.h,
          //  //           decoration: BoxDecoration(
          //  //
          //  //             borderRadius: BorderRadius.circular(20.r),
          //  //             color: const Color(0xFFFC6011),
          //  //           ),
          //  //
          //  //           child: Padding(
          //  //             padding:  EdgeInsets.symmetric(horizontal: 10.h),
          //  //             child: Row(
          //  //               children: [
          //  //                 Expanded(child: Text(snapshot.data!.docs[index]['userName'])),
          //  //
          //  //                 Expanded(
          //  //                     flex: 3,
          //  //                     child: Text(snapshot.data!.docs[index]['Email'])),
          //  //                 Expanded(child: Text(snapshot.data!.docs[index]['Password'])),
          //  //
          //  //               ],
          //  //             ),
          //  //           ),
          //  //         ),
          //  //
          //  //       ],
          //  //     ),
          //  //   );
          //  // }
          //  //
          //  // );
          //   },
          //
          //
          // ),
        )


      ],
    );
  }
}
