import 'package:flutter/material.dart';

import '../../../../core/common_service/person_model.dart';
import '../../../../core/shared_widgets/home_card_widget.dart';
import '../../../doctor_dashboard/presentation/views/patient_history_view.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              customShowDialog(
                context: context,
                title: '${doctors[index].name}’s Info.',
                contentWidget: InfoContent(patientInfo: doctors[index]),
              );
            },
            child: HomeCardWidget(item: doctors[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8);
        },
        itemCount: doctors.length,
      ),
    );
  }
}


List<Person> doctors = [
  Person(
    name: 'Aya Anwer',
    mail: 'ayaAnwer@gmail.com',
    phone: '01153262796',
    status: 'Has Record',
    image: 'assets/images/girl.jpg',
  ),
  Person(
    name: 'Habiba Amr',
    mail: 'habibaAmr@gmail.com',
    phone: '01153262796',
    status: 'Has Not Record',
    image: 'assets/images/girl.jpg',
  ),
];
