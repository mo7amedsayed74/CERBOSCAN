import 'package:cerboscan/core/const.dart';
import 'package:cerboscan/features/doctor_dashboard/presentation/views/doctor_home.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/views/widgets/login_text_field.dart';

class PatientHistoryView extends StatelessWidget {
  const PatientHistoryView({
    super.key,
    required this.patientInfo,
  });

  final Patient patientInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 8,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(patientInfo.image),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  patientInfo.name,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    customShowDialog(
                      context: context,
                      title: '${patientInfo.name}’s Info.',
                      contentWidget: InfoContent(patientInfo: patientInfo),
                    );
                  },
                  icon: Icon(
                    Icons.info_outline,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Option(
              txt: 'New EEG Record',
              onPressed: () {
                customShowDialog(
                  context: context,
                  title: 'Add EEG Record',
                  contentWidget: AddEEG(),
                );
              },
            ),
            Option(
              txt: 'New Report',
              onPressed: () {},
            ),
            Option(
              txt: 'Show Medical History',
              onPressed: () {},
            ),
            Option(
              txt: 'View Report',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.txt,
    required this.onPressed,
  });

  final String txt;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: TextButton(
          onPressed: onPressed,
          child: Text(txt),
        ),
      ),
    );
  }
}

customShowDialog({
  required BuildContext context,
  required String title,
  required Widget contentWidget,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DialogMainShape(
          title: title,
          contentWidget: contentWidget,
        ),
      ),
    ),
  );
}

class DialogMainShape extends StatelessWidget {
  const DialogMainShape({
    super.key,
    required this.title,
    required this.contentWidget,
  });

  final String title;
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          //height: 100,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: primaryColor),
          ),
          child: contentWidget,
        ),
      ],
    );
  }
}

class InfoContent extends StatelessWidget {
  const InfoContent({
    super.key,
    required this.patientInfo,
  });

  final Patient patientInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginTextField(
          hintText: patientInfo.name,
          enabled: false,
          prefixIcon: Icons.person,
          onSuffixIconPressed: () {},
        ),
        const SizedBox(height: 20),
        // Email field
        LoginTextField(
          keyboardType: TextInputType.emailAddress,
          hintText: patientInfo.mail,
          enabled: false,
          prefixIcon: Icons.email,
          onSuffixIconPressed: () {},
        ),
        const SizedBox(height: 20),
        // Phone field
        LoginTextField(
          keyboardType: TextInputType.phone,
          hintText: patientInfo.phone,
          enabled: false,
          prefixIcon: Icons.phone,
          onSuffixIconPressed: () {},
        ),
      ],
    );
  }
}

class AddEEG extends StatelessWidget {
  const AddEEG({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.file_upload_outlined),
        ),
        Text('Please, upload file with CSV format!'),
      ],
    );
  }
}
