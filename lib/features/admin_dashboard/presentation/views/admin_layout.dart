import 'package:cerboscan/core/shared_widgets/logout_btn.dart';
import 'package:cerboscan/core/utiles/const.dart';
import 'package:cerboscan/features/admin_dashboard/presentation/views/add_doctor_view.dart';
import 'package:cerboscan/features/admin_dashboard/presentation/views/admin_home.dart';
import 'package:cerboscan/core/shared_widgets/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titles[currentIndex]),
        actions: currentIndex == 1
            ? null
            : [
                currentIndex == 2
                    ? LogoutBtn()
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
            icon: Icon(CupertinoIcons.person_add),
            label: 'New Doctor',
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
  AdminHome(),
  AddDoctorView(),
  ProfileView(
    name: 'Ahmed Shalaby',
    email: 'ahmedshalaby@gmail.com',
    phone: '01153262796',
    image: 'assets/images/dr.jpg',
  ),
];

List<String> titles = [
  'Doctors',
  'New Doctor',
  'Profile',
];
