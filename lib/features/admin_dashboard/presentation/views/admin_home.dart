import 'package:cerboscan/core/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Doctors'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: const [
                Card(
                  shadowColor: primaryColor,
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      'Chats',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    leading: Icon(
                      CupertinoIcons.chat_bubble,
                      color: primaryColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                    ),
                  ),
                ),
                Card(
                  shadowColor: primaryColor,
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    leading: Icon(
                      CupertinoIcons.person,
                      color: primaryColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                    ),
                  ),
                ),
                Card(
                  shadowColor: primaryColor,
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      'New Patient',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    leading: Icon(
                      CupertinoIcons.person_add,
                      color: primaryColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return const Card(
              shadowColor: primaryColor,
              child: ListTile(
                title: Text(
                  'Mohamed Sayed',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Has Not Record',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://tse1.mm.bing.net/th?id=OIP.9z2otRrrhtqNmr2ny-FivwHaLG&pid=Api&P=0&w=300&h=300',
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
