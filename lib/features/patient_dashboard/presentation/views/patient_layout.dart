import 'package:cerboscan/core/common_service/chat/chat_details_view.dart';
import 'package:cerboscan/core/shared_widgets/logout_btn.dart';
import 'package:cerboscan/core/utiles/const.dart';
import 'package:cerboscan/core/shared_widgets/profile_view.dart';
import 'package:cerboscan/features/patient_dashboard/presentation/views/patient_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientLayout extends StatefulWidget {
  const PatientLayout({super.key});

  @override
  State<PatientLayout> createState() => _PatientLayoutState();
}

class _PatientLayoutState extends State<PatientLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: currentIndex == 0 ? primaryColor : Colors.white,
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            color: currentIndex == 0 ? Colors.white : primaryColor,
          ),
        ),
        actions: currentIndex == 2 ? [LogoutBtn()] : null,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            if (currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatDetailsScreen(
                    name: 'Mohamed Sayed',
                    image: 'assets/images/m.jpeg',
                    messages: patientMessages,
                  ),
                ),
              );
              currentIndex = 0;
            }
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
            label: 'Chat',
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
  PatientHome(),
  SizedBox(),
  ProfileView(
    name: 'Mohamed Adel',
    email: 'mohamedAdel@gmail.com',
    phone: '01153262796',
    image: 'assets/images/mAdel.jpeg',
  ),
];

List<String> titles = [
  'Home',
  'Chats',
  'Profile',
];

List<Msg> patientMessages = [
  Msg(
    text: 'Hi Mohamed, How are you!',
    msgFrom: MessageFrom.toReceiver,
  ),
  Msg(
    text: 'I’m fine, Doctor',
    msgFrom: MessageFrom.fromSender,
  ),
  Msg(
    text: 'I want to see you today at the clinic',
    msgFrom: MessageFrom.toReceiver,
  ),
];
