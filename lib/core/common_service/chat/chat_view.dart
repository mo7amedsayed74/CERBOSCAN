import 'package:cerboscan/core/common_service/chat/chat_details_view.dart';
import 'package:cerboscan/core/const.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            'Mohamed Sayed',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'How Are You',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/images/boy.jpg'),
          ),
          trailing: Text(
            '12:00pm',
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChatDetailsScreen()),
            );
          },
          child: ListTile(
            title: Text(
              'Mohamed Adel',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'I want to see you today at the clinic',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/mAdel.jpeg'),
            ),
            trailing: Text(
              '11:00pm',
              style: TextStyle(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
