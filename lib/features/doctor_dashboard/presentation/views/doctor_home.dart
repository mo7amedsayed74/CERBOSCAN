import 'package:cerboscan/core/shared_widgets/home_card_widget.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/patient_history_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/common_service/person_model.dart';

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
            child: HomeCardWidget(item: patients[index]),
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

List<Person> patients = [
  Person(
    name: 'Asmaa Ashraf',
    mail: 'asmaaAshraf@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/girl.jpg',
  ),
  Person(
    name: 'Amir Nazmy',
    mail: 'amirNazmy@gmail.com',
    phone: '01153262796',
    status: 'Has Record',
    image: 'assets/images/boy.jpg',
  ),
  Person(
    name: 'Aya Anwer',
    mail: 'ayaAnwer@gmail.com',
    phone: '01153262796',
    status: 'Has Record',
    image: 'assets/images/girl.jpg',
  ),
  Person(
    name: 'Mohamed Adel',
    mail: 'mohamedAdel@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/boy.jpg',
  ),
  Person(
    name: 'Habiba Amr',
    mail: 'habibaAmr@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/girl.jpg',
  ),
  Person(
    name: 'Mohamed Sayed',
    mail: 'mohamedSayed@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/boy.jpg',
  ),
];
