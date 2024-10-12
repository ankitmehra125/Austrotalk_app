import 'dart:developer';

import 'package:austrotalk/presentation/pages/botNav/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  String verificationId;

  OtpPage({super.key, required this.verificationId});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("OTP Page"),
      ),
      body: Column(
        children: [
          TextField(
            controller: otpController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential =
                      await PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otpController.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return BottomNav();
                    }));
                  });
                } catch (ex) {
                  log(ex.toString());
                }
              },
              child: Text("OTP"))
        ],
      ),
    );
  }
}
