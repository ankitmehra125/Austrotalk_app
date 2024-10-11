import 'package:austrotalk/data/model/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ChatCard extends StatefulWidget {
  final Chat chat;
  const ChatCard({super.key, required this.chat});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8
      ),
      margin: EdgeInsets.only(
        left: 16, right: 16, top: 16
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0,0)
          )
        ]
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: widget.chat.image,
              ),
              SizedBox(height: mQuery.size.height*0.01,),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemSize: 12,
                itemCount: 5,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  size: 5,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          SizedBox(width: mQuery.size.width*0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.chat.name,style: TextStyle(
                fontFamily: 'SatoshiBold'
              ),),
              Text(widget.chat.type,style: TextStyle(
                fontFamily: 'SatoshiRegular',
                fontSize: 12
              ),),
              Text(widget.chat.languages,style: TextStyle(
                  fontFamily: 'SatoshiRegular',
                  fontSize: 12
              ),),
              Text("EXp: ${widget.chat.exp.toString()} Years",style: TextStyle(
                  fontFamily: 'SatoshiRegular',
                  fontSize: 12
              ),),
              Text("₹ ${widget.chat.price.toStringAsFixed(0)}/min",style: TextStyle(
                  fontFamily: 'SatoshiRegular',
                  fontSize: 12
              ),),
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            children: [
              Icon(Icons.verified,color: Colors.green,),
              SizedBox(height: mQuery.size.height*0.03,),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 1
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
