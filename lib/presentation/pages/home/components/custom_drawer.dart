import 'package:austrotalk/presentation/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

var user = "User";
var versionNo = "1.1.2";

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: kIsWeb ? mQuery.size.width * 0.015 : mQuery.size.width * 0.05,
                    backgroundImage: const AssetImage("assets/images/astroLogo.webp"),
                  ),
                  SizedBox(width: mQuery.size.width * 0.032),
                  Text(
                    user,
                    style: const TextStyle(
                      fontFamily: 'SatoshiBold',
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(CupertinoIcons.clear, size: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: drawerItem("assets/images/bottomnav_images/selected_home.svg", "Home", Colors.grey.shade500, 18)),
                  drawerItem("assets/images/drawer_images/kalash.svg", "Book a Pooja", null, 20),
                  drawerItem("assets/images/drawer_images/headphone.svg", "Customer Support Chat", null, 20),
                  drawerItem("assets/images/home_images/wallet.svg", "Wallet Transactions", null, 18),
                  drawerItemWithIcon(CupertinoIcons.clock, "Order History", 20),
                  drawerItemWithIcon(CupertinoIcons.bag, "Shop at Astromall", 20),
                  drawerItemWithIcon(CupertinoIcons.person, "Astrology Blog", 20),
                  drawerItem("assets/images/drawer_images/idea.svg", "Chat with Astrologers", null, 18),
                  drawerItem("assets/images/drawer_images/priest.svg", "Talk to Panditji", null, 22),
                  drawerItem("assets/images/drawer_images/free.svg", "Free Services", null, 18),
                  GestureDetector(
                      onTap: ()
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return LoginPage();
                        }));
                      },
                      child: drawerItem("assets/images/drawer_images/login.svg", "Login", null, 16)),
                ],
              ),
            ),
            Expanded(
              flex:0,
                child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Also available on",style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'SatoshiRegular',
                      color: Colors.black
                  ),),
                  SizedBox(height: mQuery.size.height*0.008),
                  SizedBox(
                    width: mQuery.size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/drawer_images/apple.svg",width: 20,),
                        SvgPicture.asset("assets/images/drawer_images/google.svg",width: 20,),
                        SvgPicture.asset("assets/images/drawer_images/youtube.svg",width: 20,),
                        SvgPicture.asset("assets/images/drawer_images/facebook.svg",width: 20,),
                        SvgPicture.asset("assets/images/drawer_images/instagram.svg",width: 20,),
                        SvgPicture.asset("assets/images/drawer_images/linkedin.svg",width: 20,),
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.016),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Version $versionNo",style: TextStyle(
                      fontFamily: 'SatoshiRegular',
                      color: Colors.green,
                      fontSize: 13
                    ),),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget drawerItem(String asset, String title, Color? color, double iconSize) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10.0),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16
          ),
          child: Row(
            children: [
              SvgPicture.asset(asset, width: iconSize, color: color),
              SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SatoshiRegular',
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerItemWithIcon(IconData icon, String title, double iconSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16
          ),
          child: Row(
            children: [
              Icon(icon, size: iconSize),
              SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SatoshiRegular',
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
