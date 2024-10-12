import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc package
import 'package:austrotalk/bloc/bottomsheet_bloc/bottomsheet_bloc.dart';

import '../../../../bloc/bottomsheet_bloc/bottomsheet_event.dart';
import '../../../../bloc/bottomsheet_bloc/bottomsheet_state.dart'; // Import your Bloc

var balance = 0;

class WalletBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomsheetBloc(),
      child: WalletBottomSheetContent(),
    );
  }
}

class WalletBottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build 1");
    var mQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      height: mQuery.size.height * 0.43,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Color(0xfff3f6ff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quick Recharge",
                style: TextStyle(fontFamily: 'SatoshiMedium'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.clear,
                  size: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: mQuery.size.height * 0.023),
          Container(
            width: double.infinity,
            height: mQuery.size.height * 0.055,
            padding: const EdgeInsets.only(right: 16, left: 10),
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
                SvgPicture.asset(
                  "assets/images/home_images/greenWallet.svg",
                  width: 20,
                ),
                SizedBox(width: mQuery.size.width * 0.032),
                Text(
                  "Astrotalk Wallet",
                  style: TextStyle(
                    fontFamily: 'SatoshiMedium',
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "₹ $balance",
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'SatoshiMedium'),
                )
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.023),
          BlocBuilder<BottomsheetBloc, BottomsheetState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSelectableContainer(mQuery, 0, "Buy ₹ 25", "Get INR 50", state.selectedIndex, context),
                    buildSelectableContainer(mQuery, 1, "Buy ₹ 50", "Get INR 100", state.selectedIndex, context),
                    buildSelectableContainer(mQuery, 2, "Buy ₹ 100", "Get INR 200", state.selectedIndex, context),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSelectableContainer(
      MediaQueryData mQuery, int index, String title, String subtitle, int selectedIndex, BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomsheetBloc>(context).add(ChangeIndex(index)); // Dispatch event on tap
      },
      child: Container(
        width: mQuery.size.width * 0.25,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectedIndex == index ? Color(0xff5aa23f) : Colors.grey.shade300,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(child: Text(title,style: TextStyle(
              fontFamily: 'SatoshiMedium',
              fontSize: 13
            ),)),
            Expanded(child: SizedBox()),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)
                )
              ),
              child: Center(
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'SatoshiRegular',
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void walletBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => WalletBottomSheet(),
  );
}
