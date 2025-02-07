import 'package:cerboscan/core/const.dart';
import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({
    super.key,
  });

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/mAdel.jpeg'),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Text(
                'Mohamed Adel',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (messages[index].msgFrom == MessageFrom.fromSender) {
                    return buildMessage(
                      text: messages[index].text,
                      messageFrom: MessageFrom.fromSender,
                    );
                  } else {
                    return buildMessage(
                      text: messages[index].text,
                      messageFrom: MessageFrom.toReceiver,
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15.0,
                  );
                },
                itemCount: messages.length,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type your message here ...',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    color: primaryColor,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 1.0,
                      child: const Icon(
                        Icons.send,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMessage({
    required MessageFrom messageFrom,
    required String text,
  }) {
    return Align(
      alignment: messageFrom == MessageFrom.fromSender
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        decoration: messageFrom == MessageFrom.fromSender
            ? BoxDecoration(
                color: primaryColor.withOpacity(0.5),
                borderRadius: const BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(
                    10.0,
                  ),
                  topStart: Radius.circular(
                    10.0,
                  ),
                  topEnd: Radius.circular(
                    10.0,
                  ),
                ),
              )
            : BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(
                    10.0,
                  ),
                  topStart: Radius.circular(
                    10.0,
                  ),
                  topEnd: Radius.circular(
                    10.0,
                  ),
                ),
              ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

enum MessageFrom { fromSender, toReceiver }

class Msg {
  final String text;
  final MessageFrom msgFrom;

  Msg({required this.text, required this.msgFrom});
}

List<Msg> messages = [
  Msg(
    text: 'Hi Mohamed, How are you!',
    msgFrom: MessageFrom.fromSender,
  ),
  Msg(
    text: 'I’m fine, Doctor',
    msgFrom: MessageFrom.toReceiver,
  ),
  Msg(
    text: 'I want to see you today at the clinic',
    msgFrom: MessageFrom.fromSender,
  ),
];
