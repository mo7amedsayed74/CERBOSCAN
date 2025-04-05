import 'package:cerboscan/core/common_service/person_model.dart';
import 'package:flutter/material.dart';

import '../utiles/const.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key, required this.item,});

  final Person item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: primaryColor,
      child: ListTile(
        title: Text(
          item.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          item.status,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(item.image),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
