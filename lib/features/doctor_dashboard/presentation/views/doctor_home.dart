import 'package:cerboscan/core/const.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/patient_history_view.dart';
import 'package:flutter/material.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PatientHistoryView(
                    patientInfo: patients[index],
                  ),
                ),
              );
            },
            child: Card(
              shadowColor: primaryColor,
              child: ListTile(
                title: Text(
                  patients[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  patients[index].status,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(patients[index].image),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
        itemCount: patients.length,
      ),
    );
  }
}

class Patient {
  final String name;
  final String mail;
  final String phone;
  final String status;
  final String image;

  Patient({required this.mail, required this.phone, required this.name, required this.status, required this.image});
}

List<Patient> patients = [
  Patient(
    name: 'Asmaa Ashraf',
    mail: 'asmaaAshraf@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/girl.jpg',
  ),
  Patient(
    name: 'Amir Nazmy',
    mail: 'amirNazmy@gmail.com',
    phone: '01153262796',
    status: 'Has Record',
    image: 'assets/images/boy.jpg',
  ),
  Patient(
    name: 'Aya Anwer',
    mail: 'ayaAnwer@gmail.com',
    phone: '01153262796',
    status: 'Has Record',
    image: 'assets/images/girl.jpg',
  ),
  Patient(
    name: 'Mohamed Adel',
    mail: 'mohamedAdel@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/boy.jpg',
  ),
  Patient(
    name: 'Habiba Amr',
    mail: 'habibaAmr@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/girl.jpg',
  ),
  Patient(
    name: 'Mohamed Sayed',
    mail: 'mohamedSayed@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/boy.jpg',
  ),
];
