import 'package:austrotalk/data/model/astrologer.dart';
import 'package:flutter/material.dart';

class AstrologerCard extends StatelessWidget {
  final Astrologer astrologer;

  AstrologerCard({super.key, required this.astrologer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: astrologer.image,
            radius: 20,
          ),
          SizedBox(height: 6,),
          Text(astrologer.name,style: TextStyle(
            fontSize: 13,
            fontFamily: 'SatoshiMedium'
          ),),
          Text("₹ ${astrologer.price}",style: TextStyle(
              fontSize: 12,
              fontFamily: 'SatoshiRegular'
          ),),
          SizedBox(height: 6,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 1
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 32
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.green
              )
            ),
            child: Center(
              child: Text("Chat",style: TextStyle(
                fontFamily: 'SatoshiMedium',
                fontSize: 13,
                color: Colors.green
              ),),
            ),
          )
        ],
      ),
    );
  }
}
