import 'package:austrotalk/bloc/bottomnav_bloc/bottom_nav_bloc.dart';
import 'package:austrotalk/bloc/language_bloc/language_bloc.dart';
import 'package:austrotalk/bloc/language_bloc/language_event.dart';
import 'package:austrotalk/bloc/language_bloc/language_state.dart';
import 'package:austrotalk/firebase_options.dart';
import 'package:austrotalk/presentation/pages/botNav/bottom_nav.dart';
import 'package:austrotalk/presentation/pages/login/login_page.dart';
import 'package:austrotalk/presentation/pages/splash_page.dart';
import 'package:austrotalk/presentation/widgets/uploadAstrologers.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // Import Firestore
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  final languageCode = prefs.getString('language_code') ?? 'en';

  // Check if the astrologers collection is empty
  // final astrologersCollection = FirebaseFirestore.instance.collection('astrologers');
  // final snapshot = await astrologersCollection.get();
  //
  // if (snapshot.docs.isEmpty) {
  //   // If there are no documents, upload astrologers
  //   await uploadAstrologers();
  // }

  // Run the app
  kIsWeb
      ? runApp(DevicePreview(builder: (context) =>  MyApp(initialLanguage: languageCode,)))
      : runApp(MyApp(initialLanguage: languageCode,));
}

class MyApp extends StatelessWidget {
  final String initialLanguage;
  const MyApp({super.key, required this.initialLanguage});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBloc(),
        ),
        BlocProvider(
          create: (context) => LanguageBloc()..add(ChooseLanguage(languageCode: initialLanguage)),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context,state)
        {
          return MaterialApp(
            locale: Locale(state.selectedLanguage),
            // locale: Locale('hi'),
            supportedLocales: [
              Locale('en'), // English
              Locale('hi'), // Hindi
              Locale('pa'), // Punjabi
              Locale('mr'), // Marathi
              Locale('te'), // Telugu
              Locale('kn'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            debugShowCheckedModeBanner: false,
            home: SplashPage(),
          );
        },
      )
    );
  }
}
