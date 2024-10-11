import 'package:austrotalk/presentation/pages/botNav/bottom_nav.dart';
import 'package:austrotalk/presentation/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters
import 'package:country_code_picker/country_code_picker.dart'; // Make sure to import the package

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedCountryCode = '+91';
  final TextEditingController phoneNoController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';

  void getOtp() async
  {
    String phoneNumber = selectedCountryCode + phoneNoController.text.trim();

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async
        {
          await auth.signInWithCredential(credential);
        },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification Failed, Error: ${e.message.toString()}"),)
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          this.verificationId = verificationId;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("OTP Sent to $phoneNumber")),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto retrieval timeout (if Google Play Services is not available)
        setState(() {
          this.verificationId = verificationId;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 16
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap:()
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return BottomNav();
                    }));
                  },
                  child: Text("Skip",style: TextStyle(
                    fontFamily: 'SatoshiMedium',
                    fontSize: 16
                  ),),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: mQuery.size.width * 0.9, // Set container width
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CountryCodePicker(
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    dialogTextStyle: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (code) {
                      setState(() {
                        selectedCountryCode = code.dialCode!; // Update selected country code
                      });
                    },
                    initialSelection: 'IN',
                    favorite: ['+91', 'IN'], // Default to India
                    showCountryOnly: false,
                    showFlag: true,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    builder: (countryCode) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            countryCode!.flagUri!,
                            package: 'country_code_picker',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(width: 12),
                          Text(
                            countryCode.code!,
                            style: TextStyle(
                              fontFamily: 'SatoshiMedium',
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            countryCode.dialCode!,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'SatoshiMedium',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(width: mQuery.size.width * 0.042),
                  // Phone number input
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.grey,
                      controller: phoneNoController,
                      maxLength: 10,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SatoshiMedium',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counter: SizedBox.shrink(),
                        hintText: "Enter Phone Number",
                        hintStyle: TextStyle(
                          fontFamily: 'SatoshiMedium',
                          color: Color(0xffABAFB1),
                        ),
                        contentPadding: EdgeInsets.only(top: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.036),
          GestureDetector(
            onTap: ()
            {
              getOtp();
            },
            child: Container(
              width: mQuery.size.width * 0.9,
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  "Get OTP",
                  style: TextStyle(
                    fontFamily: 'SatoshiBold',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.032),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By Signing up, you agree to our",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'SatoshiMedium',
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " Terms & Condition",
                    style: TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                      fontFamily: 'SatoshiMedium',
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'SatoshiMedium',
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: " \nPrivacy Policy",
                    style: TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                      fontFamily: 'SatoshiMedium',
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
