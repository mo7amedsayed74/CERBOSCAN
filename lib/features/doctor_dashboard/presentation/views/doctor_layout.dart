import 'package:cerboscan/core/common_service/chat/chat_view.dart';
import 'package:cerboscan/core/const.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/doctor_home.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/new_patient_view.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorLayout extends StatefulWidget {
  const DoctorLayout({super.key});

  @override
  State<DoctorLayout> createState() => _DoctorLayoutState();
}

class _DoctorLayoutState extends State<DoctorLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titles[currentIndex]),
        actions: currentIndex == 2
            ? null
            : [
                currentIndex == 3
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
              ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: primaryColor,
        selectedItemColor: const Color(0xFFFFFFFF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
            label: 'New Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

List<Widget> screens = [
  DoctorHome(),
  Chats(),
  NewPatientView(),
  ProfileView(),
];

List<String> titles = [
  'Patient',
  'Chats',
  'New Patient',
  'Profile',
];
