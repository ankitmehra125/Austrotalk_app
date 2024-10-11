import 'package:austrotalk/bloc/language_bloc/language_bloc.dart';
import 'package:austrotalk/bloc/language_bloc/language_event.dart';
import 'package:austrotalk/bloc/language_bloc/language_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageChangeDialog extends StatefulWidget {
  final List<String> languages;
  final String selectedLanguage;

  const LanguageChangeDialog({
    required this.languages,
    required this.selectedLanguage,
  });

  @override
  _LanguageChangeDialogState createState() => _LanguageChangeDialogState();
}

class _LanguageChangeDialogState extends State<LanguageChangeDialog> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    print("Build 1");
    var mQuery = MediaQuery.of(context);
    List<Map<String, String>> languageData = [
      {"code": "ENG", "name": "English"},
      {"code": "हिन्दी", "name": "Hindi"},
      {"code": "ਪੰਜਾਬੀ", "name": "Punjabi"},
      {"code": "ਮਰਾਠੀ", "name": "Marathi"},
      {"code": "ਤੇਲਗੂ", "name": "Telugu"},
      {"code": "ਕੰਨੜ", "name": "Kannada"},
    ];

    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Choose your app language",
                style: TextStyle(
                  color: Color(0xff09090B),
                  fontSize: 15,
                  fontFamily: 'SatoshiBold',
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.clear,
                  size: 16,
                  color: Color(0xff000000),
                ),
              )
            ],
          ),

          GridView.builder(
            shrinkWrap: true,
            itemCount: languageData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2 / 1.8,
              crossAxisSpacing: mQuery.size.width * 0.02,
              mainAxisSpacing: mQuery.size.height * 0.02,
            ),
            itemBuilder: (context, index) {
              bool isSelected = languageData[index]['code'] == state.selectedLanguage;
              return GestureDetector(
                onTap: () {
                  context.read<LanguageBloc>().add(ChooseLanguage(languageCode: languageData[index]['code']!));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xffFFEB80) : Color(0xfff2f2f2),
                    border: Border.all(
                      color: isSelected ? Color(0xffBFA100) : Colors.transparent
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(languageData[index]['code'] ?? '',style: TextStyle(
                        fontFamily: 'SatoshiBold'
                      ),),
                      SizedBox(height: mQuery.size.height * 0.006),
                      Text(languageData[index]['name'] ?? '',style: TextStyle(
                        fontFamily: 'SatoshiMedium'
                      ),),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: mQuery.size.height*0.032,),
          GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 6
              ),
              decoration: BoxDecoration(
                color: Color(0xffFFEB80),
                borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: Text(
                  "Apply",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'SatoshiBold',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.02),
        ],
      ),
    );
  },
);
  }
}

void showLanguageChangeDialog(BuildContext context, String selectedLanguage) {
  List<String> languages = ['English', 'Hindi', 'Punjabi', 'Marathi', 'Telugu', 'Kannada']; // Your language list

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      return Center(
        child: Container(
          width: double.infinity,
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: LanguageChangeDialog(
              languages: languages,
              selectedLanguage: selectedLanguage,
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation.drive(Tween<double>(begin: 0.5, end: 1.0).chain(CurveTween(curve: Curves.easeInOut))),
          child: child,
        ),
      );
    },
  );
}
