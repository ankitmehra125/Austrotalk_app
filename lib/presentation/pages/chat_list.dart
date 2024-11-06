import 'package:austrotalk/presentation/widgets/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import '../../data/model/chat.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('astrologers').get(), // Fetch data from Firestore
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // Handle errors
        }

        // Extract data from snapshot
        List<Chat> chats = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Chat(
            imageURL: data['imageURL'], // Store image URL as a string
            name: data['name'],
            type: data['type'],
            languages: data['languages'],
            exp: data['exp'],
            price: (data['price'] as num).toDouble(), // Convert to double
          );
        }).toList();

        return Column(
          children: chats.map((chat) {
            return ChatCard(chat: chat); // Your existing ChatCard
          }).toList(),
        );
      },
    );
  }
}
