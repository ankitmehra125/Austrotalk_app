// import 'package:austrotalk/constants/custom_colors.dart';
// import 'package:animated_hint_textfield/animated_hint_textfield.dart';
// import 'package:austrotalk/presentation/pages/astrologers_list.dart';
// import 'package:austrotalk/presentation/pages/home/components/change_language.dart';
// import 'package:austrotalk/presentation/pages/home/components/wallet_bottomsheet.dart';
// import 'package:austrotalk/presentation/pages/service_list.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:shimmer/shimmer.dart';
// import 'components/custom_drawer.dart'; // Import the CustomDrawer
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   TextEditingController searchController = TextEditingController();
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     var mQuery = MediaQuery.of(context);
//     return Scaffold(
//       key: _scaffoldKey,
//       backgroundColor: Colors.white.withOpacity(0.1),
//       drawer: const CustomDrawer(),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(
//                   vertical: 16,
//                   horizontal: 16
//               ),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         offset: const Offset(0, 0),
//                         blurRadius: 7,
//                         spreadRadius: 0
//                     )
//                   ]
//               ),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       _scaffoldKey.currentState?.openDrawer();
//                     },
//                     child: const Icon(Icons.menu),
//                   ),
//                   SizedBox(width: mQuery.size.width * 0.045),
//                   const Text(
//                     "Astrotalk",
//                     style: TextStyle(
//                       fontFamily: 'SatoshiMedium',
//                       fontSize: 20,
//                     ),
//                   ),
//                   Expanded(child: SizedBox()),
//                   GestureDetector(
//                       onTap: ()
//                       {
//                         walletBottomSheet(context);
//                       },
//                       child: SvgPicture.asset("assets/images/home_images/wallet.svg", width: 20)),
//                   const SizedBox(width: 20),
//                   GestureDetector(
//                       onTap: ()
//                       {
//                         showLanguageChangeDialog(context, "");
//                       },
//                       child: SvgPicture.asset("assets/images/home_images/language.svg")),
//                   const SizedBox(width: 20),
//                   const Icon(CupertinoIcons.person)
//                 ],
//               ),
//             ),
//
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: mQuery.size.height * 0.055,
//                       margin: EdgeInsets.only(
//                           top: 16,
//                           left: 16,
//                           right: 16,
//                           bottom: mQuery.size.height * 0.01
//                       ),
//                       padding: const EdgeInsets.only(right: 16,left: 10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             spreadRadius: 0,
//                             blurRadius: 7,
//                             offset: const Offset(0, 0),
//                           ),
//                         ],
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(CupertinoIcons.search, color: Colors.grey,),
//                           SizedBox(width: mQuery.size.width*0.025,),
//                           Expanded(
//                             child: AnimatedTextField(
//                               animationType: Animationtype.typer,
//                               cursorColor: Colors.grey,
//                               controller: searchController,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: 'SatoshiMedium',
//                                 color: Colors.black,
//                               ),
//                               decoration: InputDecoration(
//                                 hintText: null,
//                                 hintStyle: const TextStyle(
//                                   fontFamily: 'SatoshiMedium',
//                                   color: Colors.grey,
//                                   height: 1.9,
//                                   fontSize: 13,
//                                 ),
//                                 border: InputBorder.none,
//                                 contentPadding: EdgeInsets.only(
//                                     bottom: mQuery.size.height * 0.021),
//                               ),
//                               hintTextStyle: const TextStyle(
//                                   fontSize: 14,
//                                   height: 2,
//                                   color: Colors.black54,
//                                   fontFamily: 'SatoshiRegular'
//                               ),
//                               hintTexts: [
//                                 'Search astrologers, astromall products',
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Container(
//                       margin: EdgeInsets.symmetric(
//                         horizontal: 8
//                       ),
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: ServiceList(),
//                     ),
//                     Column(
//                       children: [
//                         Divider(color: Color(0xfff2f2f2),thickness: 4,),
//                         SizedBox(height: 6,),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.asset("assets/images/home_images/astrobanner.jpg")),
//                         ),
//                         SizedBox(height: 6,),
//                         Divider(color: Color(0xfff2f2f2),thickness: 4,),
//                         SizedBox(height: 6,),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Live Astrologers",style: TextStyle(
//                                   fontFamily: 'SatoshiBold'
//                               ),),
//                               Text("View All",style: TextStyle(
//                                   fontFamily: 'SatoshiMedium',
//                                   color: Colors.grey,
//                                   fontSize: 12
//                               ),)
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: mQuery.size.height*0.01),
//                         SizedBox(
//                           height: 106,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 5,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.only(
//                                   left: 16,
//                                 ),
//                                 child: Shimmer.fromColors(
//                                   baseColor: Colors.grey,
//                                   highlightColor: Colors.black26,
//                                   child: Container(
//                                     width: 90,
//                                     height: 140,
//                                     decoration: BoxDecoration(
//                                       color:  Colors.grey.shade100,
//                                       borderRadius: BorderRadius.circular(6)
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//
//                         SizedBox(height: 6,),
//                         Divider(color: Color(0xfff2f2f2),thickness: 4,),
//                         SizedBox(height: 6,),
//
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Astrologers",style: TextStyle(
//                                   fontFamily: 'SatoshiBold'
//                               ),),
//                               Text("View All",style: TextStyle(
//                                   fontFamily: 'SatoshiMedium',
//                                   color: Colors.grey,
//                                   fontSize: 12
//                               ),)
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: mQuery.size.height*0.01),
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: [
//                               SizedBox(width: 8,),
//                               AstrologersList(),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 30,)
//
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:austrotalk/constants/custom_colors.dart';
import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:austrotalk/presentation/pages/astrologers_list.dart';
import 'package:austrotalk/presentation/pages/home/components/change_language.dart';
import 'package:austrotalk/presentation/pages/home/components/wallet_bottomsheet.dart';
import 'package:austrotalk/presentation/pages/service_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'components/custom_drawer.dart';
import 'components/floating_container.dart'; // Import the CustomDrawer

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white.withOpacity(0.1),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack( // Use Stack to allow floating containers
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(0, 0),
                            blurRadius: 7,
                            spreadRadius: 0
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: const Icon(Icons.menu),
                      ),
                      SizedBox(width: mQuery.size.width * 0.045),
                      const Text(
                        "Astrotalk",
                        style: TextStyle(
                          fontFamily: 'SatoshiMedium',
                          fontSize: 20,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                          onTap: () {
                            walletBottomSheet(context);
                          },
                          child: SvgPicture.asset("assets/images/home_images/wallet.svg", width: 20)),
                      const SizedBox(width: 20),
                      GestureDetector(
                          onTap: () {
                            showLanguageChangeDialog(context, "");
                          },
                          child: SvgPicture.asset("assets/images/home_images/language.svg")),
                      const SizedBox(width: 20),
                      const Icon(CupertinoIcons.person)
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: mQuery.size.height * 0.055,
                          margin: EdgeInsets.only(
                              top: 16,
                              left: 16,
                              right: 16,
                              bottom: mQuery.size.height * 0.01
                          ),
                          padding: const EdgeInsets.only(right: 16,left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0,
                                blurRadius: 7,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.search, color: Colors.grey,),
                              SizedBox(width: mQuery.size.width * 0.025,),
                              Expanded(
                                child: AnimatedTextField(
                                  animationType: Animationtype.typer,
                                  cursorColor: Colors.grey,
                                  controller: searchController,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'SatoshiMedium',
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: null,
                                    hintStyle: const TextStyle(
                                      fontFamily: 'SatoshiMedium',
                                      color: Colors.grey,
                                      height: 1.9,
                                      fontSize: 13,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        bottom: mQuery.size.height * 0.021),
                                  ),
                                  hintTextStyle: const TextStyle(
                                      fontSize: 14,
                                      height: 2,
                                      color: Colors.black54,
                                      fontFamily: 'SatoshiRegular'
                                  ),
                                  hintTexts: [
                                    'Search astrologers, astromall products',
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ServiceList(),
                        ),
                        Column(
                          children: [
                            Divider(color: Color(0xfff2f2f2), thickness: 4,),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset("assets/images/home_images/astrobanner.jpg")),
                            ),
                            SizedBox(height: 6,),
                            Divider(color: Color(0xfff2f2f2), thickness: 4,),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Live Astrologers", style: TextStyle(
                                      fontFamily: 'SatoshiBold'
                                  ),),
                                  Text("View All", style: TextStyle(
                                      fontFamily: 'SatoshiMedium',
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),)
                                ],
                              ),
                            ),
                            SizedBox(height: mQuery.size.height * 0.01),
                            SizedBox(
                              height: 106,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                    ),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey,
                                      highlightColor: Colors.black26,
                                      child: Container(
                                        width: 90,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(6)
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 6,),
                            Divider(color: Color(0xfff2f2f2), thickness: 4,),
                            SizedBox(height: 6,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Astrologers", style: TextStyle(
                                      fontFamily: 'SatoshiBold'
                                  ),),
                                  Text("View All", style: TextStyle(
                                      fontFamily: 'SatoshiMedium',
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),)
                                ],
                              ),
                            ),
                            SizedBox(height: mQuery.size.height * 0.01),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(width: 8,),
                                  AstrologersList(),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Floating containers at the bottom
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingContainer(
                    svg: SvgPicture.asset("assets/images/bottomnav_images/selected_chat.svg"),
                    title: "Chat With Astrologer",
                      color: Colors.yellow
                  ),

                  FloatingContainer(
                    svg: SvgPicture.asset("assets/images/home_images/callIcon.svg",width: 22,),
                    title: "Call With Astrologer",
                      color: Colors.yellow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


