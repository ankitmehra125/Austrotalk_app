import 'package:austrotalk/presentation/widgets/chat_card.dart';
import 'package:flutter/material.dart';

import '../../data/model/chat.dart';

class ChatList extends StatelessWidget {

  final List<Chat> chats = [
    Chat(AssetImage("assets/images/astrologers_images/madhuPriya.png"),
        name: "Madhu Priya",
        type: "Numerology, Western, Tarot",
        languages: "English,Hindi,Telugu",
        exp: 6,
        price: 25
    ),

    Chat(AssetImage("assets/images/astrologers_images/sunil.jpg"),
        name: "Sunil Singh",
        type: "Vedic, Palmistry, Face Reading",
        languages: "English,Hindi,Sanskrit",
        exp: 7,
        price: 35
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: chats.map((chat){
        return ChatCard(chat: chat);
      }).toList(),
    );
  }
}
