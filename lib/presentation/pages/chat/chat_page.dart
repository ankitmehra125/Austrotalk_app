import 'package:austrotalk/constants/custom_colors.dart';
import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:austrotalk/presentation/pages/astrologers_list.dart';
import 'package:austrotalk/presentation/pages/chat_list.dart';
import 'package:austrotalk/presentation/pages/home/components/change_language.dart';
import 'package:austrotalk/presentation/pages/service_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../home/components/custom_drawer.dart';
// Import the CustomDrawer

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
        child: Column(
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
                    "Chat with Astrologer",
                    style: TextStyle(
                      fontFamily: 'SatoshiRegular',
                      fontSize: 17,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  SvgPicture.asset("assets/images/chat_images/filter.svg", width: 18),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ChatList()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
