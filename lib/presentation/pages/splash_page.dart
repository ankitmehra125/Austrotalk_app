import 'dart:async';

import 'package:austrotalk/presentation/pages/botNav/bottom_nav.dart';
import 'package:austrotalk/presentation/pages/home/home_page.dart';
import 'package:austrotalk/presentation/pages/login/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    Timer(Duration(seconds: 2),()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return LoginPage();
      }));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: CircleAvatar(
                    radius: kIsWeb ? mQuery.width*0.04 : mQuery.width * 0.15,
                    backgroundImage: AssetImage("assets/images/astroLogo.webp")
                  ),
                );
              },
            ),
            const SizedBox(height: 12),

            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Text("Astrotalk",style: TextStyle(
                    fontFamily: 'SatoshiBold',
                    fontSize: 24
                  ),)
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
