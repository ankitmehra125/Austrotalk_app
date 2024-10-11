import 'package:austrotalk/bloc/bottomnav_bloc/bottom_nav_bloc.dart';
import 'package:austrotalk/bloc/language_bloc/language_bloc.dart';
import 'package:austrotalk/firebase_options.dart';
import 'package:austrotalk/presentation/pages/botNav/bottom_nav.dart';
import 'package:austrotalk/presentation/pages/login/login_page.dart';
import 'package:austrotalk/presentation/pages/splash_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  kIsWeb ? runApp(DevicePreview(builder: (context) {
    return MyApp();
  })) : runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return BottomNavBloc();
          },
        ),
        BlocProvider(
          create: (context) => LanguageBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
