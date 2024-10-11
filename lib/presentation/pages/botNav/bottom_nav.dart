import 'package:austrotalk/bloc/bottomnav_bloc/bottom_nav_bloc.dart';
import 'package:austrotalk/bloc/bottomnav_bloc/bottom_nav_event.dart';
import 'package:austrotalk/bloc/bottomnav_bloc/bottom_nav_state.dart';
import 'package:austrotalk/presentation/pages/chat/chat_page.dart';
import 'package:austrotalk/presentation/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Corrected to use 'List<Widget>'
  final List<Widget> pages = [
    HomePage(),
    ChatPage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          // Use the selected index to display the correct page
          return IndexedStack(
            index: state.selectedIndex,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<BottomNavBloc>().add(TapEvent(index));
            },
            selectedLabelStyle: const TextStyle(
              fontFamily: 'SatoshiRegular',
              fontSize: 13,
              color: Colors.black,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'SatoshiRegular',
              fontSize: 12,
              color: Colors.black87,
            ),
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: state.selectedIndex == 0 ? SvgPicture.asset(
                  "assets/images/bottomnav_images/selected_home.svg",
                  width: 20,
                ) : SvgPicture.asset(
                  "assets/images/bottomnav_images/unchecked_home.svg",
                  width: 20,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: state.selectedIndex == 1 ? SvgPicture.asset(
                  "assets/images/bottomnav_images/selected_chat.svg",
                  width: 20,
                ) : SvgPicture.asset(
                  "assets/images/bottomnav_images/unselected_chat.svg",
                  width: 20,
                ),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: state.selectedIndex == 2 ? SvgPicture.asset(
                  "assets/images/bottomnav_images/selected_live.svg",
                  width: 22,
                ) : SvgPicture.asset(
                  "assets/images/bottomnav_images/unselected_live.svg",
                  width: 20,
                ),
                label: "Live",
              ),
              BottomNavigationBarItem(
                icon: state.selectedIndex == 3 ?  Icon(CupertinoIcons.phone_fill,color: Colors.black,) : Icon(CupertinoIcons.phone,size: 22,),
                label: "Call",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/bottomnav_images/unseleted_remedies.svg",
                  width: 20,
                ),
                label: "Remedies",
              ),
            ],
          );
        },
      ),
    );
  }
}
